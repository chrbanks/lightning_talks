$(function () {
  $(document).on('ajax:success', '.new_relationship, .edit_relationship', function (e, data, status, xhr) {
    var $form = $(this);
    var $content = $.parseHTML(xhr.responseText);
    var action = $form.data('action');
    var userId = $form.data('userId');
    var currentUserId = $form.data('currentUserId');

    $form.replaceWith($content);

    var $followersCounter = $('#' + userId).find('.followers').find('.block');
    var followersCount = parseInt($followersCounter.text(), 10);

    var $followingCounter = $('#' + currentUserId).find('.following').find('.block');
    var followingCount = parseInt($followingCounter.text(), 10);

    if (action === 'follow') {
      followersCount += 1;
      followingCount += 1;
      $('.tab-content').find('.followers').find('#' + currentUserId).show();
    } else if (action === 'unfollow') {
      followersCount -= 1;
      followingCount -= 1;
      $('.tab-content').find('.followers').find('#' + currentUserId).hide();
    }

    $followersCounter.text(followersCount);
    $followingCounter.text(followingCount);
  });
});
