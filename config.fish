# BobTheFish theme settings
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support no
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user no
set -g theme_display_vi yes
set -g theme_display_date yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_color_scheme zenburn
set -g theme_newline_cursor no
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Anaconda installation
set -gx PATH ~/anaconda3/bin $PATH
source ~/anaconda3/etc/fish/conf.d/conda.fish
# Don't activate the conda env on start because it's slow
#conda activate default

# Add home local bin to path
set -gx PATH ~/.local/bin $PATH

# Set default editor
set -gx EDITOR (which vim)

# Fix manpage issue by setting manpath
set -gx MANPATH (manpath | string split ":")

# RBEnv
set -gx PATH $HOME/.rbenv/bin $PATH

alias dco=docker-compose
