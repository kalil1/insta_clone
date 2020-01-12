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

const like = (id) => {
  if (document.querySelector("#like" + id).style.display == "inline-block") {
    document.querySelector("#like" + id).style.display = "none"
    document.querySelector("#unlike" + id).style.display = "inline-block"
  } else if (document.querySelector("#unlike" + id).style.display == "inline-block") {
    document.querySelector("#like" + id).style.display = "inline-block"
    document.querySelector("#unlike" + id).style.display = "none"
  };
};

const follow = (id) => {
  if (document.querySelector("#is-following" + id).style.display == "block") {
    document.querySelector("#is-following" + id).style.display = "none"
    document.querySelector("#is-not-following" + id).style.display = "block"
  } else if (document.querySelector("#is-not-following" + id).style.display == "block") {
    document.querySelector("#is-following" + id).style.display = "block"
    document.querySelector("#is-not-following" + id).style.display = "none"
  };
};

function readURL(input) {
     if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
      document.querySelector('#blah').src = e.target.result;
      };
     reader.readAsDataURL(input.files[0]);
    }
  }

  const comment = (post_id) => {
  const content_response = document.getElementById("content_response" + post_id);
  content_response.style.display = "none";
  let req = new XMLHttpRequest;
  let url = "/post/comments";
  req.open('post', url, true);
  req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  let token = document.getElementsByName("csrf-token")[0].content;
  req.setRequestHeader('X-CSRF-Token', token);
  req.onreadystatechange = function() {
    if (req.readyState === XMLHttpRequest.DONE) {
      content_response.innerHTML = req.responseText;
      content_response.style.display = 'block';
    }
  };
  req.send('&id=' + post_id);
};
