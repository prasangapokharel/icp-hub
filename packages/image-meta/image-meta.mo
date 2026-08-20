import Nat "mo:core/Nat";
import Text "mo:core/Text";

module {
  public let maxUploadBytes : Nat = 10_000_000;

  public func sniffMime(bytes : [Nat8]) : Text {
    if (bytes.size() >= 3 and bytes[0] == 0xFF and bytes[1] == 0xD8) {
      return "image/jpeg";
    };
    if (bytes.size() >= 8 and bytes[0] == 0x89 and bytes[1] == 0x50) {
      return "image/png";
    };
    if (bytes.size() >= 4 and bytes[0] == 0x47 and bytes[1] == 0x49) {
      return "image/gif";
    };
    if (bytes.size() >= 4 and bytes[0] == 0x25 and bytes[1] == 0x50) {
      return "application/pdf";
    };
    "application/octet-stream";
  };

  public func validateSize(size : Nat) : ?Text {
    if (size > maxUploadBytes) {
      ?"file exceeds max upload size";
    } else {
      null;
    };
  };

  public func extensionForMime(mime : Text) : Text {
    switch (mime) {
      case ("image/jpeg") { ".jpg" };
      case ("image/png") { ".png" };
      case ("image/gif") { ".gif" };
      case ("application/pdf") { ".pdf" };
      case (_) { "" };
    };
  };
};
