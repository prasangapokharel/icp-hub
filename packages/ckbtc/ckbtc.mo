import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public let satoshiPerBtc : Nat = 100_000_000;

  public func toSatoshi(btc : Nat) : Nat {
    btc * satoshiPerBtc;
  };

  public func fromSatoshi(sats : Nat) : Nat {
    sats / satoshiPerBtc;
  };

  public func validateAddress(address : Text) : ?Text {
    if (address.size() < 20) { ?"invalid ckBTC address" } else { null };
  };

  public func formatSats(sats : Nat) : Text {
    Nat.toText(sats) # " sats";
  };
};
