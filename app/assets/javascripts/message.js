$(document).on('turbolinks:load', function () {
  $(function() {
    function buildHTML(message) {
      var html = `<div class= chatspace-content>
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
  })
})
