local typedefs = require "kong.db.schema.typedefs"

local METHODS = {
  "GET",
  "HEAD",
  "PUT",
  "PATCH",
  "POST",
  "DELETE",
  "OPTIONS",
  "TRACE",
  "CONNECT",
}

return {
    name = "http-method-termination",
    fields = {
        { protocols = typedefs.protocols_http },
        { config = {
            type = "record",
            fields = {
                { method = { type = "string", default = "OPTIONS", one_of = METHODS, required = true } },
                { status_code = { type = "integer", default = 204, between = { 100, 599 } } },
                { body = { type = "string" } },
                { location = { type = "string" } },
                { content_type = { type = "string", default = 'application/json' } },
            } }
        }
    }
}
