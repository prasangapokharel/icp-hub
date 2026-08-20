import Blob "mo:core/Blob";
import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public type ExternalBlob = Blob;

  public type FileMeta = {
    filename : Text;
    mimeType : Text;
    sizeBytes : Nat;
  };

  public func validateFilename(name : Text) : ?Text {
    if (name.size() == 0) return ?"filename required";
    if (name.size() > 255) return ?"filename too long";
    if (Text.contains(name, #text "..")) return ?"invalid filename";
    null;
  };

  public func validateMimeType(mime : Text) : ?Text {
    if (mime.size() == 0) return ?"mimeType required";
    if (not Text.contains(mime, #text "/")) return ?"invalid mimeType";
    null;
  };

  public func isImageMime(mime : Text) : Bool {
    Text.startsWith(mime, #text "image/");
  };
};
