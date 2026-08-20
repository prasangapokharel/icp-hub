import Int "mo:core/Int";
import Text "mo:core/Text";

module {
  public type Config = { accessToken : Text; baseUrl : Text };

  public type Event = {
    summary : Text;
    startIso : Text;
    endIso : Text;
    timeZone : Text;
  };

  public func config(accessToken : Text) : Config {
    { accessToken; baseUrl = "https://www.googleapis.com/calendar/v3" };
  };

  public func eventsListUrl(cfg : Config, calendarId : Text) : Text {
    cfg.baseUrl # "/calendars/" # calendarId # "/events";
  };

  public func freeBusyUrl(cfg : Config) : Text {
    cfg.baseUrl # "/freeBusy";
  };

  public func authHeader(cfg : Config) : Text {
    "Bearer " # cfg.accessToken;
  };

  public func buildEventBody(event : Event) : Text {
    "{\"summary\":\"" # event.summary
    # "\",\"start\":{\"dateTime\":\"" # event.startIso # "\",\"timeZone\":\"" # event.timeZone
    # "\"},\"end\":{\"dateTime\":\"" # event.endIso # "\",\"timeZone\":\"" # event.timeZone # "\"}}";
  };

  public func validateEvent(event : Event) : ?Text {
    if (event.summary.size() == 0) return ?"summary required";
    if (event.startIso.size() == 0) return ?"start required";
    if (event.endIso.size() == 0) return ?"end required";
    null;
  };
};
