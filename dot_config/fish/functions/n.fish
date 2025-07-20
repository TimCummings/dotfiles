# NNN: enable cd on quit with ^G
function n
  # Block nesting of nnn in subshells
  if test (math "$NNNLVL" 2>/dev/null || echo 0) -ge 1
    echo "nnn is already running"
    return
  end

  set -l NNN_TMPFILE (string join '' \
    (test -n "$XDG_CONFIG_HOME"; and echo "$XDG_CONFIG_HOME"; or echo "$HOME/.config") \
    "/nnn/.lastd")

  nnn-nerd-static -eoR $argv

  if test -f "$NNN_TMPFILE"
    source "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  end
end
