import Blob "mo:core/Blob";
import Text "mo:core/Text";

module {
  public type KeyId = Text;

  public type EncryptRequest = {
    keyId : KeyId;
    plaintext : Blob;
    context : Blob;
  };

  public type DecryptRequest = {
    keyId : KeyId;
    ciphertext : Blob;
    context : Blob;
  };

  public func validateKeyId(keyId : Text) : ?Text {
    if (keyId.size() == 0) { ?"keyId required" } else { null };
  };

  public func validateContext(context : Blob) : ?Text {
    if (context.size() == 0) { ?"context required" } else { null };
  };
};
