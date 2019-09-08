// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


document.getElementById(".post-avatar").each(function() {
  var avatar = $(this),
    avatarWatcher = scrollMonitor.create(avatar.parent(), {
      top: 20,
      bottom: -avatar.height() - 20
    });

  avatarWatcher.stateChange(function() {
    if (avatarWatcher.isInViewport) {
      if (avatarWatcher.isInViewport && avatarWatcher.isAboveViewport) {
        avatar
          .removeClass("post-avatar--absolute")
          .addClass("post-avatar--fixed");
      } else if (!avatarWatcher.isAboveViewport) {
        avatar
          .removeClass("post-avatar--absolute")
          .removeClass("post-avatar--fixed");
      }
    } else {
      avatar
        .removeClass("post-avatar--fixed")
        .addClass("post-avatar--absolute");
    }
  });
});
