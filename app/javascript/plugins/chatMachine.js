const ChatMachine = function($el){
  this.$messages = $el.find("ul");
  this.$form = $el.find("form");
  this.$form.on("submit", this.submitMessage.bind(this));
};

ChatMachine.prototype.submitMessage = function (event) {
  event.preventDefault();
  // alert("ALERT!");
  $.ajax({
    method: "POST",
    url: `/users/:user_id/messages`,
    // Nees datatype so it doesnt think its html request
    dataType: "json",
    data: this.$form.serialize(),
    success: function(message){
      this.addMessage(message);
      this.clearForm();
    }.bind(this)
  });
  // this.addSpinner();
};

ChatMachine.prototype.addMessage = function (message) {
      var $message = $("<li>").text(message.sent);
      this.$messages.append($message);
      // remove spinner
      // this.$messages.find(".loader").remove();
};

ChatMachine.prototype.clearForm = function () {
this.$form.find("input[type='text']").val("");
};

// ChatMachine.prototype.addSpinner = function () {
//   this.$messages.append('<div class="loader">Loading...</div>');
// };

export { ChatMachine };
