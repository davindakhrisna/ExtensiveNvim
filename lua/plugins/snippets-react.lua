return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "dsznajder/vscode-es6-javascript-snippets",
    },
    config = function()
      local ls = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local c = ls.choice_node
      local fmt = require("luasnip.extras.fmt").fmt

      -- Get filename without extension for component names
      local function get_component_name()
        return vim.fn.expand("%:t:r")
      end

      ls.add_snippets("typescriptreact", {
        -- React functional component
        s(
          "rfc",
          fmt(
            [[
          import React from 'react'
          
          interface {}Props {{
            {}
          }}
          
          const {}: React.FC<{}Props> = ({{{}}}) => {{
            return (
              <div>
                {}
              </div>
            )
          }}
          
          export default {}
        ]],
            {
              f(get_component_name),
              i(1),
              f(get_component_name),
              f(get_component_name),
              i(2),
              i(0),
              f(get_component_name),
            }
          )
        ),

        -- React hook
        s(
          "rhook",
          fmt(
            [[
          import {{ useState, useEffect }} from 'react'
          
          export const use{} = ({}) => {{
            const [{}] = useState({})
            
            useEffect(() => {{
              {}
            }}, [{}])
            
            return {{ {} }}
          }}
        ]],
            {
              i(1, "CustomHook"),
              i(2),
              i(3, "state"),
              i(4, "initialValue"),
              i(5),
              i(6),
              i(7),
            }
          )
        ),

        -- NextJS page component
        s(
          "npage",
          fmt(
            [[
          import {{ NextPage }} from 'next'
          import Head from 'next/head'
          
          const {}: NextPage = () => {{
            return (
              <>
                <Head>
                  <title>{}</title>
                  <meta name="description" content="{}" />
                </Head>
                <main>
                  {}
                </main>
              </>
            )
          }}
          
          export default {}
        ]],
            {
              f(get_component_name),
              i(1, "Page Title"),
              i(2, "Page description"),
              i(0),
              f(get_component_name),
            }
          )
        ),

        -- NextJS API route
        s(
          "napi",
          fmt(
            [[
          import {{ NextApiRequest, NextApiResponse }} from 'next'
          
          export default async function handler(
            req: NextApiRequest,
            res: NextApiResponse
          ) {{
            if (req.method === '{}') {{
              try {{
                {}
                res.status(200).json({{ success: true }})
              }} catch (error) {{
                res.status(500).json({{ error: 'Internal server error' }})
              }}
            }} else {{
              res.setHeader('Allow', ['{}'])
              res.status(405).end(`Method ${{req.method}} Not Allowed`)
            }}
          }}
        ]],
            {
              c(1, { t("GET"), t("POST"), t("PUT"), t("DELETE") }),
              i(0),
              i(2, "GET, POST"),
            }
          )
        ),

        -- NextJS getServerSideProps
        s(
          "ngsp",
          fmt(
            [[
          import {{ GetServerSideProps }} from 'next'
          
          export const getServerSideProps: GetServerSideProps = async (context) => {{
            {}
            
            return {{
              props: {{
                {}
              }}
            }}
          }}
        ]],
            {
              i(1),
              i(0),
            }
          )
        ),

        -- NextJS getStaticProps
        s(
          "ngtp",
          fmt(
            [[
          import {{ GetStaticProps }} from 'next'
          
          export const getStaticProps: GetStaticProps = async (context) => {{
            {}
            
            return {{
              props: {{
                {}
              }},
              revalidate: {} // seconds
            }}
          }}
        ]],
            {
              i(1),
              i(2),
              i(0, "60"),
            }
          )
        ),
      })

      -- JavaScript React snippets (similar structure)
      ls.add_snippets("javascriptreact", {
        s(
          "rfc",
          fmt(
            [[
          import React from 'react'
          
          const {} = ({{{}}}) => {{
            return (
              <div>
                {}
              </div>
            )
          }}
          
          export default {}
        ]],
            {
              f(get_component_name),
              i(1),
              i(0),
              f(get_component_name),
            }
          )
        ),
      })

      -- Set up keymaps for snippets
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        ls.jump(-1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  -- React-specific plugins
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
