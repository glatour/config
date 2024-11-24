. ~/.config/fish/aliases.fish

#set -x PROJECT_PATHS ~/Code/

export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#source ~/Code/google-cloud-sdk/path.fish.inc

# https://kevinkreuzer.medium.com/the-ultimate-terminal-8033ff80d631
# fish_add_path /opt/homebrew/bin
#oh-my-posh --init --shell fish --config ~/.poshthemes/blue-owl.json | source

alias fishconfig "nvim ~/.config/fish/config.fish"
alias sourcefishconfig "source ~/.config/fish/config.fish"
alias nvimconfig "cd ~/.config/nvim/ && nvim"
alias g "git"
alias code "cd ~/code"

starship init fish | source

