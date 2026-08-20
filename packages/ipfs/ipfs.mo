import Text "mo:core/Text";

module {
  public func isValidCid(cid : Text) : Bool {
    cid.size() > 10 and (Text.startsWith(cid, #text "Qm") or Text.startsWith(cid, #text "bafy"));
  };

  public func gatewayUrl(cid : Text, gateway : Text) : Text {
    if (Text.endsWith(gateway, #text "/")) {
      gateway # cid;
    } else {
      gateway # "/" # cid;
    };
  };

  public func defaultGateway() : Text {
    "https://ipfs.io/ipfs";
  };

  public func validateCid(cid : Text) : ?Text {
    if (isValidCid(cid)) { null } else { ?"invalid CID format" };
  };
};
