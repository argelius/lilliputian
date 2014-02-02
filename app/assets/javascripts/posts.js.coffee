$(document).on "page:load ready", ->
    $("select#tag_id").change ->
        $(this).parents("form").trigger "submit"
