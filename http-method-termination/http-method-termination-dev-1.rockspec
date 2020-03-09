package = "http-method-termination"
version = "dev-1"
source = {
   url = "git+https://gitlab.com/domecloud/kong-http-method-termination.git"
}
description = {
   homepage = "https://gitlab.com/domecloud/kong-http-method-termination",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.http-method-termination.handler"] = "kong/plugins/http-method-termination/handler.lua",
      ["kong.plugins.http-method-termination.schema"] = "kong/plugins/http-method-termination/schema.lua"
   }
}
