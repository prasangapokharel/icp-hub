import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Line = { description : Text; quantity : Nat; unitCents : Nat };

  public type Invoice = {
    invoiceId : Text;
    currency : Text;
    lines : [Line];
    taxCents : Nat;
  };

  public func subtotalCents(inv : Invoice) : Nat {
    var sum = 0;
    for (line in inv.lines.vals()) {
      sum += line.quantity * line.unitCents;
    };
    sum;
  };

  public func totalCents(inv : Invoice) : Nat {
    subtotalCents(inv) + inv.taxCents;
  };

  public func validate(inv : Invoice) : ?Text {
    if (inv.invoiceId.size() == 0) return ?"invoiceId required";
    if (inv.lines.size() == 0) return ?"at least one line required";
    if (inv.currency.size() != 3) return ?"currency must be 3 letters";
    null;
  };
};
