%%%----------------------------------------------------------------------
%%% File    : jlib.hrl
%%% Author  : Alexey Shchepin <alexey@sevcom.net>
%%% Purpose : 
%%% Created :  5 Mar 2003 by Alexey Shchepin <alexey@sevcom.net>
%%%----------------------------------------------------------------------

-define(NS_DISCO_ITEMS,  "http://jabber.org/protocol/disco#items").
-define(NS_DISCO_INFO,   "http://jabber.org/protocol/disco#info").
-define(NS_VCARD,        "vcard-temp").
-define(NS_AUTH,         "jabber:iq:auth").
-define(NS_AUTH_ERROR,   "jabber:iq:auth:error").
-define(NS_REGISTER,     "jabber:iq:register").
-define(NS_SEARCH,       "jabber:iq:search").
-define(NS_ROSTER,       "jabber:iq:roster").
-define(NS_PRIVACY,      "jabber:iq:privacy").
-define(NS_PRIVATE,      "jabber:iq:private").
-define(NS_VERSION,      "jabber:iq:version").
-define(NS_TIME,         "jabber:iq:time").
-define(NS_LAST,         "jabber:iq:last").
-define(NS_XDATA,        "jabber:x:data").
-define(NS_IQDATA,       "jabber:iq:data").
-define(NS_DELAY,        "jabber:x:delay").
-define(NS_EXPIRE,       "jabber:x:expire").
-define(NS_EVENT,        "jabber:x:event").
-define(NS_XCONFERENCE,  "jabber:x:conference").
-define(NS_STATS,        "http://jabber.org/protocol/stats").
-define(NS_MUC,          "http://jabber.org/protocol/muc").
-define(NS_MUC_USER,     "http://jabber.org/protocol/muc#user").
-define(NS_MUC_ADMIN,    "http://jabber.org/protocol/muc#admin").
-define(NS_MUC_OWNER,    "http://jabber.org/protocol/muc#owner").
-define(NS_PUBSUB,       "http://jabber.org/protocol/pubsub").
-define(NS_PUBSUB_EVENT, "http://jabber.org/protocol/pubsub#event").
-define(NS_PUBSUB_OWNER, "http://jabber.org/protocol/pubsub#owner").
-define(NS_PUBSUB_NMI,   "http://jabber.org/protocol/pubsub#node-meta-info").

-define(NS_EJABBERD_CONFIG, "ejabberd:config").

-define(NS_STREAM,       "http://etherx.jabber.org/streams").

-define(NS_STANZAS,      "urn:ietf:params:xml:ns:xmpp-stanzas").
-define(NS_STREAMS,      "urn:ietf:params:xml:ns:xmpp-streams").

-define(NS_TLS,          "urn:ietf:params:xml:ns:xmpp-tls").
-define(NS_SASL,         "urn:ietf:params:xml:ns:xmpp-sasl").
-define(NS_SESSION,      "urn:ietf:params:xml:ns:xmpp-session").
-define(NS_BIND,         "urn:ietf:params:xml:ns:xmpp-bind").

-define(NS_FEATURE_IQAUTH, "http://jabber.org/features/iq-auth").

% TODO: remove "code" attribute (currently it used for backward-compatibility)
-define(STANZA_ERROR(Code, Type, Condition),
	{xmlelement, "error",
	 [{"code", Code}, {"type", Type}],
	 [{xmlelement, Condition, [{"xmlns", ?NS_STANZAS}], []}]}).

-define(ERR_BAD_REQUEST,
	?STANZA_ERROR("400", "modify", "bad-request")).
-define(ERR_CONFLICT,
	?STANZA_ERROR("409", "cancel", "conflict")).
-define(ERR_FEATURE_NOT_IMPLEMENTED,
	?STANZA_ERROR("501", "cancel", "feature-not-implemented")).
-define(ERR_FORBIDDEN,
	?STANZA_ERROR("403", "auth",   "forbidden")).
-define(ERR_GONE,
	?STANZA_ERROR("302", "modify", "gone")).
-define(ERR_INTERNAL_SERVER_ERROR,
	?STANZA_ERROR("500", "wait",   "internal-server-error")).
-define(ERR_ITEM_NOT_FOUND,
	?STANZA_ERROR("404", "cancel", "item-not-found")).
-define(ERR_JID_MALFORMED,
	?STANZA_ERROR("400", "modify", "jid-malformed")).
-define(ERR_NOT_ACCEPTABLE,
	?STANZA_ERROR("406", "modify", "not-acceptable")).
-define(ERR_NOT_ALLOWED,
	?STANZA_ERROR("405", "cancel", "not-allowed")).
