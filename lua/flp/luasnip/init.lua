require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
vim.api.nvim_set_keymap("i", "<A-l>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<A-l>", "<Plug>luasnip-next-choice", {})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
ls.add_snippets("typescript", {s("arrow", {t("const arrow = () => {}")})})
ls.add_snippets("all", {
  s("bfa", {t("beforeAll( async() => {"), t({"", "  await connect(__filename)"}), t({"", "})"})})
})

ls.add_snippets("all", {
  s("testsuite", {
    t("describe(' ', () => {"), t({"", "beforeAll( async() => {"}),
    t({"", "  await connect(__filename)"}), t({"", "})"}), t({"", "afterAll( async() => {"}),
    t({"", "  await disconnect(__filename)"}), t({"", "})"}),
    t({"", "it('should ' , async() => {"}), t({"", "expect(true).toBe(true)"}),
    t({"", "})", "", "})"})
  })
})
