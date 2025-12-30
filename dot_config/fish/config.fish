# Setting environment variables
set -gx GPG_TTY (tty)
set -gx EDITOR nvim
set -gx MANPAGER "nvim +Man!"

# Add to PATH
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# Setting up eza
type -P eza > /dev/null 2>&1
if test $status -eq 0
    alias ls="eza --icons"
    alias ll="eza --icons -l"
    alias la="eza --icons -la"
    alias lt="eza --icons -lT"
    alias lta="eza --icons -lTa"
end

# Setting up aliases
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias playau="mpv --no-video --ytdl-format=bestaudio"
alias gis="git status"
alias gid="git diff"
alias gia="git add"
alias gic="git commit"
alias gip="git push"
alias gil="git log"
alias sass="sass --no-source-map"
alias playtorrent="webtorrent download --mpv"

mise activate fish | source
