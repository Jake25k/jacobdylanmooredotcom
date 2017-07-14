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
        plugins: 'wordcount paste image link media uploadimage',
        content_style: ".mce-content-body {font-size:15px;font-family:Calibri}",
        file_picker_types: 'image media'
    });
});