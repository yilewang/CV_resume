%% resume.cls -- Helvetica CV / resume class, derived from the original Word CV.
%% Compile with XeLaTeX (latexmk picks it up from .latexmkrc).
%% Uses macOS Helvetica when present, otherwise TeX Gyre Heros (a Helvetica clone).
%%
%% Class options:
%%   cv       academic CV (default)
%%   resume   industry resume
%% Content shared by both lives in sections/*.tex; use \cvonly{...} and
%% \resumeonly{...} there for variant-specific material.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/09/30 Helvetica CV and resume class]

\newif\ifresume \resumefalse
\DeclareOption{resume}{\resumetrue}
\DeclareOption{cv}{\resumefalse}
\ProcessOptions\relax

\LoadClass{article}

%% ---------------------------------------------------------------- page
\RequirePackage[a4paper, hmargin=0.4in, top=0.45in, bottom=0.45in,
  nohead, nofoot]{geometry}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage[normalem]{ulem}
\RequirePackage{needspace}
\RequirePackage[hidelinks]{hyperref}

\IfFontExistsTF{Helvetica}
  {\setmainfont{Helvetica}[BoldFont=Helvetica Bold, ItalicFont=Helvetica Oblique,
     BoldItalicFont=Helvetica Bold Oblique]}
  {\setmainfont{TeX Gyre Heros}}

\definecolor{linkblue}{HTML}{467886}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\renewcommand{\normalsize}{\fontsize{9}{10.8}\selectfont}
\normalsize
\hyphenpenalty=10000          % no hyphenation, as in the original
\frenchspacing
\emergencystretch=2em
\ULdepth=1.6pt
\raggedbottom
\widowpenalty=10000 \clubpenalty=10000   % never split a bullet's single line across pages

%% ------------------------------------------------------------- variants
\newcommand{\cvonly}[1]{\ifresume\else#1\fi}
\newcommand{\resumeonly}[1]{\ifresume#1\fi}

%% --------------------------------------------------------------- links
%% \link{url}{text}: blue underlined hyperlink; \ul{text}: plain underline
\newcommand{\link}[2]{\href{#1}{\textcolor{linkblue}{\uline{#2}}}}
\newcommand{\ul}[1]{\uline{#1}}

%% -------------------------------------------------------------- header
%% \header{Name}{contact line}
\newcommand{\header}[2]{%
  \begin{center}
    {\fontsize{16}{18}\selectfont\bfseries #1\par}
    \vspace{1.5pt}
    #2\par
  \end{center}\vspace{-12pt}}
\newcommand{\sep}{\ |\ }

%% ------------------------------------------------------------- section
\newcommand{\cvsection}[1]{%
  \par\addvspace{9pt}\Needspace{6\baselineskip}% keep heading with its content
  {\fontsize{10}{10.8}\selectfont\bfseries\MakeUppercase{#1}}\par
  \dimen@=\prevdepth\nointerlineskip\vskip\dimexpr 2.8pt-\dimen@\relax
  \hbox{\rule{\linewidth}{0.6pt}}%
  \vskip 0.4pt \prevdepth=0pt}

%% Space between entries within a section
\newcommand{\entrygap}{\par\addvspace{5pt}}

%% --------------------------------------------------------------- lines
%% \leftright{left}{right}: right part flush with the text edge
\newcommand{\leftright}[2]{\par\noindent #1\hfill #2\par\nopagebreak}
\newcommand{\indented}[1]{\hspace*{10pt}#1}

%% \subentry{title}: italic heading inside an entry (e.g. one research project)
\newcommand{\subentry}[1]{\par\addvspace{2pt}\Needspace{3\baselineskip}\textit{#1}\par\nopagebreak}

%% --------------------------------------------------------------- lists
\setlist[itemize]{label=\textbullet, leftmargin=9pt, labelindent=0pt, labelsep=*,
  align=left, itemsep=0.5pt, parsep=0pt, topsep=0pt, partopsep=0pt}

%% Publications: bold own name, italic venue, status note
\newcommand{\me}[1]{\textbf{#1}}
\newcommand{\venue}[1]{\textit{#1}}
\newcommand{\status}[1]{[#1]}

\endinput
