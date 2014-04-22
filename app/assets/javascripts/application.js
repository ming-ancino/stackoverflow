// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require_tree .

// $(document).ready(function(){
//   $(document).on('click', '.vote', function(e){
//     e.preventDefault();
//     var $this_type = $(this).attr('data-type');
//     var $this_vid = $(this).attr('data-vid');
//     var $this_vote = $(this).attr('data-vote');
//     $.ajax({
//       url: '/votes/vote',
//       type: 'post',
//       dataType: 'html',
//       data: { vote: $this_vote, type: $this_type, vid: $this_vid},
//       success: function(response){
//         console.log(response);
//         if( $this_type === 'question' ){
//           $('#total_votes').html(response);
//         }else if( $this_type === 'answer' ){
//           $('#answer_' + $this_vid).html(response)
//         }
//       },
//       async: false
//      });
//   });



// });

