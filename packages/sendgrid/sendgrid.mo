import Text "mo:core/Text";

module {
  public type Config = { apiKey : Text; baseUrl : Text };

  public func config(apiKey : Text) : Config {
    { apiKey; baseUrl = "https://api.sendgrid.com/v3" };
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.apiKey;
  };

  public func personalizations(to : [Text]) : Text {
    var out = "[";
    var first = true;
    for (addr in to.vals()) {
      if (not first) { out #= "," };
      first := false;
      out #= "{\"email\":\"" # addr # "\"}";
    };
    out # "]";
  };

  public func buildPayload(fromEmail : Text, to : [Text], subject : Text, html : Text) : Text {
    "{\"personalizations\":[{\"to\":" # personalizations(to)
    # "}],\"from\":{\"email\":\"" # fromEmail
    # "\"},\"subject\":\"" # subject
    # "\",\"content\":[{\"type\":\"text/html\",\"value\":\"" # html # "\"}]}";
  };
};
