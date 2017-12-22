$(function() {
  function buildHTML(message) {
    var insertImage = '';
      insertImage =
      (message.image_url)?
      (
        `<div class= chatspace-content__chat>
              ${message.image}</div>`
      ):(``);

    var html = `
      <div class= chatspace-content data-message-id=${message.id}>
        <div class= chatspace-content__member >${message.name}</div>
        <div class= chatspace-content__post-time>${message.created_at}</div>
        <div class= chatspace-content__chat >${message.text}</div>
        ${insertImage}
      </div>`;
    return html;
  }

  var auto_reload = setInterval(function() {
  if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      type: 'GET',
      dataType: "json"
    })
    .done(function(messages) {
      var last_message_id = $('.chatspace-content:last').data("message-id");
      var insertHTML = '';
      messages.forEach(function(message) {
         if (message.id > last_message_id ) {
          insertHTML += buildHTML(message);
          $('.chatspace').append(insertHTML);
        }
      });
    })
    .fail(function(data) {
      alert('自動更新に失敗しました');
    });
      } else {
      clearInterval(auto_reload);
  }
}, 5000 );
});
