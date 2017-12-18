$(function() {
  function buildHTML(message) {
    console.log(message);
    var html = `<div class= chatspace-content__member> ${message.name} </div>
                <div class= chatspace-content__post-time> ${message.created_at}</div>
                <div class= chatspace-content__chat> ${message.text} </div>`

    if(message.image.url){
      html += `<div class= chatspace-content__chat> <img src= "${message.image.url}"></div>`
    }
    return html;
  }

  $("#new_message").on("submit", function(e) {
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
      console.log(data)
      $('.chatspace-content').append(html);
      $('.form-box__text-field').val('');
    })
    .fail(function() {
      alert('error');
    })
    return false;

  })
})
