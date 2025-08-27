local M = {}

function M.toggle()
  local word = vim.fn.expand("<cword>")
  local replacement = "bruh"
  if word == "true" then
    replacement = "false"
  elseif word == "false" then
    replacement = "true"
  elseif word == "False" then
    replacement = "True"
  elseif word == "True" then
    replacement = "False"
  elseif word == "FALSE" then
    replacement = "TRUE"
  elseif word == "TRUE" then
    replacement = "FALSE"
  end

  if replacement ~= "bruh" then
    vim.cmd("normal! ciw" .. replacement)
    vim.cmd("normal! b")
    return 1
  else
    return 0
  end
end

function M.setup()
  vim.keymap.set("n", "<C-x>", function()
    if (M.toggle())
    then
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-x>", true, false, true), "n", true
      )
    end
  end, { desc = "Toggle True/False under cursor" })

  vim.keymap.set("n", "<C-a>", function()
    if (M.toggle())
    then
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-a>", true, false, true), "n", true
      )
    end
  end, { desc = "Toggle True/False under cursor" })
end

return M
