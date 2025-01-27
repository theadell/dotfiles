-- Load override if exists otherwise use the default google styles!
local _, local_style = pcall(require, "plugins.config.java_style_local")
-- print("Local style load success:", ok)
-- print("Local style content:", vim.inspect(local_style))

local final_style = local_style or {
  url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
  profile = "GoogleStyle"
}

-- print("Final style being used:", vim.inspect(final_style))
-- print("File exists:", vim.fn.filereadable(vim.fn.expand(final_style.url)) == 1)

return final_style

