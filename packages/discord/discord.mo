import Text "mo:core/Text";

module {
  public type Embed = { title : Text; description : Text; color : Text };

  public func validateWebhookUrl(url : Text) : ?Text {
    if (not Text.startsWith(url, #text "https://discord.com/api/webhooks/")) {
      ?"invalid discord webhook url";
    } else {
      null;
    };
  };

  public func buildPayload(content : Text, embeds : [Embed]) : Text {
    var body = "{\"content\":\"" # content # "\"";
    if (embeds.size() > 0) {
      body #= ",\"embeds\":[";
      var first = true;
      for (e in embeds.vals()) {
        if (not first) { body #= "," };
        first := false;
        body #= "{\"title\":\"" # e.title # "\",\"description\":\"" # e.description # "\",\"color\":" # e.color # "}";
      };
      body #= "]";
    };
    body # "}";
  };
};
