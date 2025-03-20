local set_keymaps = require("util").set_keymaps

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    set_keymaps({
      q = { vim.diagnostic.open_float, "Floating diagnostic" },
    }, { prefix = "<leader>" })

    set_keymaps({
      ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
      ["[d"] = { vim.diagnostic.goto_prev, "Prev diagnostic" },
      K = { vim.lsp.buf.hover, "LSP Hover", opts },
    })

    set_keymaps({
      a = { vim.lsp.buf.code_action, "Code action", opts },
      R = { vim.lsp.buf.rename, "Rename", opts },
      r = { "<cmd>Telescope lsp_references<cr>", "References", opts },
      l = {
        function()
          require("lsp_lines").toggle()
          vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
        end,
        "Toggle lines",
      },
      s = {
        function()
          vim.cmd("Telescope lsp_document_symbols")
        end,
        "Document symbols",
        opts,
      },
      k = {
        function()
          vim.cmd("Telescope lsp_dynamic_workspace_symbols")
        end,
        "Dynamic workspace symbols",
        opts,
      },
      S = {
        function()
          vim.cmd("Telescope lsp_workspace_symbols")
        end,
        "Signature help",
        opts,
      },
      ["?"] = { vim.lsp.buf.signature_help, "Signature help", opts },
      -- useful with conform/automatic formatting? maybe
      f = {
        function()
          vim.lsp.buf.format({ async = true })
        end,
        "Format",
        opts,
      },
      d = { vim.lsp.buf.definition, "Definition", opts },
      D = { vim.lsp.buf.declaration, "Declaration", opts },
      i = { vim.lsp.buf.implementation, "Implementation", opts },
      t = { vim.lsp.buf.type_definition, "Type definition", opts },
      h = {
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
        end,
        "Toggle inlay hints",
        opts,
      },
      v = { require("telescope.builtin").diagnostics, "Diagnostics" },
      q = { vim.diagnostic.setloclist, "Set location list" },
    }, { prefix = "<leader>l", group_name = "LSP" })

    -- idk wtf this does but im putting it in here anyways
    set_keymaps({
      a = { vim.lsp.buf.add_workspace_folder, "Add folder", opts },
      r = { vim.lsp.buf.remove_workspace_folder, "Remove folder", opts },
      l = {
        function()
          local str = ""
          for i, v in ipairs(vim.lsp.buf.list_workspace_folders()) do
            str = str .. i .. ". " .. v .. "\n"
          end
          print(str)
        end,
        "List folders",
        opts,
      },
    }, { prefix = "<leader>lw", group_name = "Workspace folders" })
  end,
})
