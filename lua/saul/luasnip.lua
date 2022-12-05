local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix

-- Customized Snippet
ls.add_snippets("tex", {
    s("frame", {
        t({"\\begin{frame}"}),
        t({"", "    \\frametitle{"}), i(1), t({"}"}),
        t({"", "    "}), i(2),
        t({"", "\\end{frame}"}),
        t({""}), i(0),
    })
})
