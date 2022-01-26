
# Notes on Colors, Themes, etc.

I'm toying with the idea of having some "universal" notification (error/warn/success) colors that are different than my terminal or vim colors. This would make such messages more consisent, and free up terminal/vim colors for other uses (e.g. using terminal red, yellow, and green for notification colors leaves only ~5 other colors for everything else, if you don't count bright variants since they're not usually that different.)

The colors from [nvim-notify](https://github.com/rcarriga/nvim-notify) are one possible option:

- error: #f70067
- warn:  #f79000
- info:  #a9ff68
- debug: #8b8b8b
- trace: #d484ff
