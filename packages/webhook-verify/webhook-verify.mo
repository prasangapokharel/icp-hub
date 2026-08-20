import Text "mo:core/Text";

module {
  public type Provider = { #stripe; #github; #slack };

  public func stripeSignatureHeader() : Text {
    "Stripe-Signature";
  };

  public func githubSignatureHeader() : Text {
    "X-Hub-Signature-256";
  };

  public func slackSignatureHeader() : Text {
    "X-Slack-Signature";
  };

  public func timingSafeEqual(a : Text, b : Text) : Bool {
    if (a.size() != b.size()) return false;
    var match = true;
    var i = 0;
    while (i < a.size()) {
      if (a[i] != b[i]) { match := false };
      i += 1;
    };
    match;
  };
};
