# Install pry

```bash
gem install pry pry-theme
```

## Use pry

- As irb: `pry`
- As rails console: `script/console --irb=pry`
- As a debugger: `require 'pry'; binding.pry` in your code (or just type `pry!<space>` to make VIM do it)

## Pry customizations

- `clear` command to clear screen
- `sql` command to execute something (within a rails console)
- All objects displayed in readable format (colorized, sorted hash keys) - via pry-theme
- Type `help` to see all the commands
- Some toy objects to play with: `Hash.toy` or `Array.toy`
