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
        toolbar: "bold,italic,underline,|,bullist,numlist,outdent,indent,|,undo,redo,|,pastetext,pasteword,selectall,|,uploadimage",
        pagebreak_separator: "<p class='page-separator'>&nbsp;</p>",
        plugins: ["uploadimage"],
        relative_urls: false,
        remove_script_host: false,
        document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/",
    });
});