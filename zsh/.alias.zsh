## Alias
alias vim=nvim
alias ls='colorls'
alias lsa='colorls -a'
alias ide='~/.ide.zsh'
alias lc='colorls -lA --sd'

alias duration='
find . -maxdepth 2 -type f ! -name ".*" -exec sh -c "
  sum=0;
  for file in \"\$@\"; do
    duration=\$(ffprobe -v error -select_streams v:0 -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 \"\$file\" 2>/dev/null);
    if [ -n \"\$duration\" ]; then
      echo \"File: \$file - Duration: \$(echo \$duration | awk '\''{printf \"%02d:%02d:%02d\n\", \$1/3600, (\$1%3600)/60, \$1%60}'\'')\";
      sum=\$(echo \"\$sum + \$duration\" | bc);
    fi;
  done;
  echo \"Total duration: \$(echo \$sum | awk '\''{printf \"%02d:%02d:%02d\n\", \$1/3600, (\$1%3600)/60, \$1%60}'\'')\"
" _ {} +'


## Yazi
function ff() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


## Tmux Alias
alias tm='tmux'
alias tma='tmux attach-session'
alias tmat='tmux attach-session -t'
alias tmks='tmux kill-session -a'
alias tml='tmux list-sessions'
alias tmn='tmux new-session'
alias tmns='tmux new -s'
alias tms='tmux new-session -s'


## Kill Process
alias kill='f() { lsof -t -i:$1 | xargs kill -9; }; f'

