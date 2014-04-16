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

$(document).ready(function(){
  $(document).on('click', '.vote', function(e){
    e.preventDefault();
    var $this_type = $(this).attr('data-type');
    var $this_vid = $(this).attr('data-vid');
    var $this_vote = $(this).attr('data-vote');
    $.ajax({
      url: '/votes/vote',
      type: 'post',
      dataType: 'html',
      data: { vote: $this_vote, type: $this_type, vid: $this_vid},
      success: function(response){
        console.log(response);
        if( $this_type === 'question' ){
          $('#total_votes').html(response);
        }else if( $this_type === 'answer' ){
          $('#answer_' + $this_vid).html(response)
        }
      },
      async: false
     });
  });

  $(document).on('click', '.answer', function(e){
    e.preventDefault();
    var $this_qid = $(this).attr('data-qid');
    var $this_body = document.getElementById("answer").value;
    $.ajax({
      url: 'question/answers/add_answer',
      type: 'post',
      dataType: 'html',
      data: { q_id: $this_qid, body: $this_body},
      success: function(response){
        $('#div_answers').append(response);
        document.getElementById("answer").value ="";
        var count =  parseInt($('span#answer_count').text());
        count ++;
        $('span#answer_count').text(count)
        if(count > 1)
          $('span#answer_string').text("Answers")
        else
          $('span#answer_string').text("Answer")
      },
      async: false
     });
  });

  $(document).on('click', '.comment', function(e){
    e.preventDefault();
    var $this_aid = $(this).attr('data-a_id');
    var $this_body = document.getElementById('comment_for_'+ $this_aid).value;
    $.ajax({
      url: 'question/answers/add_comment',
      type: 'post',
      dataType: 'html',
      data: { a_id: $this_aid, body: $this_body},
      success: function(response){
        $('#div_comments_for_answer_' + $this_aid).append(response);
        document.getElementById('comment_for_'+ $this_aid).value ="";
        var count =  parseInt($('span#comment_count_'+ $this_aid).text());
        count ++;
        $('span#comment_count_'+ $this_aid).text(count)
        if(count > 1)
          $('span#comment_string_'+ $this_aid).text("Comments")
        else
          $('span#comment_string_'+ $this_aid).text("Comment")
        $('#collapse'+ $this_aid).collapse('show');

      },
      async: false
     });
  });

  $('.delete_question').on('click', function() {
      $(this).closest('tr').fadeOut();
    });

});

