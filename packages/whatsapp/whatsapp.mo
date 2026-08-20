import Text "mo:core/Text";

module {
  public type TemplateMessage = {
    to : Text;
    templateName : Text;
    languageCode : Text;
  };

  public func validatePhone(phone : Text) : ?Text {
    if (phone.size() < 8) { ?"phone number too short" } else { null };
  };

  public func buildTemplatePayload(msg : TemplateMessage) : Text {
    "{\"messaging_product\":\"whatsapp\",\"to\":\"" # msg.to
    # "\",\"type\":\"template\",\"template\":{\"name\":\"" # msg.templateName
    # "\",\"language\":{\"code\":\"" # msg.languageCode # "\"}}}";
  };
};
