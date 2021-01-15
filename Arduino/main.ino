#include <SPI.h>
#include <MFRC522.h>
#include <PWMServo.h>
#include <Wire.h>
#include <OneWire.h>
#include <SoftwareSerial.h>
#include <DallasTemperature.h>
#include <MQ2.h>

PWMServo myServo;
OneWire term(A5);
DallasTemperature czujnikT(&term);
MFRC522 rfid(10, 8); //(10 ,9)
MFRC522::MIFARE_Key key;
SoftwareSerial sCom(2, 3);
const byte RFID[][4] = {{0x76, 0x61, 0x5A, 0x29},
                        {0x97, 0xCD, 0x45, 0xB3}}; //identyfikator naszej karty

//numery pinów
const int irIn1 = 7;
const int irIn2 = 6;
const int ir1 = 5;
const int ir2 = 4;
const int ir3 = A1;
const int ir4 = A0;
const int ir5 = A3;
const int mq2 = A2;
const int temperatura = A5;
const int ogien = A4;

//zmienne globalne
unsigned long currentTime = 0;
unsigned long barrierTime = 0;
unsigned long serialTime = 0;
float temperaturaWartosc;
char coWartosc[4];//00x'\0'
int i;
int ileKart = sizeof(RFID) / sizeof(byte) / 4;
int parking1;
int parking2;
int parking3;
int parking4;
int parking5;
volatile int zajeteMiejsca = 0;
volatile int wolneMiejsca = 0;
volatile int zagrozenie;
volatile int co;
String sData = "";

MQ2 czujnikMQ2(mq2);

void setup()
{
    Serial.begin(9600);
    sCom.begin(115200);
    SPI.begin();
    rfid.PCD_Init();
    myServo.attach(9);
    pinMode(irIn1, INPUT);
    pinMode(irIn2, INPUT);
    pinMode(ir1, INPUT);
    pinMode(ir2, INPUT);
    pinMode(ir3, INPUT);
    pinMode(ir4, INPUT);
    pinMode(ir5, INPUT);
    pinMode(ogien, INPUT);
    myServo.write(60);
    czujnikMQ2.begin();
}

void loop()
{
    currentTime = millis();
    float* values= czujnikMQ2.read(true);
    co = values[1];
    //czujnik temperatury
    czujnikT.requestTemperatures();
    temperaturaWartosc = czujnikT.getTempCByIndex(0);
    Serial.println(co);
    snprintf(coWartosc,sizeof(coWartosc), "%03d", co);
    Serial.println(coWartosc);

   
    if (digitalRead(ogien) == LOW || co > 10)
    {
        myServo.write(140);
        zagrozenie = 1;
    }
    else
    {
        zagrozenie = 0;
    }

    if (rfid.PICC_IsNewCardPresent() && rfid.PICC_ReadCardSerial())
    {
        for (i = 0; i < ileKart; i++)
        {
            if (rfid.uid.uidByte[0] == RFID[i][0] && rfid.uid.uidByte[1] == RFID[i][1] && rfid.uid.uidByte[2] == RFID[i][2] && rfid.uid.uidByte[3] == RFID[i][3])
            {
                myServo.write(140);
            }
        }
    }
    //zabezpieczenie przed zamknięciem szlabanu przed odjechaniem samochodu
    if ((digitalRead(irIn1) == HIGH && digitalRead(irIn2) == HIGH) && zagrozenie == 0)
    {
        if (currentTime - barrierTime >= 5000UL)
        {
            //podwójne zabezpieczenie
            if ((digitalRead(irIn1) == HIGH && digitalRead(irIn2) == HIGH) && zagrozenie == 0)
            {
                barrierTime = currentTime;
                myServo.write(60);
               // Serial.print("drugi : ");
                //Serial.println(digitalRead(irIn1));
            }
        }
    }
    //sprawdzanie które miejsca są zajęte
    if (digitalRead(ir1) == LOW)
        parking1 = 1;
    else
        parking1 = 0;
    if (digitalRead(ir2) == LOW)
        parking2 = 1;
    else
        parking2 = 0;
    if (digitalRead(ir3) == LOW)
        parking3 = 1;
    else
        parking3 = 0;
    if (digitalRead(ir4) == LOW)
        parking4 = 1;
    else
        parking4 = 0;
    if (digitalRead(ir5) == LOW)
        parking5 = 1;
    else
        parking5 = 0;
    //suma zajętych miejsc
    zajeteMiejsca = parking1 + parking2 + parking3 + parking4 + parking5;
    wolneMiejsca = 5 - zajeteMiejsca;
    //wysyłanie danych do wemosa
    if (currentTime - serialTime >= 500UL)
    {
        serialTime = currentTime;
        pushData();
    }
}

void pushData()
{
    sData = sData + temperaturaWartosc + zagrozenie + wolneMiejsca + parking1 + parking2 + parking3 + parking4 + parking5 + coWartosc;
    sCom.println(sData);
    sData = "";
}
