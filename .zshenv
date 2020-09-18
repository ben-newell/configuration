# Add stuff to the `$PATH`
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
# $PATH can have several paths seperated by a colon.
export PATH="$HOME/bin:/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/opt/ruby/bin:$PATH"
alias reloadprofile='source /etc/zprofile && source ~/.zshrc'

[ -n "$PS1" ] && source ~/.zshrc;
