# zsh-setup


## Preliminary steps
1. Install `oh-my-zsh` ([GitHub](https://github.com/ohmyzsh/ohmyzsh))
2. Install `powerlevel10k` ([GitHub](https://github.com/romkatv/powerlevel10k))


## Configuration

### `.zshrc`

1. change oh-my-zsh theme to `powerlevel10k/powerlevel10k`
2. add the following code block _before the last line_ (powerlevel10k requirement)
```shell
# import my own files
ZSHCONFIG="path to zsh config files (without any quotes)"
for config in ${ZSHCONFIG}*.zsh; do
  source "${config}"
done
unset config
ZSHFUNCT="path to zsh function files (without any quotes)"
for funct in ${ZSHFUNCT}*.zsh; do
  source "${funct}"
done
unset funct
```


### `powerlevel10k` configurator

1. classic prompt style
2. unicode
3. darkest
4. no time
5. angled separators
6. sharp heads
7. flat tails
8. one line prompt
9. compact line spacing
10. few icons
11. concise prompt flow
12. enable transient prompt


### `.p10k.zsh`

- uncomment `vpn_ip` (right prompt element) to enable vpn indicator
- set command execution time threshold to `0`
- set command execution time precision to `2`
- set vcs branch icon to `'\uF126 '`
