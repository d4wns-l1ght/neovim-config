return {
	style = 'darker',
	term_colors = true,
	colors = {
		light_red = "#d17277",
		light_orange = "#e9c28a",
		light_yellow = "#dfc184",
		light_green = "#a0c180",
		light_blue = "#73ade9",
		light_purple = "#bb7bd7",
		light_cyan = "6fb3bf",
	},
	highlights = {
		["@lsp.type.modifier.java"] = { fg = "$purple" },
		["@type.builtin.java"] = { fg = "$purple" },
		["@lsp.type.parameter.java"] = { fg = "$orange" },
		["@variable.member.java"] = { fg = "$red" },
		["@lsp.typemod.property.private.java"] = { fg = "$red" },


		["@lsp.type.variable.java"] = { fg = "$none" },
		["@lsp.type.property.java"] = { fg = "$none" },
		["@lsp.mod.declaration.java"] = { fg = "$none" },
	},
}
