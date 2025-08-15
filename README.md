# zk-armor/homebrew-tap

This is a Homebrew tap for zk-armor's custom formulas.

## Quickstart Installation

You can use the `zkLaunch` script to install Homebrew, tap this repository, and install formulas all in one command.

### Basic Usage

To install the `gemini-box` formula:
```bash
curl -sSL https://is.gd/zkLaunch | bash -s -- --formulas gemini-box
```

### Advanced Usage

The installation script accepts further arguments to customize the setup.

*   `--formulas <formula1,formula2>`: A comma-separated list of formulas to install from this tap.
*   `--brew-path <path>` or `--brew-path=<path>`: Sets a custom installation path for Homebrew.

**Example:** Install `gemini-box` and set a custom Homebrew path.
```bash
curl -sSL https://is.gd/zkLaunch | bash -s -- --formulas=gemini-box --brew-path=/opt/homebrew
```

## Manual Installation

If you already have Homebrew installed, you can tap this repository directly:

```bash
brew tap zk-armor/homebrew-tap
```

Then, you can install any of the available formulas.

### Available Formulas

*   `gemini-box`: A portable, self-contained "box" for the Google Gemini CLI.
    ```bash
    brew install gemini-box
    ```
