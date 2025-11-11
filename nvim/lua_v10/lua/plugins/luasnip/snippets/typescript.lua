-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetypes = { "typescript", "typescriptreact", "tsx" }

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

	-- console.log()
	s("cl", fmt([[ console.log({})  ]], { i(0, "") })),
}

-- load & extend snippets for each filetype ---------------

for _, filetype in pairs(filetypes) do
	ls.add_snippets(filetype, snippets, { key = filetype }) -- load
	ls.filetype_extend(filetype, { "javascript" }) -- extend
end
