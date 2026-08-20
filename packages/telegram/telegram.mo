import Text "mo:core/Text";

module {
  public type Config = { botToken : Text; baseUrl : Text };

  public func config(botToken : Text) : Config {
    { botToken; baseUrl = "https://api.telegram.org/bot" # botToken };
  };

  public func sendMessageUrl(cfg : Config) : Text {
    cfg.baseUrl # "/sendMessage";
  };

  public func buildPayload(chatId : Text, text : Text) : Text {
    "{\"chat_id\":\"" # chatId # "\",\"text\":\"" # text # "\"}";
  };

  public func validateChatId(chatId : Text) : ?Text {
    if (chatId.size() == 0) { ?"chatId required" } else { null };
  };
};
