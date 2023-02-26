% Options:
% Languages: [german] or [english]
% For bibstyle selection: [bibstyle=numeric] or similar
% For class selection: [doctype=report] or similar
% Font: [arial] or [roman]
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
\newcounter{doc_lang}
\DeclareOption{german}{
    \setcounter{doc_lang}{1}
}
\DeclareOption{english}{
    \setcounter{doc_lang}{2}
}

\newcounter{font}
\DeclareOption{roman}{
    \setcounter{font}{1}
}
\DeclareOption{arial}{
    \setcounter{font}{2}
}

\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\ifthenelse{\value{doc_lang} = 1}{
    \RequirePackage[ngerman]{babel}
    \RequirePackage[T1]{fontenc}
}{
    \RequirePackage[english]{babel}
}

% ----------------------------------------
% Select the font
% ----------------------------------------
% For times new roman
% TODO might be obsolete
% https://ctan.org/pkg/mathptmx
\ifthenelse{\value{font} = 1}{
    \RequirePackage{mathptmx}
}{}
% For arial
\ifthenelse{\value{font} = 2}{
    \renewcommand*{\familydefault}{\sfdefault}
    \usepackage[scaled]{helvet}
}{}

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
\ifthenelse{\value{doc_lang} = 1}{
    % https://tex.stackexchange.com/questions/154554/renaming-acronyms-glossaries-package
    \renewcommand*{\acronymname}{Abkürzungsverzeichnis}
}{}

% For appendix
\RequirePackage[page, toc]{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fancy header and footer
\RequirePackage{fancyhdr}
% Shift page number to the right of the header
\setlength{\headheight}{15pt}
% \renewcommand{\secitonmark}[1]{\markboth{#1}{}}
\lhead{\leftmark} \chead{} \rhead{}
% Add title to the footer
\cfoot{} \rfoot[\leftmark]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
% \renewcommand{\footrulewidth}{0.4pt}

% Allows to have multiline table cells
\RequirePackage{makecell}
% Allows to stretch table to textwidth
\RequirePackage{tabularx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Meta information commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\institute#1{\gdef\@institute{#1}}
\def\clinic#1{\gdef\@clinic{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\director#1{\gdef\@director{#1}}

\def\thesisType#1{\gdef\@thesisType{#1}}
\def\thesisSumbit#1{\gdef\@thesisSumbit{#1}}

\def\birthplace#1{\gdef\@birthplace{#1}}

\def\theSpeaker#1{\gdef\@theSpeaker{#1}}
\def\deanOfInstitution#1{\gdef\@deanOfInstitution{#1}}

% Language dependend default values
\ifthenelse{\value{doc_lang} = 1}{
    \clinic{..............................klinik}
    \institute{Institut für ................}
    \faculty{Medizinischen Fakultät Mannheim}
    \director{\prof{} Dr.\ med.\ ........}
    
    \title{Über die Problematik, eine Dissertationsschrift abzufassen,\\ ohne formal Fehler zu begehen.}
    \thesisType{%
        Inauguraldissertation\\ 
        zur Erlangung des medizinischen Doktorgrades
        \footnote{Bei Dissertationen zum \drschum{}: zur Erlangung des Doctor scientiarum humanarum (\drschum{})}\\
        der\\
        Medizinischen Fakultät Mannheim\\
        der Ruprecht-Karls-Universität\\
        zu\\
        Heidelberg%
    }
    \thesisSumbit{[22. Februar 2022]}
    
    \author{[Vor- und Nachname]}
    \birthplace{[Geburtsort]}
    
    \theSpeaker{(Frau) \prof{}/ \privdoz{}\drmed{} ..................}
    \deanOfInstitution{(Frau) \prof{}\drmed{} .......}
}{
    % English default values
    \clinic{..............................clinic}
    \institute{Institute for ................}
    \faculty{Medical Faculty Mannheim}
    \director{\prof ........ \mdoc{}}
    
    \title{Regarding the Problems,\\ of drafting a dissertation without formal mistakes.}
    \thesisType{%
        Inaugural dissertation\\ 
        for the attaintment of a medical doctordegree
        \footnote{Used for dissertations to attaint the Doctor scientiarum humanarum (\drschum{})}\\
        of the\\
        Medical Faculty Mannheim\\
        at the Ruprecht-Karls-Universität\\
        of\\
        Heidelberg%
    }
    \thesisSumbit{[22 February 2022]}
    
    \author{[Sur- and Lastname]}
    \birthplace{[Birthplace]}
    
    \theSpeaker{(Mrs.) \prof{}/ \privlec{}..................\mdoc{}}
    \deanOfInstitution{(Mrs.) \prof{}.......\mdoc{}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create style commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add empty pages such that capter start on the same page
% Removes header and footer from empty pages
\def\cleardoublepage{
    \clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

% Adjust page numbering
% \newcommand{\enableTextChapters}{
%   \pagestyle{fancy}
%   \pagenumbering{arabic}
% }