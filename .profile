export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

# export LDFLAGS="-L/usr/local/opt/ruby/lib"
# export CPPFLAGS="-I/usr/local/opt/ruby/include"
# 
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
# 
# export CPPFLAGS="-I/usr/local/opt/openjdk/include"
# 
# export LDFLAGS="-L/usr/local/opt/curl/lib"
# export CPPFLAGS="-I/usr/local/opt/curl/include"
# export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
 
export PATH="$HOME/.cargo/bin:$PATH"
