$(document).on('turbolinks:load', function () {
  $(function() {

    var search_list = $("#user-search-result");

    function appendUser(user) {
      var search_html = ` <div class="chat-group-user clearfix">
                            <p class="chat-group-user__name">${ user.name }</p>
                            <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                          </div>`
      search_list.append(search_html);
    }

    function appendNouser(user) {
      var html = `<div class="chat-group-user clearfix">
                    <p class="chat-group-user__name">${ user }</p>
                  </div>`
      search_list.append(search_html)
    }

    $("#user-search-field").on("keyup", function() {
      var input = $("#user-search-field").val();
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(users) {
        $("#user-search-result").empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            appendUser(user);
          });
        }
        else {
          appendNouser("一致するユーザーは現在いません");
        }
      })
      .fail(function() {
        alert('ユーザーの検索に失敗しました');
      })
    });

    $(function() {

      function addUser(user_id, user_name){
      var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                    <input name='group[user_ids][]' type='hidden' value='${ user_id }'>
                    <p class='chat-group-user__name'> ${user_name} </p>
                    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                  </div>`
      $("#chat-group-users").append(html);
      }

      $(".chat-group-form__field.clearfix").on("click", "a", function() {

        var user = $(this)
        user_id = user.data('user-id')
        user_name = user.data('user-name')
          addUser(user_id, user_name)
          $(this).parent().remove();
      });
    });
    $(function() {
      $("#chat-group-users").on("click", ".user-search-remove ", function() {
      $(this).parent().remove();
      })
    })
  });
})
