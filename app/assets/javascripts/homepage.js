var ready = function() {
    $(".leading-photo").fadeIn(2500);
    // setTimeout(function() { $(".fadePanel2").fadeIn(400); }, 400);
    // setTimeout(function() { $(".fadePanel3").fadeIn(400); }, 800);
    // setTimeout(function() { $(".fadePanel4").fadeIn(400); }, 1200);
    // setTimeout(function() { $(".fadePanel5").fadeIn(400); }, 1600);
    // setTimeout(function() { $(".fadePanel6").fadeIn(400); }, 2000);
};

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        $("#back-to-top").fadeIn();
    } else {
        $("#back-to-top").fadeOut();
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    $('html, body').animate({scrollTop : 0},800);; // For Chrome, Safari and Opera
    document.documentElement.scrollTop = 0; // For IE and Firefox
}

$(document).on('turbolinks:load', ready);