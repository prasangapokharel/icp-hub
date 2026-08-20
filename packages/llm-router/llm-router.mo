import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Provider = { #openai; #anthropic; #gemini };

  public func providerName(p : Provider) : Text {
    switch (p) {
      case (#openai) { "openai" };
      case (#anthropic) { "anthropic" };
      case (#gemini) { "gemini" };
    };
  };

  public func validateModelName(name : Text) : ?Text {
    if (name.size() == 0) { ?"model name required" } else { null };
  };

  public func estimateTokens(text : Text) : Nat {
    text.size() / 4 + 1;
  };
};
