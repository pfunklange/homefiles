
for file in .bashrc.d/completions/*.bash .bashrc.d/*.sh .bashrc.d/*.bash; do
  source $file; echo -n '.'
done

[ -f ~/.bashrc.local ] && source ~/.bashrc.local
