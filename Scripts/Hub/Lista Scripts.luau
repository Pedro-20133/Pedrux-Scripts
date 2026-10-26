return {
	exemplo = {
		Name = "Exemplo Script",
		Link = "https://raw.githubusercontent.com/user/repo/main/script.lua",
		Configs = {
			meuToggle = {
				text = "Ativar Recurso",
				tipo = "toggle",
				value = false,
			},
			meuSlider = {
				text = "Velocidade",
				tipo = "slider",
				min = 0,
				max = 100,
				value = 50, -- Padronizado para 'value'
				step = 1,
			},
			meuDropdown = {
				text = "Modo de Seleção",
				tipo = "dropdown",
				options = {"Opção 1", "Opção 2", "Opção 3"},
				value = "Opção 1", -- Padronizado para 'value'
			},
			meuInput = {
				text = "Nome do jogador",
				tipo = "input",
				placeholder = "Digite algo aqui...",
				value = "", -- Padronizado para 'value'
			},
		},
	}
}
