//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require homepage
//= require static
//= require projects
//= require tinymce
//= require_tree .



tinymce.init({
    selector: 'textarea',
    toolbar: "undo redo | bold italic underline | bullist numlist | indent outdent | pastetext | uploadimage",
    plugins: 'wordcount paste image link media uploadimage autosave',
    file_picker_types: 'image media'
});