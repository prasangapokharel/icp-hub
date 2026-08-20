import Float "mo:core/Float";
import Int "mo:core/Int";
import Nat "mo:core/Nat";

module {
  public func dot(a : [Float], b : [Float]) : Float {
    if (a.size() != b.size()) return 0.0;
    var sum = 0.0;
    var i = 0;
    while (i < a.size()) {
      sum += a[i] * b[i];
      i += 1;
    };
    sum;
  };

  public func magnitude(v : [Float]) : Float {
    Float.sqrt(dot(v, v));
  };

  public func cosineSimilarity(a : [Float], b : [Float]) : Float {
    let denom = magnitude(a) * magnitude(b);
    if (denom == 0.0) { 0.0 } else { dot(a, b) / denom };
  };

  public func validateDimensions(a : [Float], b : [Float]) : ?Text {
    if (a.size() != b.size()) { ?"dimension mismatch" } else { null };
  };

  public func validateDimension(size : Nat, expected : Nat) : ?Text {
    if (size != expected) { ?"expected " # Nat.toText(expected) # " dimensions" } else { null };
  };
};
