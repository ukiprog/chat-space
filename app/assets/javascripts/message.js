$(function(){
  $('.talk__board').animate({ scrollTop: $('.talk__board').get(0).scrollHeight });
  function buildHTML(message, name){
    if (!message.image.url) {
      content = '' 
    } else {
      content = `
        <p class="talk__text">
          <img height="150" src="${message.image.url}">
        </p>
      `
    }  

    var message =`
      <div class="talk">
        <p class="talk__sender">${name}</p>
        <p class="talk__send_at">${message.created_at}</p>
        <p class="talk__text">${message.text}</p>
        ${content}
      </div>  
    `

    return message;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var form_data = new FormData(this);
    var url = $(this).attr('action')

    $.ajax({
      url: url,
      type: 'POST',
      data : form_data,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var name = $('#current_user_name').val();
      var html = buildHTML(data, name);
      $('.talk__board').append(html);
      $('#new_message').get(0).reset()
      $('.talk__board').animate({ scrollTop: $('.talk__board').get(0).scrollHeight });
    })
    .fail(
      function(){
        alert('error');
    })
  });
});
