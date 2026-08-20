import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Config = { clientId : Text; clientSecret : Text; baseUrl : Text };

  public type OrderRequest = {
    amountCents : Nat;
    currency : Text;
    returnUrl : Text;
    cancelUrl : Text;
  };

  public func config(clientId : Text, clientSecret : Text) : Config {
    {
      clientId;
      clientSecret;
      baseUrl = "https://api-m.paypal.com/v2";
    };
  };

  public func ordersUrl(cfg : Config) : Text {
    cfg.baseUrl # "/checkout/orders";
  };

  public func validateOrder(req : OrderRequest) : ?Text {
    if (req.amountCents == 0) return ?"amount required";
    if (req.currency.size() != 3) return ?"currency must be ISO 4217";
    if (req.returnUrl.size() == 0) return ?"returnUrl required";
    null;
  };
};
