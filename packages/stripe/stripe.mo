import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Config = { secretKey : Text; baseUrl : Text };

  public type LineItem = {
    name : Text;
    description : Text;
    amountCents : Nat;
    quantity : Nat;
    currency : Text;
  };

  public type SessionRequest = {
    successUrl : Text;
    cancelUrl : Text;
    items : [LineItem];
  };

  public func config(secretKey : Text) : Config {
    { secretKey; baseUrl = "https://api.stripe.com/v1" };
  };

  public func checkoutUrl(cfg : Config) : Text {
    cfg.baseUrl # "/checkout/sessions";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.secretKey;
  };

  public func totalCents(items : [LineItem]) : Nat {
    var sum = 0;
    for (item in items.vals()) {
      sum += item.amountCents * item.quantity;
    };
    sum;
  };

  public func validateSession(req : SessionRequest) : ?Text {
    if (req.successUrl.size() == 0) return ?"successUrl required";
    if (req.cancelUrl.size() == 0) return ?"cancelUrl required";
    if (req.items.size() == 0) return ?"at least one line item required";
    null;
  };
};
