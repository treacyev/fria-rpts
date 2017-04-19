
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
});

$('.ui.radio.checkbox')
	.checkbox()
;

