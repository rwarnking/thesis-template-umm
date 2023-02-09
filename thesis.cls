\ProvidesClass{thesis}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load default
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt, a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}

\usepackage[utf8]{inputenc}

% Links
\RequirePackage{hyperref}

% For glossary and acronyms
% https://de.overleaf.com/learn/latex/Glossaries
% https://tex.stackexchange.com/questions/383285/flush-page-number-at-right-in-glossary
% https://www.dickimaw-books.com/gallery/glossaries-styles/
% TODO acronym list is not styled
\RequirePackage[translate=babel, acronym, toc, nopostdot, style=super3colheader]{glossaries}
% https://tex.stackexchange.com/questions/154554/renaming-acronyms-glossaries-package
\renewcommand*{\acronymname}{Abkürzungsverzeichnis}
% Have seperate pages for glossary and acronym list
\renewcommand*{\glsclearpage}{\clearpage}

% For appendix
\RequirePackage{appendix}

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
  \pagenumbering{arabic}
}