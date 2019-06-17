$(function(){
  $('.talk__board').animate({ scrollTop: $('.talk__board').get(0).scrollHeight });

  // メッセージ送信　非同期通信
  function buildHTML(message, name){
    if (!message.image.url) {
      var content = '' 
    } else {
      var content = `
        <p class="talk__text">
          <img height="150" src="${message.image.url}">
        </p>
      `
    }  

    var message =`
      <div class="talk" data-message-group-id="${message.group_id}" data-message-id="${message.id}">
        <p class="talk__sender">${message.user_name}</p>
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

  // 最新メッセージの取得
  function buildMessageHTML(message){
    if (!message.image.url) {
      var content = '' 
    } else {
      var content = `
        <p class="talk__text">
          <img height="150" src="${message.image.url}">
        </p>
      `
    }  

    var message =`
      <div class="talk" data-message-group-id="${message.group_id}" data-message-id="${message.id}">
        <p class="talk__sender">${message.user_name}</p>
        <p class="talk__send_at">${message.created_at}</p>
        <p class="talk__text">${message.text}</p>
        ${content}
      </div>  
    `

    return message;
  }

  var reloadMessages = function() {
    console.log('prepair');
    var last_message_id = $('.talk:last').attr('data-message-id');
    var group_id = $('.talk:last').attr('data-message-group-id');
    $.ajax({
      url: '/api/messages',
      type: 'get',
      dataType: 'json',
      data: {message_id: last_message_id, group_id: group_id }
    })
    .done(function(data) {
      console.log(data);
      data.forEach(function(message) {
        var html = buildMessageHTML(message);
        $('.talk__board').append(html);
        $('.talk__board').animate({ scrollTop: $('.talk__board').get(0).scrollHeight });
        reloadMessages();
      });
    })
    .fail(function() {
      console.log('error');
    });
  };

  // setInterval(reloadMessages, 5000);
  $('.talk__header__info').click(function(){reloadMessages()});
});
