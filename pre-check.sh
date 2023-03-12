#!/bin/bash
nvim --version
node --version
npm --version
yarn --version
python3 --version
# https://github.com/universal-ctags/ctags
ctags --version
# brew install tree
tree --version
# https://github.com/prettier/prettier
# npm -g install prettier
prettier --version

# others
# https://github.com/jesseduffield/lazygit
lazygit --version
# https://github.com/tldr-pages/tldr
tldr --version
# https://github.com/gohugoio/hugo#choose-how-to-install
hugo version
# https://github.com/soimort/you-get#installation
you-get --version
# https://formulae.brew.sh/formula/jq
jq --version
# https://formulae.brew.sh/formula/autojump
# others https://formulae.brew.sh/formula/z
j --version

# https://github.com/commitizen/cz-cli#conventional-commit-messages-as-a-global-utility
if type commitizen > /dev/null 2>&1; then
	echo 'commitizen command exist'
else
	echo 'commitizen command not exist'
	exit 1
fi

# https://formulae.brew.sh/formula/telnet
# telnet localhost 8080
# mac native support netcat: nc -vz localhost 8080
if type telnet > /dev/null 2>&1; then
	echo '[option]: telnet command exist'
else
	echo '[option]: telnet command not exist'
fi

echo -e '\nfinish check!!!'
