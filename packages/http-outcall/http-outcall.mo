import Nat "mo:core/Nat";
import Nat64 "mo:core/Nat64";
import Text "mo:core/Text";

module {
  public type Method = { #get; #post; #head; #put; #delete; #patch };

  public type Header = { name : Text; value : Text };

  public type Request = {
    url : Text;
    method : Method;
    headers : [Header];
    body : [Nat8];
    maxResponseBytes : Nat64;
  };

  public let defaultMaxBytes : Nat64 = 1_000_000;
  public let maxEntries : Nat = 10_000;

  public func get(url : Text) : Request {
    {
      url;
      method = #get;
      headers = [];
      body = [];
      maxResponseBytes = defaultMaxBytes;
    };
  };

  public func post(url : Text, body : [Nat8], headers : [Header]) : Request {
    {
      url;
      method = #post;
      headers;
      body;
      maxResponseBytes = defaultMaxBytes;
    };
  };

  public func bearerHeader(token : Text) : Header {
    { name = "Authorization"; value = "Bearer " # token };
  };

  public func jsonContentType() : Header {
    { name = "Content-Type"; value = "application/json" };
  };

  public func capBytes(bytes : Nat64) : Nat64 {
    if (bytes > defaultMaxBytes) { defaultMaxBytes } else { bytes };
  };
};
