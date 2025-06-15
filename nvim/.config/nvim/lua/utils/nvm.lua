local M = {}

local cached_node_path = nil

--- Get a Node.js path from nvm
--- Returns { node_path, fallback_reason_string (or nil) }
function M.get_node_path_from_nvm()
  if cached_node_path then
    return cached_node_path, nil
  end

  -- Could add this after the source "..." and before which node to contol what node version
  -- but for now we just pick the current one that is in use
  -- nvm use --silent > /dev/null
  local handle = io.popen([[
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    which node
  ]])

  if not handle then
    return nil, "Failed to open shell for NVM"
  end

  local node_path = handle:read("*a")
  handle:close()
  node_path = vim.fn.trim(node_path)

  if node_path == "" then
    return nil, "NVM did not return a node path"
  end

  cached_node_path = node_path
  return node_path, nil
end

--- Construct LSP cmd with node and langserver
function M.make_lsp_cmd(langserver)
  local node, err = M.get_node_path_from_nvm()
  if not node then
    vim.notify("NVM fallback: " .. err, vim.log.levels.WARN)
    return { langserver, "--stdio" }
  end

  return { node, vim.fn.exepath(langserver), "--stdio" }
end

return M
