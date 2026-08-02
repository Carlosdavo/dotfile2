# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

export PATH="$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin:$HOME/.cargo/bin:$HOME/.config:$PATH"
export PATH="/Users/$USER/Library/Python/3.9/bin/:$PATH"
export PATH="/Users/$USER/.local/bin:$PATH"
export RIPGREP_CONFIG_PATH="/Users/$USER/.config/ripgrep/rgrc"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

setopt AUTO_CD              
setopt EXTENDED_GLOB        
setopt NOMATCH             
setopt NOTIFY               
setopt PROMPT_SUBST         
setopt AUTO_PUSHD           
setopt PUSHD_IGNORE_DUPS    
setopt PUSHD_SILENT         

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY       
setopt SHARE_HISTORY        
setopt HIST_IGNORE_DUPS     
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_FIND_NO_DUPS    
setopt HIST_REDUCE_BLANKS   

autoload -Uz compinit
compinit


zmodload zsh/complist
autoload -U colors && colors


zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# LS COLORS
export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"

# Modo Vim
bindkey -v
# Teclas especiales
bindkey '^[[3~' delete-char
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word

# Búsqueda en historial (esencial)
bindkey '^R' history-incremental-search-backward

# Timeout más rápido para cambiar de modo
export KEYTIMEOUT=1

# En modo INSERT, permitir Ctrl+A y Ctrl+E (inicio/fin)
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# En modo INSERT, Ctrl+W para borrar palabra
bindkey -M viins '^W' backward-kill-word

PLUGIN_DIR="$HOME/.config/zsh/plugins"


# zsh-autosuggestions (detecta automáticamente la ubicación)
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"

# zsh-syntax-highlighting (detecta automáticamente la ubicación - debe ser el último)
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_HIGHLIGHT_STYLES[command]='fg=#5f033f,bold'              
ZSH_HIGHLIGHT_STYLES[alias]='fg=#5f033f,bold'              
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#5f033f,bold'              
ZSH_HIGHLIGHT_STYLES[function]='fg=#1F2C4C,bold'             
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#1F2C4C,bold'           

# Comandos inválidos/errores - Crushed Berry
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#a4303f,bold'        
ZSH_HIGHLIGHT_STYLES[command-not-found]='fg=#a4303f,bold'    

# Paths y archivos - NARANJA/CAFÉ
ZSH_HIGHLIGHT_STYLES[path]='fg=#1b998b'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#1b998b'
ZSH_HIGHLIGHT_STYLES[path_separator]='fg=#1b998b'

# Arguments y strings - BLANCO
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=white'

# Options/flags - BLANCO
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=white'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=white'

# Redirección y globbing - ROJIZO SUAVE
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ff6b6b'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ff6b6b'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ff6b6b'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ff6b6b'

# Comentarios - GRIS
ZSH_HIGHLIGHT_STYLES[comment]='fg=#5c6370'

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

WM_VAR="$TMUX"
WM_CMD="tmux"

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cd='z'
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias venv="source .venv/bin/activate"
alias vi="nvim"
alias im="nvim"
alias sim='sudo /home/avro102/.local/share/bob/nvim-bin/nvim'
alias ls="ls -C -t -U -A -p --color=auto" 
alias src="source ~/.zshrc"
alias cc="clear"

finder() {
    dolphin . &>/dev/null & disown
}
zle -N finder
bindkey '^f' finder

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Función para abrir Lazygit con Ctrl+G
lazygit_widget() {
    lazygit
    zle reset-prompt
}
zle -N lazygit_widget
bindkey '^g' lazygit_widget

# FZF
eval "$(fzf --zsh)"

# Zoxide (mejor cd)
eval "$(zoxide init zsh)"

# Atuin (mejor history)
eval "$(atuin init zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

start_if_needed
source ~/powerlevel10k/powerlevel10k.zsh-theme
export WAYLAND_DISPLAY=wayland-1
