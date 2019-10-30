import "bootstrap";
import { ChatMachine } from "../plugins/chatMachine.js";

// ChatMachine();
$(function(){
  new ChatMachine($('.chat'));
});
