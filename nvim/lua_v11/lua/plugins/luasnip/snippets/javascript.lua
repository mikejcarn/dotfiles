-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetypes = { "javascript", "javascriptreact", "jsx" }

-- Snippet Nodes
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Add Snippets -------------------------------------------

local snippets = {

	-- console.log(})
	s("cl", fmt([[ console.log({})  ]], { i(0, "") })),

	-- () => {}
	s(
		"af",
		fmt(
			[[ 
      ({}) => {{ 
        {} 
      }} ]],
			{ i(1, ""), i(0, "") }
		)
	),

	-- const var = () => {}
	s(
		"afc",
		fmt(
			[[ 
      const {} = ({}) => {{ 
        {} 
      }} ]],
			{ i(1, ""), i(2, ""), i(0, "") }
		)
	),

	-- import { var } from '../dir'
	s(
		"impc",
		fmt(
			[[
	      import {{ {} }} from '{}'
	       ]],
			{ i(0, ""), i(1, "") }
		)
	),
}

-- load snippets for each filetype
for _, filetype in pairs(filetypes) do
	ls.add_snippets(filetype, snippets, { key = filetype })
end
