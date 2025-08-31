-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetype = "html"

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
}

-- add_snippets() end -------------------------------------
ls.add_snippets(filetype, snippets, { key = filetype })
