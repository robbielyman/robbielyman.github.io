local function runner()
  local busted = require 'busted.core' ()
  require 'busted' (busted)
  local directory = os.getenv("SEAMSTRESS_LUA_PATH") ..
      package.config:sub(1, 1) .. "test"
  local loadTestFiles =
    require 'busted.modules.test_file_loader'(busted, { 'lua' })
  loadTestFiles({ directory }, { '_spec' }, { excludes = {} })
  
  local handler = require 'busted.outputHandlers.base' ()
  handler:subscribe({ language = 'en' })

  local execute = require 'busted.execute' (busted)
  execute(1, {})
end
