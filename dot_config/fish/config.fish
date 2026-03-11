# Setting environment variables
set -gx GPG_TTY (tty)
set -gx EDITOR nvim
set -gx MANPAGER "nvim +Man!"

# Add to PATH
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.cargo/bin

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
abbr -a update-grub sudo grub-mkconfig -o /boot/grub/grub.cfg
abbr -a playau mpv --no-video --ytdl-format=bestaudio
abbr -a playyt mpv --ytdl-format=bestvideo[height<=1080]+bestaudio

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

type -P mise > /dev/null 2>&1
if test $status -eq 0
	mise activate fish | source
end
