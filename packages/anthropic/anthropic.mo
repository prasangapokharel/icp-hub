import Nat "mo:core/Nat";
import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public type Config = { apiKey : Text; baseUrl : Text; maxResponseBytes : Nat64 };

  public type Role = { #user; #assistant };

  public type Message = { role : Role; content : Text };

  public func config(apiKey : Text) : Config {
    {
      apiKey;
      baseUrl = "https://api.anthropic.com/v1";
      maxResponseBytes = 1_000_000;
    };
  };

  public func messagesUrl(cfg : Config) : Text {
    cfg.baseUrl # "/messages";
  };

  public func authHeader(cfg : Config) : Text {
    cfg.apiKey;
  };

  public func versionHeader() : Text {
    "2023-06-01";
  };

  public func buildBody(model : Text, maxTokens : Nat, messages : [Message]) : Text {
    var body = "{\"model\":\"" # model # "\",\"max_tokens\":" # Nat.toText(maxTokens) # ",\"messages\":[";
    var first = true;
    for (msg in messages.vals()) {
      if (not first) { body #= "," };
      first := false;
      let role = switch (msg.role) { case (#user) { "user" }; case (#assistant) { "assistant" } };
      body #= "{\"role\":\"" # role # "\",\"content\":\"" # msg.content # "\"}";
    };
    body # "]}";
  };
};
