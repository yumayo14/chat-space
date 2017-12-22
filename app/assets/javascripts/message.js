$(function() {
  function buildHTML(message) {
    var html = `<div class= chatspace-content data-message-id=${message.id}>
                  <div class= chatspace-content__member> ${message.name} </div>
                  <div class= chatspace-content__post-time> ${message.created_at}</div>
                  <div class= chatspace-content__chat> ${message.text} </div>
`

    html +=
    (message.image.url) ?
      (
        `<div class= chatspace-content__chat> <img src= "${message.image.url}"></div> </div>`
      ):
      (
        `</div>`
      );
    return html;
  }

  $(".new_message").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = $(this).attr('action');

    $.ajax ({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data)
      $('.chatspace').append(html);
      $('.form-box__text-field').val('');
      $('.form-box__picture-set__field').val('');
      $('.chatspace').animate({scrollTop: $('.chatspace')[0].scrollHeight}, 'slow');
    })
    .fail(function() {
      alert('error');
    })
    return false;
  })

  var auto_reload = setInterval(function() {
  if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      url: location.href,
      type: 'GET',
      dataType: "json"
    })
    .done(function(messages) {
      var last_message_id = $('.chatspace-content:last').data("message-id");
      messages.forEach(function(message) {
         if (message.id > last_message_id ) {
          var html = buildHTML(message)
          $('.chatspace').append(html);
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
})

