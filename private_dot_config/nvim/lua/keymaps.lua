local wk = require("which-key")

wk.register({
	["<Tab>"] = { ":BufferLineCycleNext<CR>", "Move to the next buffer" },
	["<S-Tab>"] = { ":BufferLineCyclePrev<CR>", "Move to the previous buffer" },
})
