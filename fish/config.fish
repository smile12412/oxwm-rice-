if status is-interactive
# Commands to run in interactive sessions can go here
end

# opencode
fish_add_path /home/jeffy/.opencode/bin

starship init fish | source


# Added by Antigravity CLI installer
set -gx PATH "/home/jeffy/.local/bin" $PATH
