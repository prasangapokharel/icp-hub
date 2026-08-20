import Nat "mo:core/Nat";
import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public let maxTweetLength : Nat = 280;

  public type Config = { bearerToken : Text; baseUrl : Text; maxResponseBytes : Nat64 };

  public func config(bearerToken : Text) : Config {
    {
      bearerToken;
      baseUrl = "https://api.x.com/2";
      maxResponseBytes = 500_000;
    };
  };

  public func tweetsUrl(cfg : Config) : Text {
    cfg.baseUrl # "/tweets";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.bearerToken;
  };

  public func buildPostBody(text : Text) : Text {
    "{\"text\":\"" # text # "\"}";
  };

  public func validateTweet(text : Text) : ?Text {
    if (text.size() == 0) return ?"tweet text required";
    if (text.size() > maxTweetLength) return ?"tweet exceeds 280 characters";
    null;
  };
};
