import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public type Config = {
    token : Text;
    baseUrl : Text;
    maxResponseBytes : Nat64;
  };

  public func config(token : Text) : Config {
    {
      token;
      baseUrl = "https://slack.com/api";
      maxResponseBytes = 1_000_000;
    };
  };

  public func postMessageUrl(cfg : Config) : Text {
    cfg.baseUrl # "/chat.postMessage";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.token;
  };

  public func formBody(channel : Text, text : Text) : Text {
    "channel=" # channel # "&text=" # text # "&mrkdwn=true";
  };

  public func validateChannel(channel : Text) : ?Text {
    if (channel.size() == 0) { ?"channel required" } else { null };
  };

  public func isBotToken(token : Text) : Bool {
    Text.startsWith(token, #text "xoxb-");
  };
};
