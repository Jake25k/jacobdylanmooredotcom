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
        theme: "modern",
        toolbar: "bold,italic,underline,|,bullist,numlist,outdent,indent,|,undo,redo,|, uploadimage",
        plugins: ["uploadimage, link, media"],
        relative_urls: false,
        remove_script_host: false,
        browser_spellcheck: true,
        document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/",
        content_style: '.mce-content-body img{ max-width: 750px !important; max-height: 550px; }'
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
});