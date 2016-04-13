/**
 * Created by chetanv on 13/04/16.
 */

var Valitator = (function () {

  function email(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!re.test(email)) {
      throw new Error("Invalid email address found!")
    }
  }

  return {
    email: email
  };
}());
