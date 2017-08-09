// var ready = function() {
//     $(".parallax-projects").fadeIn(2500);
// }
//
// $(document).on('turbolinks:load', ready);


$(document).on('turbolinks:load', function() {
    $("#selector").change(function () {
        $(".tableToDissapear").slideUp();
        $('#renderedTable').slideUp();
        choice = $('select[id=selector]').val();
        if (choice != "nil") {
            $.post('projects/render/chosenProjects', {project_type: choice}, function (partial) {
                $('#renderedTable').html(partial)
            })
            setTimeout(function() { $('#renderedTable').slideDown(); }, 2000);
        }
        else {
            $(".tableToDissapear").slideDown();
            $('#renderedTable').slideUp();
        }
    });
})