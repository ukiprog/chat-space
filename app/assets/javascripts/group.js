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

  function buildMemberElem(user) {
    var elem = `
      <div class='chat-group-member clearfix js-chat-member' id='chat-group-user-${user.id}'>
        <input name='group[user_ids][]' type='hidden' value='${user.id}'>
        <p class='chat-group-user__name'>${user.name}</p>
        <div class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</div>
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

      $('.user-search-add').click(function(){
        var user_id = $(this).attr('data-user-id');
        var user_name = $(this).attr('data-user-name');
        var user = {id: user_id, name: user_name}
        var html = buildMemberElem(user);
        $('#chat-group-members').append(html);
        $(this).parent().remove();

        $('.user-search-remove').click(function(){
          $(this).parent().remove();
        });
      });
    })
    .fail(
      function(){
        alert('error');
    })
  });
});
