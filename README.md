# Thesis Template UMM

[<img alt="Build status" src="https://img.shields.io/github/actions/workflow/status/rwarnking/thesis-template-umm/compile.yml?branch=main&label=Build&logo=github&style=for-the-badge" height="23">](https://github.com/rwarnking/evaluation-sheet-template/actions/workflows/compile.yml)
[<img alt="Linting status of master" src="https://img.shields.io/github/actions/workflow/status/rwarnking/thesis-template-umm/linter.yml?branch=main&label=Linter&style=for-the-badge" height="23">](https://github.com/marketplace/actions/super-linter)
[<img alt="Version" src="https://img.shields.io/github/v/release/rwarnking/thesis-template-umm?style=for-the-badge" height="23">](https://github.com/rwarnking/thesis-template-umm/releases/latest)
[<img alt="Licence" src="https://img.shields.io/github/license/rwarnking/thesis-template-umm?style=for-the-badge" height="23">](https://github.com/rwarnking/thesis-template-umm/blob/main/LICENSE)

## Description
This is a template for creating a thesis using LaTeX for the UMM.
It is based on the free avaibable WORD document found on the [Homepage}(https://www.umm.uni-heidelberg.de/fakultaet/promotion/promotion-dr-sc-hum/) of the UMM.

## Table of Contents
- [Thesis Template UMM](#thesis-template-umm)
  - [Table of Contents](#table-of-contents)
  - [List of Features](#list-of-features)
  - [Installation](#installation)
    - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [Credits](#credits)
  - [License](#license)

## List of Features

- Custom titlepage
- Modified table of contents
- Modified page layout
- Acronyms, Bibliography and Appendix
- Preset for CV and Acknowledgement

## Installation

Download this repository or install directly from GitHub
```bash
pip install git+https://github.com/rwarnking/thesis-template-umm.git
```

### Dependencies

This project uses a number of LaTeX packages which are listed here.

These packages are needed:
* [xkeyval](https://ctan.org/pkg/xkeyval) for class parameter
* [ifthen](https://ctan.org/pkg/ifthen) for language switch
* [mathptmx](https://ctan.org/pkg/mathptmx) for times new roman
* [helvet](https://ctan.org/pkg/helvet) for arial
* [biblatex](https://ctan.org/pkg/biblatex) for bibliographie
* [csquotes](https://ctan.org/pkg/csquotes) for bibliographie
* [glossaries](https://ctan.org/pkg/glossaries) for glossaries
* [makecell](https://ctan.org/pkg/makecell) for multiline table cells
* [tabularx](https://ctan.org/pkg/tabularx) for fancy tables

These packages are also needed but should usually be installed by default:
* [babel](https://ctan.org/pkg/babel) for language
* [fontenc](https://ctan.org/pkg/fontenc) for german language
* [inputenc](https://ctan.org/pkg/inputenc)
* [hyperref](https://ctan.org/pkg/helvet) for links
* [appendix](https://ctan.org/pkg/appendix) for appendix
* [fancyhdr](https://ctan.org/pkg/fancyhdr) for fancy page headers

## Usage

This template allows the user to focus on writing texts by providing a chapter folder in which,
new chapter can be added or present ones can be modified. When adding a new chapter-file it 
is only necessary to add it in the `main.tex`.
The project itself is responsible for the layouting (`thesis.cls | setup.tex`) and also
provides commands and presets (e.g. titlepage).

## Contributing

I encourage you to contribute to this project, in form of bug reports, feature requests
or code additions.

Please check out the [contribution](docs/CONTRIBUTING.md) guide for guidelines about how to proceed
as well as a styleguide.

## Credits
This project is a joined effort of various employees of the UMM.

## License
This project is licensed under the [MIT License](LICENSE).