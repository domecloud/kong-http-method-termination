local BasePlugin = require "kong.plugins.base_plugin"

local HTTPMethodHandler = BasePlugin:extend()

HTTPMethodHandler.PRIORITY = 1008
HTTPMethodHandler.VERSION = "0.1.0"

function HTTPMethodHandler:new()
    HTTPMethodHandler.super.new(self, "http-method-termination")
end

function HTTPMethodHandler:access(conf)
    if kong.request.get_method() == conf.method then
        kong.response.set_header('Content-Type', conf.content_type)
        return kong.response.exit(conf.status_code, conf.body)
    end
end

return HTTPMethodHandler
