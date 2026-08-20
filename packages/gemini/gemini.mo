import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public type Config = { apiKey : Text; baseUrl : Text; maxResponseBytes : Nat64 };

  public func config(apiKey : Text) : Config {
    {
      apiKey;
      baseUrl = "https://generativelanguage.googleapis.com/v1beta";
      maxResponseBytes = 1_000_000;
    };
  };

  public func generateUrl(cfg : Config, model : Text) : Text {
    cfg.baseUrl # "/models/" # model # ":generateContent?key=" # cfg.apiKey;
  };

  public func buildPromptBody(prompt : Text) : Text {
    "{\"contents\":[{\"parts\":[{\"text\":\"" # prompt # "\"}]}]}";
  };
};
