import Nat "mo:core/Nat";
import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public type Config = {
    apiKey : Text;
    baseUrl : Text;
    maxResponseBytes : Nat64;
  };

  public type Role = { #system; #user; #assistant };

  public type ChatMessage = { role : Role; content : Text };

  public let defaultMaxBytes : Nat64 = 1_000_000;

  public func config(apiKey : Text) : Config {
    {
      apiKey;
      baseUrl = "https://api.openai.com/v1";
      maxResponseBytes = defaultMaxBytes;
    };
  };

  public func chatUrl(cfg : Config) : Text {
    cfg.baseUrl # "/chat/completions";
  };

  public func embeddingsUrl(cfg : Config) : Text {
    cfg.baseUrl # "/embeddings";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.apiKey;
  };

  public func roleText(role : Role) : Text {
    switch (role) {
      case (#system) { "system" };
      case (#user) { "user" };
      case (#assistant) { "assistant" };
    };
  };

  public func buildChatBody(model : Text, messages : [ChatMessage]) : Text {
    var body = "{\"model\":\"" # model # "\",\"messages\":[";
    var first = true;
    for (msg in messages.vals()) {
      if (not first) { body #= "," };
      first := false;
      body #= "{\"role\":\"" # roleText(msg.role) # "\",\"content\":\"" # msg.content # "\"}";
    };
    body # "]}";
  };

  public func validateApiKey(key : Text) : ?Text {
    if (key.size() < 10) { ?"api key too short" } else { null };
  };
};
