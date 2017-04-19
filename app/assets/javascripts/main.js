var serverTime;
var today;
$(document).ready(function(){
    $('.message .close')
    .on('click', function() {
        $(this)
        .closest('.message')
        .transition('fade')
        ;
        console.log("hi");
    })
    ;
    serverTime = $('#time').data('time') * 1000;
    today = new Date();
    startTime();

    // $('.ui.checkbox')
    //     .checkbox()
    // ;

    $('.ui.dropdown').dropdown();
});




function startTime() {
    today.setTime(serverTime);
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('time').innerHTML =
    h + ":" + m + ":" + s;
    serverTime = serverTime + 1000;
    setTimeout(startTime, 1000);
}

function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}