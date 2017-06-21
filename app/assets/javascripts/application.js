//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require homepage
//= require static
//= require projects
//= require tinymce-jquery
//= require_tree .

tinymce.init({
    selector: 'textarea',
    toolbar: "bold italic underline bullist numlist outdent indent undo redo pastetext pasteword selectall uploadimage",
    plugins: 'wordcount paste image link media uploadimage',
    file_picker_types: 'image media'
});