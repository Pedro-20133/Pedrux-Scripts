return {
	["Exemplo"] = {
		Name = "Exemplo",
		Link = "https://raw.githubusercontent.com/Pedro-20133/Pedrux-Scripts/refs/heads/Main/Scripts/Teste.luau",
		Configs = {
			["ex1"] = {
				typee = "toggle",
				text = "Toggle",
				value = false,
			},
			["ex2"] = {
				typee = "slider",
				text = "Slider",
				suffix = "",
				value = 7,
				min = 0,
				max = 10,
				step = 1,
			},
			["ex3"] = {
				typee = "dropdown",
				text = "Dropdown",
				options = {"1", "2", "3", "4", "5"},
				allowMultiple = false,
				value = "1",
			},
			["ex4"] = {
				typee = "input",
				text = "Input",
				value = "",
				placeHolder = "Type here",
				onlyNumbers = false,
			},
			["ex5"] = {
				typee = "keybind",
				text = "Keybind",
				value = Enum.KeyCode.E,
			},
		}
	}
}
