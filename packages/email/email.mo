import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Address = Text;
  public type SendResult = { #ok; #err : Text };

  public type Message = {
    fromAddress : Text;
    to : [Address];
    subject : Text;
    htmlBody : Text;
    textBody : ?Text;
  };

  public let maxRecipients : Nat = 50;

  public func validateMessage(msg : Message) : ?Text {
    if (msg.fromAddress.size() == 0) return ?"fromAddress required";
    if (msg.to.size() == 0) return ?"at least one recipient";
    if (msg.to.size() > maxRecipients) return ?"too many recipients";
    if (msg.subject.size() == 0) return ?"subject required";
    if (msg.htmlBody.size() == 0) return ?"htmlBody required";
    null;
  };

  public func serviceFrom(username : Text) : Text {
    if (Text.contains(username, #text "@")) { username } else { username # "@app.local" };
  };
};
