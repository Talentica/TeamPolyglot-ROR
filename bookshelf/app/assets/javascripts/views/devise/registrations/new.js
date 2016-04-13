/**
 * Created by chetanv on 13/04/16.
 */

var DeviseRegistrationsNew = (function () {

  function getMessage(type) {
    return $("#new-user #email-field .messages ." + type);
  }

  function showError() {
    getMessage("error").removeClass("hidden");
  }

  function showSuccess() {
    getMessage("success").removeClass("hidden");
  }

  function showInfo() {
    getMessage("info").removeClass("hidden");
  }

  function hideAll() {
    getMessage("message").addClass("hidden");
  }

  function checkEmailAvailability() {
    var userEmail = $("#user-form #user_email" ).val();
    showInfo();
    try {
      UserAPI.checkEmailAvailability(userEmail)
        .done(function (data) {
          hideAll();
          if (!data.available) {
            showError();
          } else {
            showSuccess();
          }
        })
    } catch (e) {
      hideAll();
    }

  }

  return {
    checkEmailAvailability: checkEmailAvailability
  }
}());