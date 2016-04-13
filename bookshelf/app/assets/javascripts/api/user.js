/**
 * Created by chetanv on 13/04/16.
 */


var UserAPI = (function () {

  function checkEmailAvailability(email) {
    Validator.email(email);

    return $.post(
      "check_availability/email",
      { email: UserEmail }
    );
  }

  return {
    isEmailAvailable: checkEmailAvailability
  };
})();