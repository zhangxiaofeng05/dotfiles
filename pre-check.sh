#!/bin/bash

# 定义颜色
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

cmd_list=(
  "nvim" # https://github.com/neovim/neovim
  "node"
  "npm"
  "yarn"
  "python3"
  "ctags"    # https://github.com/universal-ctags/ctags
  "tree"     # https://formulae.brew.sh/formula/tree
  "prettier" # https://github.com/prettier/prettier # npm -g install prettier

  # others
  "lazygit"      # https://github.com/jesseduffield/lazygit
  "tldr"         # https://github.com/tldr-pages/tldr
  "hugo"         # https://github.com/gohugoio/hugo#choose-how-to-install
  "you-get"      # https://github.com/soimort/you-get#installation
  "jq"           # https://formulae.brew.sh/formula/jq
  "autojump"     # https://github.com/wting/autojump
  "cloc"         # https://github.com/AlDanial/cloc
  "clang-format" # https://formulae.brew.sh/formula/clang-format
  "fastfetch"    # https://github.com/fastfetch-cli/fastfetch
  "md5sum"       # https://formulae.brew.sh/formula/coreutils
  "mysql"        # https://formulae.brew.sh/formula/mysql-client # mysql 命令行客户端

  # https://github.com/commitizen/cz-cli#conventional-commit-messages-as-a-global-utility # git 提交规范
  "commitizen"

  # 端口扫描 示例：sudo nmap -sS 127.0.0.1
  # https://formulae.brew.sh/formula/nmap
  "nmap"

  # 查看端口是否被占用
  # https://formulae.brew.sh/formula/telnet
  # telnet localhost 8080
  # mac native support netcat: nc -vz localhost 8080
  "nc"
)

echo -e 'checking command exist...'
for cmd in "${cmd_list[@]}"; do
  if type "$cmd" >/dev/null 2>&1; then
    echo -e "${GREEN}$cmd command exist${RESET}"
  else
    echo -e "${RED}$cmd command not exist${RESET}"
  fi
done
echo -e 'finish check!!!'
