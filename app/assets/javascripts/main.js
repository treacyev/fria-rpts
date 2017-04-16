
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

    startTime();
});

function startTime() {
    var today = new Date();
    currentTime = $('#time').data('time');
    today.setTime = currentTime;
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('time').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}

function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}