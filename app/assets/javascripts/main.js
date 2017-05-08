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

    if($('#time').length){
        startTime();
    }

    // $('.ui.checkbox')
    //     .checkbox()
    // ;

    $('.ui.button').on('click', function(){
        $(this).addClass('loading');
    });


    $(".ui.button").removeClass('loading');

    $('.ui.dropdown').dropdown();

    $('.ui.radio.checkbox').checkbox();
});

function toggle_alert() {
    location.reload();
    return confirm('You are about to toggle the submission period, are you sure?');
}

function submission_alert() {
    this.removeClass('loading');
    return confirm('You can only submit once per submission period, are you sure?');
}

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