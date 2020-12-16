function time() {
    var day = new Date();

    var hour = day.getHours();
    if (hour < 10) hour = "0" + hour;

    var minute = day.getMinutes();
    if (minute < 10) minute = "0" + minute;

    var second = day.getSeconds();
    if (second < 10) second = "0" + second;

    document.getElementById("timer").innerHTML = hour + ":" + minute + ":" + second;

    setTimeout("time()", 1000);
}