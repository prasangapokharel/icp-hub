import Text "mo:core/Text";

module {
  public type GrantType = { #authorizationCode; #refreshToken; #clientCredentials };

  public func grantTypeText(g : GrantType) : Text {
    switch (g) {
      case (#authorizationCode) { "authorization_code" };
      case (#refreshToken) { "refresh_token" };
      case (#clientCredentials) { "client_credentials" };
    };
  };

  public func buildRedirectUri(base : Text, path : Text) : Text {
    base # path;
  };

  public func validateState(expected : Text, received : Text) : ?Text {
    if (expected != received) { ?"oauth state mismatch" } else { null };
  };
};
