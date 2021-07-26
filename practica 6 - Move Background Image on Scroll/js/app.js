$(window).scroll(function() {
    var scrollPosition = $(window).scrollTop() / 8;
    $('section').css({
        'background-position-x': -scrollPosition + 'px'
    })
});