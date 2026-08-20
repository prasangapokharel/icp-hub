import Int "mo:core/Int";
import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Period = { #monthly; #yearly };

  public type Plan = {
    planId : Text;
    name : Text;
    priceCents : Nat;
    period : Period;
  };

  public type Subscription = {
    userId : Text;
    planId : Text;
    startedAt : Int;
    renewsAt : Int;
    active : Bool;
  };

  public let monthNanos : Int = 30 * 24 * 60 * 60 * 1_000_000_000;
  public let yearNanos : Int = 365 * 24 * 60 * 60 * 1_000_000_000;

  public func nextRenewal(from : Int, period : Period) : Int {
    switch (period) {
      case (#monthly) { from + monthNanos };
      case (#yearly) { from + yearNanos };
    };
  };

  public func isActive(sub : Subscription, now : Int) : Bool {
    sub.active and now < sub.renewsAt;
  };
};
