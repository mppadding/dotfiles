vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local o = { noremap = true, silent = true, buffer = ev.buf }
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', o, { desc = desc }))
    end

    -- Jumping
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gt', vim.lsp.buf.type_definition, 'Go to type definition')

    -- Information
    map('n', 'K', vim.lsp.buf.hover, 'Hover')
    map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

    -- Diagnostics
    vim.diagnostic.config({
      float = {
        source = true, -- or "if_many" to only show when multiple sources
      },
    })
    map('n', '<leader>ld', function() vim.diagnostic.open_float(0, { scope = 'line' }) end, 'Line diagnostics')
    map('n', '<leader>lN', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Previous diagnostic')
    map('n', '<leader>ln', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Next diagnostic')
    map('n', '<leader>ll', vim.diagnostic.setloclist, 'Diagnostics to loclist')

    -- Workspace
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
    map('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      'List workspace folders')

    -- Code Actions
    map('n', '<leader>cr', function()
      vim.lsp.buf.rename(nil, { on_rename = function() vim.cmd('writeall') end })
    end, 'Rename symbol')

    if client:supports_method('textDocument/implementation') then
      map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    end

    -- Auto-format ('lint') on save.
    -- Usually not needed if server supports 'textDocument/willSaveWaitUntil'.
    if
    --not client:supports_method('textDocument/willSaveWaitUntil')
    --and
        client:supports_method('textDocument/formatting')
    then
      local conform_fts = { javascript=1, javascriptreact=1, typescript=1, typescriptreact=1, css=1, html=1, json=1, yaml=1, markdown=1 }
      if not conform_fts[vim.bo[ev.buf].filetype] then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
          buffer = ev.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
      end
    end
  end,
})
