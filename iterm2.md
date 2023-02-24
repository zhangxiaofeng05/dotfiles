## open file in terminal
https://coderwall.com/p/5hp1yg/iterm2-cmd-click-to-open-file-in-vim-in-terminal

settings... -> Profiles -> Advanced -> Semantic History, choose "Run coprocess...". In the text field, put
```text
echo nvim \1 +\2
```
