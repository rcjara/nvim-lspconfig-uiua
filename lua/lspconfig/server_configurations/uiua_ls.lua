local util = require 'lspconfig.util'

local root_files = {
  'main.ua',
}

return {
  default_config = {
    cmd = { 'uiua', 'lsp' },
    filetypes = { 'uiua' },
    root_dir = function(fname)
      local root = util.root_pattern(unpack(root_files))(fname)
      if root then
        return root
      end
      return util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
  },
  docs = {
    description = [[
https://github.com/uiua-lang/uiua

Uiua language server.

`Uiua language server` is a subcommand on the uiua executable and so if you have uiua installed, you already have it.  Uiua itselfcan be installed by following the instructions [here](https://github.com/uiua-lang/uiua/blob/main/readme.md#installation).

The default `cmd` assumes that the `uiua` binary can be found in `$PATH`.

]],
    default_config = {
      root_dir = [[root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git")]],
    },
  },
}

