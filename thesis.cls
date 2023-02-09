% Options:
% Languages: [german] or [english]
% For bibstyle selection: [bibstyle=numeric] or similar
% For class selection: [doctype=report] or similar
\ProvidesClass{thesis}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load default class and biblatex style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://tex.stackexchange.com/questions/250159/
\RequirePackage{xkeyval}%
% Set default to article
\def\doctype{article}%
% Check doctype key for other class input
\define@key{thesis.cls}{doctype}[article]{%
    \def\doctype{#1}%
}

% Set default to alphabetic
\def\bibstyle{alphabetic}%
% Check bibstyle key for other style input
\define@key{thesis.cls}{bibstyle}[alphabetic]{%
    \def\bibstyle{#1}%
}

\ExecuteOptionsX{doctype, bibstyle}
\ProcessOptionsX

\LoadClass[12pt, a4paper]{\doctype}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{sprache}
\DeclareOption{german}{
    \setcounter{sprache}{1}
}
\DeclareOption{english}{
    \setcounter{sprache}{2}
}

\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\ifthenelse{\value{sprache} = 1}{
    \RequirePackage[ngerman]{babel}
    \RequirePackage[T1]{fontenc}
}{
    \RequirePackage[english]{babel}
}

\usepackage[utf8]{inputenc}

% Links
\RequirePackage{hyperref}

% ----------------------------------------
% Bibleography, appendix, ...
% ----------------------------------------
% https://de.overleaf.com/learn/latex/Biblatex_bibliography_styles
\RequirePackage[
    backend=biber,
    bibstyle=authortitle,
    citestyle=verbose,
    % style=\bibstyle,
    % bibstyle=numeric,
    % sorting=none,
]{biblatex}
% Add quote command
% https://www.namsu.de/Extra/pakete/Csquotes.html
\RequirePackage{csquotes}

% For glossary and acronyms
% https://de.overleaf.com/learn/latex/Glossaries
% https://tex.stackexchange.com/questions/383285/flush-page-number-at-right-in-glossary
% https://www.dickimaw-books.com/gallery/glossaries-styles/
% TODO acronym list is not styled
\RequirePackage[translate=babel, acronym, toc, nopostdot, style=super3colheader]{glossaries}
\ifthenelse{\value{sprache} = 1}{
    % https://tex.stackexchange.com/questions/154554/renaming-acronyms-glossaries-package
    \renewcommand*{\acronymname}{Abkürzungsverzeichnis}
}{}
% Have seperate pages for glossary and acronym list
\ifthenelse{\equal{\doctype}{article}}{
    \renewcommand*{\glsclearpage}{\clearpage}
}{}

% For appendix
\RequirePackage{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fancy header and footer
\RequirePackage{fancyhdr}
% Shift page number to the right of the header
\setlength{\headheight}{15pt}
\lhead{\leftmark} \chead{} \rhead{}
% Add title to the footer
\cfoot{} \rfoot[\leftmark]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Meta information commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\email#1{\gdef\@email{#1}}

\def\type#1{\gdef\@type{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\signcity#1{\gdef\@signcity{#1}}

\def\institute#1{\gdef\@institute{#1}}
\def\titleinfoA#1{\gdef\@titleinfoA{#1}}
\def\titleinfoB#1{\gdef\@titleinfoB{#1}}
\def\firstSupervisor#1{\gdef\@firstSupervisor{#1}}
\def\secondSupervisor#1{\gdef\@secondSupervisor{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create style commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Adjust page numbering
\newcommand{\startTextChapters}{
  \pagestyle{fancy}
  \pagenumbering{arabic}
}