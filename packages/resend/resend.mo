import Text "mo:core/Text";

module {
  public type Config = { apiKey : Text; baseUrl : Text };

  public func config(apiKey : Text) : Config {
    { apiKey; baseUrl = "https://api.resend.com" };
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.apiKey;
  };

  public func buildPayload(fromEmail : Text, to : [Text], subject : Text, html : Text) : Text {
  "{\"from\":\"" # fromEmail # "\",\"to\":["
    # joinQuoted(to)
    # "],\"subject\":\"" # subject
    # "\",\"html\":\"" # html # "\"}";
  };

  func joinQuoted(items : [Text]) : Text {
    var out = "";
    var first = true;
    for (item in items.vals()) {
      if (not first) { out #= "," };
      first := false;
      out #= "\"" # item # "\"";
    };
    out;
  };
};
