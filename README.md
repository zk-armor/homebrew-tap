# zk-armor/homebrew-tap

This is a Homebrew tap for zk-armor's custom formulas.

## One-Liner Installation

The `zkLaunch` script is the recommended way to get started. It can install Homebrew, tap this repository, and install any formula (from this tap or official ones) in a single command.

The script is available at `https://is.gd/zkLaunch`.

### Usage

The script passes the `--formulas` argument directly to `brew install`. You can specify multiple formulas, separated by commas.

**Important:** To install formulas from this tap, you must use the full name: `zk-armor/tap/<formula_name>`.

### Example 1: Install a mix of formulas

This command installs `git` (official formula) and `gemini-box` (from this tap).

```bash
curl -sSL https://is.gd/zkLaunch | bash -s -- --formulas=git,zk-armor/tap/gemini-box
```

### Example 2: Install only a native formula

```bash
curl -sSL https://is.gd/zkLaunch | bash -s -- --formulas=node
```

### Example 3: Customize Homebrew path

You can also specify a custom installation directory for Homebrew itself.

```bash
curl -sSL https://is.gd/zkLaunch | bash -s -- --formulas=git --brew-path=/content/my-brew
```

## Manual Installation

If you already have Homebrew, tap this repository to get access to the formulas:

```bash
brew tap zk-armor/homebrew-tap
```

### Available Formulas

*   **gemini-box**
    ```bash
    # Install after tapping
    brew install gemini-box
    # Or install directly
    brew install zk-armor/tap/gemini-box
    ```