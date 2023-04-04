if vim.env.TMUX then
	vim.g.clipboard = {
		name = "tmux",
		copy = {
			["+"] = { "tmux", "load-buffer", "-w", "-" },
			["*"] = { "tmux", "load-buffer", "-w", "-" },
		},
		paste = {
			["+"] = { "tmux", "save-buffer", "-" },
			["*"] = { "tmux", "save-buffer", "-" },
		},
		cache_enabled = false,
	}
end

return {
	colorscheme = "onedark",

	options = {
		g = {
			icons_enabled = false,
		},
	},

	lsp = {
		formatting = {
			disabled = {
				"lua_ls",
			},
		},
	},
}
