import Text "mo:core/Text";

module {
  public type Config = { accessToken : Text; baseUrl : Text };

  public func config(accessToken : Text) : Config {
    { accessToken; baseUrl = "https://gmail.googleapis.com/gmail/v1" };
  };

  public func profileUrl(cfg : Config) : Text {
    cfg.baseUrl # "/users/me/profile";
  };

  public func sendUrl(cfg : Config) : Text {
    cfg.baseUrl # "/users/me/messages/send";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.accessToken;
  };

  public func rawMime(to : Text, subject : Text, body : Text) : Text {
    "To: " # to # "\r\nSubject: " # subject # "\r\nContent-Type: text/plain\r\n\r\n" # body;
  };
};
