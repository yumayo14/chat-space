$(function() {
  function buildHTML(message) {
    var html = `<div class= chatspace-content__member> ${message.user.name} </div>
                <div class= chatspace-content__post-time> ${message.created_at}</div>
                <div class= chatspace-content__chat> ${message.text} </div>
                <div class= chatspace-content__chat> ${image_tag message.image.to_s} </div>`
    return html;
  }

  $("#new_message").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = $(this).attr('action')

    $.ajax ({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chatspace-content__chat').append(html)
      $('.text_field').val('')
    })
    .fail(function() {
      alert('error');
    })

  })
})
