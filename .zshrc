# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	# other plugins
	brew
	tmux
	zsh-autosuggestions
	docker
	docker-compose
	gh
)

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvim
alias vim="nvim"

function get_ip() {
	curl ip.sb
}
# proxy
function proxy_on() {
	get_ip
    export http_proxy=http://127.0.0.1:1081
    export https_proxy=$http_proxy
    echo -e "hello, terminal proxy is [on] !!!"
	get_ip
}
function proxy_off(){
	get_ip
    unset http_proxy https_proxy
    echo -e "bye, terminal proxy is [off] !!!"
	get_ip
}


# go
export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export GOPROXY=https://goproxy.cn
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


