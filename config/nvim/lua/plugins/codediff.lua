-- VSCode-style, keyboard-driven review of branch and worktree changes.
return {
  'esmuellert/codediff.nvim',
  cmd = 'CodeDiff',
  opts = {},
  keys = {
    {
      '<leader>rd', -- "review diff" (libre, no choca con <leader>gd de LSP)
      function()
        local function branch_exists(name)
          vim.fn.system { 'git', 'show-ref', '--verify', '--quiet', 'refs/heads/' .. name }
          return vim.v.shell_error == 0
        end

        local base = branch_exists 'default' and 'default' or 'main'

        if not branch_exists(base) then
          vim.notify('codediff: no existe la rama "default" ni "main" en este repo', vim.log.levels.WARN)
          return
        end

        vim.cmd('CodeDiff ' .. base .. '...')
      end,
      desc = 'Review branch against default/main',
    },
  },
}
