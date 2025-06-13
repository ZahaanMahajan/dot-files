# ─────────────────────────────────────────────
# ⚙️  General Aliases
# ─────────────────────────────────────────────
alias vim='nvim'
alias ls='colorls'
alias lsa='colorls -a'
alias lc='colorls -lA --sd'
alias ide='~/.ide.zsh'
alias reload='source ~/.zshrc'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias ports='lsof -i -P -n | grep LISTEN'

# ─────────────────────────────────────────────
# 🧠 Tmux Aliases
# ─────────────────────────────────────────────
alias tm='tmux'
alias tma='tmux attach-session'
alias tmat='tmux attach-session -t'
alias tmks='tmux kill-session -a'
alias tml='tmux list-sessions'
alias tmn='tmux new-session'
alias tmns='tmux new -s'
alias tms='tmux new-session -s'

# ─────────────────────────────────────────────
# 🔧 Kill Process by Port
# Usage: kill 3000
# ─────────────────────────────────────────────
alias kill='f() { lsof -t -i:$1 | xargs kill -9; }; f'

# ─────────────────────────────────────────────
# 🐙 Git & GitHub Aliases
# ─────────────────────────────────────────────
alias ga='git add .'
alias gc='git commit -m'
alias gpu='git push'
alias gpl='git pull'
alias gr='git rebase'
alias gm='git merge'
alias gs='git status'
alias gl='git log'

# 🛰️ Remotes
alias gf='git fetch'
alias gra='git remote add'
alias grv='git remote -v'
alias grm='git remote rm'
alias gri='git remote show origin'

# 🌿 Branching
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'

# 🚀 Push/Pull
alias gpo='git push origin'
alias gplo='git pull origin'

# 📦 Stashing
alias gst='git stash'
alias gstp='git stash pop'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstd='git stash drop'

# 🧹 Cleanup & Undo
alias gclean='git clean -fd'
alias gprune='git remote prune origin'
alias gundo='git reset --soft HEAD~1'

# 🔍 Logging & Diff
alias gd='git diff'
alias gds='git diff --staged'
alias gll='git log --oneline --graph --decorate --all'

# ✅ GitHub CLI (requires `gh` installed)
alias gpullpr='gh pr checkout'
alias gprlist='gh pr list'
alias gprview='gh pr view --web'
alias gopen='gh repo view --web'
alias gissue='gh issue list'

# ─────────────────────────────────────────────
# 📂 Yazi File Manager Function
# ─────────────────────────────────────────────
sf() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ─────────────────────────────────────────────
# 🕒 Video Duration Summary (using ffprobe)
# ─────────────────────────────────────────────
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


extract () {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1" ;;
      *.tar.gz)    tar xzf "$1" ;;
      *.bz2)       bunzip2 "$1" ;;
      *.rar)       unrar x "$1" ;;
      *.gz)        gunzip "$1" ;;
      *.tar)       tar xf "$1" ;;
      *.tbz2)      tar xjf "$1" ;;
      *.tgz)       tar xzf "$1" ;;
      *.zip)       unzip "$1" ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1" ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
