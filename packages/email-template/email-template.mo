import Text "mo:core/Text";

module {
  public func render(template : Text, key : Text, value : Text) : Text {
    Text.replace(template, #text "{{" # key # "}}", value);
  };

  public func renderMany(template : Text, pairs : [(Text, Text)]) : Text {
    var out = template;
    for ((key, value) in pairs.vals()) {
      out := Text.replace(out, #text "{{" # key # "}}", value);
    };
    out;
  };

  public func escapeHtml(input : Text) : Text {
    Text.replace(
      Text.replace(
        Text.replace(input, #text "&", "&amp;"),
        #text "<",
        "&lt;",
      ),
      #text ">",
      "&gt;",
    );
  };
};
