
if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias c="clear"
alias v="nvim"

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Alias para reemplazar ls con eza
if type -q eza
    alias ls "eza --icons --long --color=always --no-user"
    alias ll "eza --icons -l --git"  # Lista larga con info de Git
    alias la "eza --icons -a"       # Mostrar archivos ocultos
    alias lla "eza --icons -la"     # Lista larga con ocultos
end

set -U fish_greeting ""   # elimina la bienvenida de fish

starship init fish | source

