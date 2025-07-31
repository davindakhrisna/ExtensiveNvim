-- React/Next.js specific keymaps
return {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    spec = {
      { "<leader>r", group = "React/Next.js" },
      { "<leader>rc", desc = "Create React component" },
      { "<leader>rh", desc = "Create React hook" },
      { "<leader>rp", desc = "Create Next.js page" },
      { "<leader>ra", desc = "Create Next.js API route" },
      { "<leader>rt", desc = "Run tests" },
      { "<leader>rb", desc = "Build project" },
      { "<leader>rd", desc = "Start dev server" },
    },
  },
  init = function()
    -- React/Next.js specific keymaps
    vim.keymap.set("n", "<leader>rc", function()
      -- Create new React component
      local component_name = vim.fn.input("Component name: ")
      if component_name ~= "" then
        local file_path = vim.fn.expand("%:p:h") .. "/" .. component_name .. ".tsx"
        vim.cmd("edit " .. file_path)
        -- Insert React component snippet
        vim.api.nvim_put({
          "import React from 'react'",
          "",
          "interface " .. component_name .. "Props {",
          "  // Add props here",
          "}",
          "",
          "const " .. component_name .. ": React.FC<" .. component_name .. "Props> = () => {",
          "  return (",
          "    <div>",
          "      <h1>" .. component_name .. "</h1>",
          "    </div>",
          "  )",
          "}",
          "",
          "export default " .. component_name
        }, "l", false, true)
      end
    end, { desc = "Create React component" })

    vim.keymap.set("n", "<leader>rh", function()
      -- Create new React hook
      local hook_name = vim.fn.input("Hook name (without 'use'): ")
      if hook_name ~= "" then
        local file_path = vim.fn.expand("%:p:h") .. "/use" .. hook_name .. ".ts"
        vim.cmd("edit " .. file_path)
        -- Insert React hook snippet
        vim.api.nvim_put({
          "import { useState, useEffect } from 'react'",
          "",
          "export const use" .. hook_name .. " = () => {",
          "  const [state, setState] = useState()",
          "",
          "  useEffect(() => {",
          "    // Effect logic here",
          "  }, [])",
          "",
          "  return { state, setState }",
          "}"
        }, "l", false, true)
      end
    end, { desc = "Create React hook" })

    vim.keymap.set("n", "<leader>rp", function()
      -- Create new Next.js page
      local page_name = vim.fn.input("Page name: ")
      if page_name ~= "" then
        local file_path = vim.fn.expand("%:p:h") .. "/" .. page_name .. ".tsx"
        vim.cmd("edit " .. file_path)
        -- Insert Next.js page snippet
        vim.api.nvim_put({
          "import { NextPage } from 'next'",
          "import Head from 'next/head'",
          "",
          "const " .. page_name .. "Page: NextPage = () => {",
          "  return (",
          "    <>",
          "      <Head>",
          "        <title>" .. page_name .. "</title>",
          "        <meta name=\"description\" content=\"" .. page_name .. " page\" />",
          "      </Head>",
          "      <main>",
          "        <h1>" .. page_name .. "</h1>",
          "      </main>",
          "    </>",
          "  )",
          "}",
          "",
          "export default " .. page_name .. "Page"
        }, "l", false, true)
      end
    end, { desc = "Create Next.js page" })

    vim.keymap.set("n", "<leader>ra", function()
      -- Create new Next.js API route
      local api_name = vim.fn.input("API route name: ")
      if api_name ~= "" then
        local file_path = vim.fn.expand("%:p:h") .. "/" .. api_name .. ".ts"
        vim.cmd("edit " .. file_path)
        -- Insert Next.js API route snippet
        vim.api.nvim_put({
          "import { NextApiRequest, NextApiResponse } from 'next'",
          "",
          "export default async function handler(",
          "  req: NextApiRequest,",
          "  res: NextApiResponse",
          ") {",
          "  if (req.method === 'GET') {",
          "    try {",
          "      // Handle GET request",
          "      res.status(200).json({ message: 'Success' })",
          "    } catch (error) {",
          "      res.status(500).json({ error: 'Internal server error' })",
          "    }",
          "  } else {",
          "    res.setHeader('Allow', ['GET'])",
          "    res.status(405).end(`Method ${req.method} Not Allowed`)",
          "  }",
          "}"
        }, "l", false, true)
      end
    end, { desc = "Create Next.js API route" })

    -- Quick terminal commands for React/Next.js development
    vim.keymap.set("n", "<leader>rt", function()
      vim.cmd("ToggleTerm cmd='npm test'")
    end, { desc = "Run tests" })

    vim.keymap.set("n", "<leader>rb", function()
      vim.cmd("ToggleTerm cmd='npm run build'")
    end, { desc = "Build project" })

    vim.keymap.set("n", "<leader>rd", function()
      vim.cmd("ToggleTerm cmd='npm run dev'")
    end, { desc = "Start dev server" })
  end,
}
