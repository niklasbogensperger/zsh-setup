# zsh-setup[^1]


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


## Files

### `configs` folder

| file              | content                                                    |
| ----------------- | ---------------------------------------------------------- |
| `aliases.zsh`     | command aliases for default flags, shortcuts, replacements |
| `environment.zsh` | environment variables                                      |
| `options.zsh`     | zsh options and settings                                   |
| `path.zsh`        | additions to `$PATH` and similar variables                 |


### `functions` folder

| file                     | group                                                        | action                                                       |
| ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `01_decryptfile.zsh`     | 01 - encrypting and decrypting files with `gpg`/`gnupg`      | decrypting a file                                            |
| `01_encryptfile.zsh`     | ⬆︎                                                            | encrypting a file                                            |
| `01_tmpdecryptfile.zsh`  | ⬆︎                                                            | non-persistently decrypting a file and only displaying its contents |
| `02_gitignore.zsh`       | 02 - creating comprehensive .gitignore files via a public [API](https://www.toptal.com/developers/gitignore) | returns output of API according to parameters (usually write to file) |
| `03_externalmonitor.zsh` | 03 - opening and closing useful apps when using external monitors | opens relevant apps                                          |
| `03_internalmonitor.zsh` | ⬆︎                                                            | closes relevant apps                                         |
| `04_appidentifier.zsh`   | 04 - displaying the macOS bundle identifier of apps          | returns bundle identifier                                    |
| `05_cleanhelpers.zsh`    | 05 - creating clean zip & tar files (by excluding hidden files/directories and macOS-specific special files) | helper functions for `cleantar` & `cleanzip`                 |
| `05_cleantar.zsh`        | ⬆︎                                                            | creates a clean tar archive                                  |
| `05_cleanzip.zsh`        | ⬆︎                                                            | creates a clean zip archive                                  |
| `06_checkhash.zsh`       | 06 - computing file hashes (and optionally checking it against a provided hash) | returns file hashes or comparison result                     |
| `07_pwgen.zsh`           | 07 - generating random passwords of desired length in base64 encoding | returns randomly generated password                          |


[^1]: my system is macOS, YMMV on other platforms

