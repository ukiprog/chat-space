$(function(){
  function buildHTML(message){
    var text = `<p class="taalk__text">${message.text}</p>`
    var image = `
        <p class="taalk__text">
          <img height="150" src="${messge.image}" alt="">
        </p>
    `
    var message = `
      <div class="talk">
        <p class="talk__sender">${message.user_id}</p>
        <p class="talk__send_at">${messge.created_at}</p>
    ` + message.image.length > 0 ? image : text + `</div> `

    return message;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var form_data = new FormData(this);

    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data : form_data,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done({})
    .fail({})
  });
});
