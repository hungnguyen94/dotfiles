# BobTheFish theme settings
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %b %d %H:%M:%S"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user hung
set -g theme_color_scheme base16-dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes

# Anaconda installation
set -gx PATH ~/conda3/bin $PATH
source ~/conda3/etc/fish/conf.d/conda.fish

# Add home local bin to path
set -gx PATH ~/.local/bin $PATH

# Set default editor
set -gx EDITOR (which nvim)

# Fix manpage issue by setting manpath
# set -gx MANPATH (manpath | string split ":")


# Ask nicely
# function please; eval command sudo $history[1]; end

alias java-decompiler "java -cp ~/.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-0/173.4548.28/plugins/java-decompiler/lib/java-decompiler.jar org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler -dgs=true"

# Abbreviations
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add dco docker-compose
    abbr --add g git
    abbr --add la "exa --git -lah"
    abbr --add ll "exa --git -lah -T -L2"
    # abbr --add ls "exa"
    abbr --add psql 'psql -h localhost -U postgres'
    abbr --add fzf "fzf --preview-window up:30%:wrap --preview 'echo {}'"
    abbr --add java-decompiler "java -cp ~/.local/share/JetBrains/Toolbox/apps/IDEA-U/ch-0/173.4548.28/plugins/java-decompiler/lib/java-decompiler.jar org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler -dgs=true"
    abbr --add pypyenv source ~/.virtualenv/pypy35/bin/activate.fish

    # Hook to set this on every command
    function sudo_last_command --on-event fish_postexec
        # Ask nicely
        abbr please sudo $argv[1]
        abbr plz sudo $argv[1]
    end
end