-define(ERR_NOT_AUTHORIZED,
	?STANZA_ERROR("401", "auth",   "not-authorized")).
-define(ERR_PAYMENT_REQUIRED,
	?STANZA_ERROR("402", "auth",   "payment-required")).
-define(ERR_RECIPIENT_UNAVAILABLE,
	?STANZA_ERROR("404", "wait",   "recipient-unavailable")).
-define(ERR_REDIRECT,
	?STANZA_ERROR("302", "modify", "redirect")).
-define(ERR_REGISTRATION_REQUIRED,
	?STANZA_ERROR("407", "auth",   "registration-required")).
-define(ERR_REMOTE_SERVER_NOT_FOUND,
	?STANZA_ERROR("404", "cancel", "remote-server-not-found")).
-define(ERR_REMOTE_SERVER_TIMEOUT,
	?STANZA_ERROR("504", "wait",   "remote-server-timeout")).
-define(ERR_RESOURCE_CONSTRAINT,
	?STANZA_ERROR("500", "wait",   "resource-constraint")).
-define(ERR_SERVICE_UNAVAILABLE,
	?STANZA_ERROR("503", "cancel", "service-unavailable")).
-define(ERR_SUBSCRIPTION_REQUIRED,
	?STANZA_ERROR("407", "auth",   "subscription-required")).
-define(ERR_UNEXPECTED_REQUEST,
	?STANZA_ERROR("400", "wait",   "unexpected-request")).
%-define(ERR_,
%	?STANZA_ERROR("", "", "")).

-define(STANZA_ERRORT(Code, Type, Condition, Lang, Text),
	{xmlelement, "error",
	 [{"code", Code}, {"type", Type}],
	 [{xmlelement, Condition, [{"xmlns", ?NS_STANZAS}], []},
	  {xmlelement, "text", [{"xmlns", ?NS_STANZAS}],
	   [{xmlcdata, translate:translate(Lang, Text)}]}]}).

-define(ERRT_BAD_REQUEST(Lang, Text),
	?STANZA_ERRORT("400", "modify", "bad-request", Lang, Text)).
-define(ERRT_CONFLICT(Lang, Text),
	?STANZA_ERRORT("409", "cancel", "conflict", Lang, Text)).
-define(ERRT_FEATURE_NOT_IMPLEMENTED(Lang, Text),
	?STANZA_ERRORT("501", "cancel", "feature-not-implemented", Lang, Text)).
-define(ERRT_FORBIDDEN(Lang, Text),
	?STANZA_ERRORT("403", "auth",   "forbidden", Lang, Text)).
-define(ERRT_GONE(Lang, Text),
	?STANZA_ERRORT("302", "modify", "gone", Lang, Text)).
-define(ERRT_INTERNAL_SERVER_ERROR(Lang, Text),
	?STANZA_ERRORT("500", "wait",   "internal-server-error", Lang, Text)).
-define(ERRT_ITEM_NOT_FOUND(Lang, Text),
	?STANZA_ERRORT("404", "cancel", "item-not-found", Lang, Text)).
-define(ERRT_JID_MALFORMED(Lang, Text),
	?STANZA_ERRORT("400", "modify", "jid-malformed", Lang, Text)).
-define(ERRT_NOT_ACCEPTABLE(Lang, Text),
	?STANZA_ERRORT("406", "modify", "not-acceptable", Lang, Text)).
-define(ERRT_NOT_ALLOWED(Lang, Text),
	?STANZA_ERRORT("405", "cancel", "not-allowed", Lang, Text)).
-define(ERRT_NOT_AUTHORIZED(Lang, Text),
	?STANZA_ERRORT("401", "auth",   "not-authorized", Lang, Text)).
-define(ERRT_PAYMENT_REQUIRED(Lang, Text),
	?STANZA_ERRORT("402", "auth",   "payment-required", Lang, Text)).
-define(ERRT_RECIPIENT_UNAVAILABLE(Lang, Text),
	?STANZA_ERRORT("404", "wait",   "recipient-unavailable", Lang, Text)).
-define(ERRT_REDIRECT(Lang, Text),
	?STANZA_ERRORT("302", "modify", "redirect", Lang, Text)).
-define(ERRT_REGISTRATION_REQUIRED(Lang, Text),
	?STANZA_ERRORT("407", "auth",   "registration-required", Lang, Text)).
-define(ERRT_REMOTE_SERVER_NOT_FOUND(Lang, Text),
	?STANZA_ERRORT("404", "cancel", "remote-server-not-found", Lang, Text)).
