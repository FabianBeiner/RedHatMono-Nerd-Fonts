# RedHatMono Nerd Fonts

Pre-patched Nerd Font variants based on [Red Hat Mono](https://github.com/RedHatOfficial/RedHatFont), ready for immediate download and use.

This repository is a clean release archive for pre-generated font files—not a build tool or development repository.

> **Note:** This project is not affiliated with, endorsed by, or maintained by [Red Hat](https://www.redhat.com/) or the [Nerd Fonts](https://www.nerdfonts.com/) project.

## Overview

Pre-patched Nerd Font variants based on the beautiful [Red Hat Mono](https://github.com/RedHatOfficial/RedHatFont) typeface. Choose between strict monospace alignment for terminals and code or visually detailed icons for general use.

**Available formats:**
- TTF and OTF
- Mono and regular variants
- Ready to install and use

## Quick Start

### Download

Fonts are organized by format and variant:

```
fonts/
├── ttf/
│   ├── mono/        # For terminals, editors, code
│   └── regular/     # For general use
└── otf/
    ├── mono/        # For terminals, editors, code
    └── regular/     # For general use
```

### Install

**Windows:**
Download the `.ttf` or `.otf` files, double-click, and select **Install** or **Install for all users**.

**macOS:**
Download the files, open in **Font Book**, and click **Install Font**.

**Linux:**
```bash
cp RedHatMono*.ttf ~/.local/share/fonts/
fc-cache -f
```

### Use

Reference the font by its installed name in your applications:

```css
/* Terminal, editor, or code context */
font-family: "RedHatMono Nerd Font Mono", monospace;

/* General text */
font-family: "RedHatMono Nerd Font", system-ui, sans-serif;
```

## Font Variants

### Mono
For terminals, editors, code blocks, and environments requiring strict character alignment.

**Recommended font stacks:**
```css
font-family: "RedHatMono Nerd Font Mono", "Red Hat Mono", "Cascadia Mono", "DejaVu Sans Mono", monospace;
```

### Regular
For general use where larger, more visually detailed icons are preferred.

**Recommended font stacks:**
```css
font-family: "RedHatMono Nerd Font", "Red Hat Mono", system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
```

## Finding the Correct Font Name

Your operating system or application may list the font slightly differently. To verify the exact name:

- **Windows:** Open Settings > Fonts, or use the Windows Font Viewer
- **macOS:** Open Font Book and check the font name listed
- **Linux:** Run `fc-list | grep RedHatMono` to list installed fonts

Use the exact name shown in your system.

## About the Fonts

### Red Hat Mono
The base typeface, an open-source monospace font by Red Hat.

- **Source:** [github.com/RedHatOfficial/RedHatMono](https://github.com/RedHatOfficial/RedHatFont)
- **License:** [SIL Open Font License 1.1](https://opensource.org/licenses/OFL-1.1)

### Nerd Fonts Patcher
Applied to add extensive glyph support for developer tools, shells, and terminal applications.

- **Source:** [nerdfonts.com](https://www.nerdfonts.com/)
- **Project:** [github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- **License:** [MIT](https://opensource.org/licenses/MIT)

### These Modified Fonts
The patched variants provided here combine both projects under the [SIL Open Font License 1.1](https://opensource.org/licenses/OFL-1.1).

**Important:** Do not rename these patched fonts back to `Red Hat Mono`. The modified versions must remain distinguishable from the upstream originals. Use the `RedHatMono Nerd Font` family name as provided.

## Repository Contents

```
.
├── README.md                 # This file
├── LICENSE                   # Licensing information
├── OFL.txt                   # SIL Open Font License 1.1
├── patch-fonts.sh            # Build script reference for future rebuilds
├── fonts/
│   ├── ttf/
│   │   ├── mono/            # TTF Mono variants
│   │   └── regular/         # TTF regular variants
│   └── otf/
│       ├── mono/            # OTF Mono variants
│       └── regular/         # OTF regular variants
```

## Licensing

**SIL Open Font License 1.1**

These fonts are derived from [Red Hat Mono](https://github.com/RedHatOfficial/RedHatFont) (OFL 1.1) and patched using the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) patcher (MIT). The resulting fonts are distributed under the SIL Open Font License 1.1.

See the included `LICENSE` and `OFL.txt` files for complete details.

## Project Status

This repository is a distribution archive for pre-generated font files. You don't need to patch anything yourself—just download and install.

The `patch-fonts.sh` script is included as a supplemental reference for future rebuilds, should you need it.

This repository is not:
- A builder or compiler (ready-made fonts are provided)
- A development toolkit
- An official Red Hat or Nerd Fonts publication
- A support channel for either upstream project

For issues with the original fonts, please refer to:
- **Red Hat Mono:** [github.com/RedHatOfficial/RedHatMono/issues](https://github.com/RedHatOfficial/RedHatFont/issues)
- **Nerd Fonts:** [github.com/ryanoasis/nerd-fonts/issues](https://github.com/ryanoasis/nerd-fonts/issues)