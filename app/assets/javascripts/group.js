$(function(){
  function buildUserElem(user) {
    var elem = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `
    return elem
  }

  $('#user_name').on('keyup', function(e){
    var input = $(this).val();

    $.ajax({
      url: '/users',
      type: 'GET',
      data : { keyword: input },
      dataType: 'json',
    })
    .done(function(data){
      $('.chat-group-user').remove();
      data.forEach(function(user) {
        var html = buildUserElem(user);
        $('#chat-group-users').append(html);
      });
    })
    .fail(
      function(){
        alert('error');
    })
  });
});
