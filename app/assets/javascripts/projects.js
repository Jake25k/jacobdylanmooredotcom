// var ready = function() {
//     $(".parallax-projects").fadeIn(2500);
// }
//
// $(document).on('turbolinks:load', ready);


$(document).on('turbolinks:load', function() {
    $("#selector").change(function () {
        choice = $('select[id=selector]').val();
        if (choice != "nil") {
            $.post('projects/render/chosenProjects', {project_type: choice}, function (partial) {
                $('#renderedTable').html(partial)
            })
            $(".tableToDissapear").slideUp()
            $('#renderedTable').slideUp();
            $('#renderedTable').slideDown();
        }
        else {
            $(".tableToDissapear").slideDown();
            $('#renderedTable').slideUp();
        }
    });
})