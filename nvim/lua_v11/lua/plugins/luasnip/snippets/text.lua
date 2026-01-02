-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetype = "text"

-- Snippet Nodes
local s   = ls.snippet
local sn  = ls.snippet_node
local t   = ls.text_node
local i   = ls.insert_node
local f   = ls.function_node
local c   = ls.choice_node
local d   = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Add Snippets -------------------------------------------

local snippets = {

    -- Lowercase Greek letters
    s("alpha",   t("α")),
    s("beta",    t("β")),
    s("gamma",   t("γ")),
    s("delta",   t("δ")),
    s("epsilon", t("ε")),
    s("zeta",    t("ζ")),
    s("eta",     t("η")),
    s("theta",   t("θ")),
    s("iota",    t("ι")),
    s("kappa",   t("κ")),
    s("lambda",  t("λ")),
    s("mu",      t("μ")),
    s("nu",      t("ν")),
    s("xi",      t("ξ")),
    s("omicron", t("ο")),
    s("pi",      t("π")),
    s("rho",     t("ρ")),
    s("sigma",   t("σ")),
    s("tau",     t("τ")),
    s("upsilon", t("υ")),
    s("phi",     t("φ")),
    s("chi",     t("χ")),
    s("psi",     t("ψ")),
    s("omega",   t("ω")),
    
    -- Uppercase Greek letters (with capital first letter)
    s("Alpha",   t("Α")),
    s("Beta",    t("Β")),
    s("Gamma",   t("Γ")),
    s("Delta",   t("Δ")),
    s("Epsilon", t("Ε")),
    s("Zeta",    t("Ζ")),
    s("Eta",     t("Η")),
    s("Theta",   t("Θ")),
    s("Iota",    t("Ι")),
    s("Kappa",   t("Κ")),
    s("Lambda",  t("Λ")),
    s("Mu",      t("Μ")),
    s("Nu",      t("Ν")),
    s("Xi",      t("Ξ")),
    s("Omicron", t("Ο")),
    s("Pi",      t("Π")),
    s("Rho",     t("Ρ")),
    s("Sigma",   t("Σ")),
    s("Tau",     t("Τ")),
    s("Upsilon", t("Υ")),
    s("Phi",     t("Φ")),
    s("Chi",     t("Χ")),
    s("Psi",     t("Ψ")),
    s("Omega",   t("Ω")),
}

-- add_snippets() end -------------------------------------
ls.add_snippets(filetype, snippets, { key = filetype })
