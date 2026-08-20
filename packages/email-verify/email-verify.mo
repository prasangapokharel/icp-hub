import Int "mo:core/Int";
import Hash "mo:core/Hash";
import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Token = {
    value : Text;
    email : Text;
    expiresAt : Int;
  };

  public let defaultTtlNanos : Int = 24 * 60 * 60 * 1_000_000_000;

  public func createToken(email : Text, secret : Text, now : Int) : Token {
    let value = Nat.toText(Hash.hash(email # secret # Int.toText(now)));
    { value; email; expiresAt = now + defaultTtlNanos };
  };

  public func isExpired(token : Token, now : Int) : Bool {
    now > token.expiresAt;
  };

  public func buildLink(baseUrl : Text, token : Text) : Text {
    if (Text.endsWith(baseUrl, #text "/")) {
      baseUrl # "verify?token=" # token;
    } else {
      baseUrl # "/verify?token=" # token;
    };
  };

  public func validateEmailShape(email : Text) : ?Text {
    if (email.size() < 5 or not Text.contains(email, #text "@")) {
      ?"invalid email";
    } else {
      null;
    };
  };
};
