Plugin = {use = {}, config = nil}
function Plugin:new(use,config)
  local self = setmetatable({}, Plugin)
  self.use = use
  self.config = config or nil
  return self
end

function Plugin:get_use()
  return self.use
end

return Plugin