-define(ERRT_REMOTE_SERVER_TIMEOUT(Lang, Text),
	?STANZA_ERRORT("504", "wait",   "remote-server-timeout", Lang, Text)).
-define(ERRT_RESOURCE_CONSTRAINT(Lang, Text),
	?STANZA_ERRORT("500", "wait",   "resource-constraint", Lang, Text)).
-define(ERRT_SERVICE_UNAVAILABLE(Lang, Text),
	?STANZA_ERRORT("503", "cancel", "service-unavailable", Lang, Text)).
-define(ERRT_SUBSCRIPTION_REQUIRED(Lang, Text),
	?STANZA_ERRORT("407", "auth",   "subscription-required", Lang, Text)).
-define(ERRT_UNEXPECTED_REQUEST(Lang, Text),
	?STANZA_ERRORT("400", "wait",   "unexpected-request", Lang, Text)).

% TODO: update to new-style
% Application-specific stanza errors
-define(AUTH_STANZA_ERROR(Condition),
	{xmlelement, "error",
	 [{"code", "406"}, {"class", "app"}],
	 [{xmlelement, "auth-condition",
	   [{"xmlns", ?NS_AUTH_ERROR}],
	   [{xmlelement, Condition, [], []}]}]}).

-define(ERR_AUTH_NO_RESOURCE_PROVIDED,
	?AUTH_STANZA_ERROR("no-resource-provided")).
-define(ERR_AUTH_BAD_RESOURCE_FORMAT,
	?AUTH_STANZA_ERROR("bad-resource-format")).
-define(ERR_AUTH_RESOURCE_CONFLICT,
	?AUTH_STANZA_ERROR("resource-conflict")).


-define(STREAM_ERROR(Condition),
	{xmlelement, "stream:error",
	 [],
	 [{xmlelement, Condition, [{"xmlns", ?NS_STREAMS}], []}]}).

-define(SERR_BAD_FORMAT,
	?STREAM_ERROR("bad-format")).
-define(SERR_BAD_NAMESPACE_PREFIX,
	?STREAM_ERROR("bad-namespace-prefix")).
-define(SERR_CONFLICT,
	?STREAM_ERROR("conflict")).
-define(SERR_CONNECTION_TIMEOUT,
	?STREAM_ERROR("connection-timeout")).
-define(SERR_HOST_GONE,
	?STREAM_ERROR("host-gone")).
-define(SERR_HOST_UNKNOWN,
	?STREAM_ERROR("host-unknown")).
-define(SERR_IMPROPER_ADDRESSING,
	?STREAM_ERROR("improper-addressing")).
-define(SERR_INTERNAL_SERVER_ERROR,
	?STREAM_ERROR("internal-server-error")).
-define(SERR_INVALID_FROM,
	?STREAM_ERROR("invalid-from")).
-define(SERR_INVALID_ID,
	?STREAM_ERROR("invalid-id")).
-define(SERR_INVALID_NAMESPACE,
	?STREAM_ERROR("invalid-namespace")).
-define(SERR_INVALID_XML,
	?STREAM_ERROR("invalid-xml")).
-define(SERR_NOT_AUTHORIZED,
	?STREAM_ERROR("not-authorized")).
-define(SERR_POLICY_VIOLATION,
	?STREAM_ERROR("policy-violation")).
-define(SERR_REMOTE_CONNECTION_FAILED,
	?STREAM_ERROR("remote-connection-failed")).
-define(SERR_RESOURSE_CONSTRAINT,
	?STREAM_ERROR("resource-constraint")).
-define(SERR_RESTRICTED_XML,
	?STREAM_ERROR("restricted-xml")).
% TODO: include hostname or IP
-define(SERR_SEE_OTHER_HOST,
	?STREAM_ERROR("see-other-host")).
-define(SERR_SYSTEM_SHUTDOWN,
	?STREAM_ERROR("system-shutdown")).
-define(SERR_UNSUPPORTED_ENCODING,
	?STREAM_ERROR("unsupported-encoding")).
-define(SERR_UNSUPPORTED_STANZA_TYPE,
	?STREAM_ERROR("unsupported-stanza-type")).
-define(SERR_UNSUPPORTED_VERSION,
	?STREAM_ERROR("unsupported-version")).
-define(SERR_XML_NOT_WELL_FORMED,
	?STREAM_ERROR("xml-not-well-formed")).
%-define(SERR_,
%	?STREAM_ERROR("")).


-record(jid, {user, server, resource,
	      luser, lserver, lresource}).

-record(iq, {id = "",
	     type,
	     xmlns = "",
	     lang = "",
	     sub_el}).

