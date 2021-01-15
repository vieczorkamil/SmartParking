#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include <SoftwareSerial.h>
#include <LiquidCrystal_I2C.h>

String myString;
char rdata;

LiquidCrystal_I2C lcd(0x27, 16, 2);

const char *ssid = "****************";                                          
const char *password = "****************";                                            
const char *serverName = "http://****************/SmartParking/post_data.php";

String apiKeyValue = "a5e4d1ab-6115-4e7f-b1f3-551b4ca4da85";// API Key value to be compatible with the PHP code

String temperatura;
String zagrozenie;
String gas_level[3];
String parkingData[6];
String id_parking = "1";

void setup()
{
    lcd.init();
    lcd.begin(16, 2);
    lcd.backlight();
    lcd.setCursor(0, 0);
    Serial.begin(115200);
    Serial.println("Connecting to ");
    Serial.println(ssid);

    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(1000);
        Serial.print(".");
    }
    Serial.println("");
    Serial.println("Connected to WiFi");
    Serial.print("IP: ");
    Serial.println(WiFi.localIP());
}
void loop()
{
    unsigned long currentTime, sendTime;
    currentTime = millis();

    if (Serial.available() > 0)
    {
        temperatura = "";
        rdata = Serial.read();
        myString = myString + rdata;
        if (rdata == '\n')
        {
            for (int i = 0; i < 5; i++)
            {
                temperatura += myString[i];
            }

            //gas_level
            zagrozenie = myString[5];

            for (int i = 6; i < 12; i++)
            {
                parkingData[i - 6] = myString[i];
            }
            for (int i = 12; i < 15; i++)
            {
                gas_level[i - 12] = myString[i];
            }

            lcd.clear();
            lcd.print("Liczba miejsc: ");
            lcd.print(parkingData[0]);
            lcd.setCursor(2, 1);
            lcd.print("Uklad: ");
            lcd.print(parkingData[1]);
            lcd.print(parkingData[2]);
            lcd.print(parkingData[3]);
            lcd.print(parkingData[4]);
            lcd.print(parkingData[5]);

            pushData();
            myString = "";
        }
    }
}
void pushData()
{
    if (WiFi.status() == WL_CONNECTED)
    {
        HTTPClient http;

        // Your Domain name with URL path or IP address with path
        http.begin(serverName);

        // HTTP POST request data
        String httpRequestData = "api_key=" + apiKeyValue + "&ID_parking=" + id_parking + "&Temperature=" + temperatura + "&Gas_level=" + gas_level[0] + gas_level[1] + gas_level[2] + "&Fire_hazard=" + zagrozenie + "&Spot1=" + parkingData[1] + "&Spot2=" + parkingData[2] + "&Spot3=" + parkingData[3] + "&Spot4=" + parkingData[4] + "&Spot5=" + parkingData[5] + "";
        Serial.print("httpRequestData: ");
        Serial.println(httpRequestData);

        // Send HTTP POST request
        int httpResponseCode = http.POST(httpRequestData);

        if (httpResponseCode > 0)
        {
            Serial.print("HTTP Response code: ");
            Serial.println(httpResponseCode);
        }
        else
        {
            Serial.print("Error code: ");
            Serial.println(httpResponseCode);
        }
        // Free resources
        http.end();
    }
    else
    {
        Serial.println("WiFi Disconnected");
    }
}
