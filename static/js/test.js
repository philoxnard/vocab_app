function test() {
    alert("javascript is hooked up")
    $(".testclass").html("and jquery is hooked up")
}

function ajaxtest(){
    
    let data = {
        "command" : "If you're seeing this, the ajax test was a success",
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
            console.log("Successfully sent a JSON object from the client to the server and back to the client")
            alert(response["command"])
        }
    })
}