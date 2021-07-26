$(document).ready(function() {
    //*jquery para toggle sub menu
    $('.sub-btn').click(function() {
        $(this).next('.sub-menu').slideToggle();
        $(this).find('.dropdown').toggleClass('rotate');
    });

    //*jquery para expandir sidebar
    $('.menu-btn').click(function() {
        $('.side-bar').addClass('active');
        $('.menu-btn').css("visivility", "hidden");
    });

    //*jquery para colapsar sidebar
    $('.close-btn').click(function() {
        $('.side-bar').removeClass('active');
        $('.close-btn').css("visivility", "hidden");
    });
});