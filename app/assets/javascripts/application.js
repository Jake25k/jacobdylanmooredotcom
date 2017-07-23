//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require homepage
//= require static
//= require projects
//= require tinymce
//= require autocomplete


$(document).on('turbolinks:load', function() {
    tinymce.init({
        selector: 'textarea',
        browser_spellcheck: true,
        toolbar: "undo redo | bold italic underline | bullist numlist | indent outdent | pastetext | uploadimage",
        plugins: "wordcount paste image link media uploadimage autoresize",
        file_picker_types: 'image media'
    });

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1755385154759744',
            cookie     : true,
            xfbml      : true,
            version    : 'v2.8'
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
});