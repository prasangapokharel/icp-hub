import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type Config = {
    clientId : Text;
    clientSecret : Text;
    redirectUri : Text;
    tokenUrl : Text;
  };

  public type TokenPair = {
    accessToken : Text;
    refreshToken : ?Text;
    expiresIn : Nat;
  };

  public func config(clientId : Text, clientSecret : Text, redirectUri : Text) : Config {
    {
      clientId;
      clientSecret;
      redirectUri;
      tokenUrl = "https://oauth2.googleapis.com/token";
    };
  };

  public func authUrl(cfg : Config, scopes : Text, state : Text, codeChallenge : Text) : Text {
    "https://accounts.google.com/o/oauth2/v2/auth?client_id=" # cfg.clientId
    # "&redirect_uri=" # cfg.redirectUri
    # "&response_type=code&scope=" # scopes
    # "&state=" # state
    # "&code_challenge=" # codeChallenge
    # "&code_challenge_method=S256";
  };

  public func tokenExchangeBody(code : Text, codeVerifier : Text, cfg : Config) : Text {
    "code=" # code # "&client_id=" # cfg.clientId # "&client_secret=" # cfg.clientSecret
    # "&redirect_uri=" # cfg.redirectUri # "&grant_type=authorization_code&code_verifier=" # codeVerifier;
  };

  public func refreshBody(refreshToken : Text, cfg : Config) : Text {
    "refresh_token=" # refreshToken # "&client_id=" # cfg.clientId
    # "&client_secret=" # cfg.clientSecret # "&grant_type=refresh_token";
  };
};
