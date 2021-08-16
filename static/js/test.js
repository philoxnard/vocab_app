function test() {
    alert("javascript is hooked up")
    $(".testclass").html("and jquery is hooked up")
}

function ajaxtest(){
    
    let data = {
        "command" : "this is a test",
        "data" : "test data to be filled by whatever function is sending the request"
    }

    message_request = JSON.stringify( data )

    $.ajax({
        url:'/ajax_receive',
        type: 'POST',
        dataType: 'json',
        data: message_request,
        contentType:"application/json",
        success: function(response){
            alert(response)
        }
    })
}