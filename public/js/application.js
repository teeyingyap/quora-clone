$(document).ready(function() {
	console.log("jQuery ready!");
     
    $('.qupvotebutton').submit(function(event) {
        event.preventDefault();
        console.log("Prevented Default Action!");
        question_id = $(this).attr('id').match(/\d+/)[0]

      $.ajax({
        url: $(this).attr("action"),  
        method: $(this).attr('method'),
        data: $(this).serialize(),        
        dataType: "json",


        success: function(response) {
          console.log("success");
          var button = $("#questionup-" + question_id).find('input[type="submit"]')
          var new_vote = response.vote_count.toString()
          var button_val = "Upvote | " + new_vote
          button.val(button_val)
          
        },
        error: function(response) {
            debugger
        }
      });

  });

$('.qdownvotebutton').submit(function(event) {
        event.preventDefault();
        console.log("Prevented Default Action!");
        question_id = $(this).attr('id').match(/\d+/)[0]

      $.ajax({
        url: $(this).attr("action"),  
        method: $(this).attr('method'),
        data: $(this).serialize(),        
        dataType: "json",


        success: function(response) {
          console.log("success");
          var button = $("#questiondown-" + question_id).find('input[type="submit"]')
          var new_vote = response.vote_count.toString()
          var button_val = "Downvote | " + new_vote
          button.val(button_val)
          
        },
        error: function(response) {
            debugger
        }
      });

  });


$('.aupvotebutton').submit(function(event) {
        event.preventDefault();
        console.log("Prevented Default Action!");
        answer_id = $(this).attr('id').match(/\d+/)[0]

      $.ajax({
        url: $(this).attr("action"),  
        method: $(this).attr('method'),
        data: $(this).serialize(),        
        dataType: "json",


        success: function(response) {
          console.log("success");
          var button = $("#answerup-" + answer_id).find('input[type="submit"]')
          var new_vote = response.vote_count.toString()
          var button_val = "Upvote | " + new_vote
          button.val(button_val)
          
        },
        error: function(response) {
            debugger
        }
      });

  });


$('.adownvotebutton').submit(function(event) {
        event.preventDefault();
        console.log("Prevented Default Action!");
        answer_id = $(this).attr('id').match(/\d+/)[0]

      $.ajax({
        url: $(this).attr("action"),  
        method: $(this).attr('method'),
        data: $(this).serialize(),        
        dataType: "json",


        success: function(response) {
          console.log("success");
          var button = $("#answerdown-" + answer_id).find('input[type="submit"]')
          var new_vote = response.vote_count.toString()
          var button_val = "Downvote | " + new_vote
          button.val(button_val)
          
        },
        error: function(response) {
            debugger
        }
      });

  });          









            // if (response.updown === false) {
            //   var button = $("#questionup-" + question_id).find('input[type="submit"]')
            //   var new_vote = parseInt(button.val().match(/\d+/)[0]) - 1
            //   var button_val = "Upvote | " + new_vote.toString() 
            //   button.val(button_val)
            // }
            // else if (response.updown === true) {
            //   var button = $("#questionup-" + question_id).find('input[type="submit"]')
            //   var new_vote = parseInt(button.val().match(/\d+/)[0]) + 1
            //   var button_val = "Upvote | " + new_vote.toString() 
            //   button.val(button_val)

            // }








// $('.like').submit(function(event) {
     
//   var question_id  = $('input[name=question_id]').val()
//   // 'email'             : $('input[name=email]').val(),
//   // 'superheroAlias'    : $('input[name=superheroAlias]').val()

//     $.ajax({
//         type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
//         url         : '/upvote/' + question_id, // the url where we want to POST
//         data        : question_id, // our data object
//         dataType    : 'json', // what type of data do we expect back from the server
//                     encode          : true
//         })
//             .done(function(data) {
//                 alert("it works")
//                 debugger;
//                 // log data to the console so we can see
//                 console.log(data); 
//                 // here we will handle errors and validation messages
//             });
//         // stop the form from submitting the normal way and refreshing the page
//         event.preventDefault();
//     });
// });




// $(".votebutton").click(function(e) {
//     var target = $(e.target).siblings().last()
//     var num = parseInt(target.text()) + 1
//     target.text(num)


    // });


});
