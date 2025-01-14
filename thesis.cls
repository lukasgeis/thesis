\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2024/07/18 Thesis Class]

\LoadClass[
    11pt,
    titlepage
]{book}

\RequirePackage[ngerman,english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[
    a4paper,
    inner=23mm,
    outer=52mm,
    bottom=4cm,
    top=3cm,
    marginparwidth=37mm,
    marginparsep=5mm
]{geometry}
\RequirePackage{xspace}

\usepackage[nocompress]{cite}

\RequirePackage{graphicx}
\RequirePackage{xcolor}
\definecolor{GoetheBlue}{cmyk}{1.00, 0.20, 0.00, 0.40}
\definecolor{DarkGray}  {cmyk}{0.00, 0.00, 0.00, 0.75}
\definecolor{LightGray} {cmyk}{0.04, 0.04, 0.05, 0.02}
\definecolor{SandGray}  {cmyk}{0.12, 0.09, 0.13, 0.00}
\definecolor{Purple}    {cmyk}{0.08, 1.00, 0.30, 0.36}
\definecolor{Red}       {cmyk}{0.04, 1.00, 0.80, 0.07}
\definecolor{DarkRed}   {cmyk}{0.00, 1.00, 1.00, 0.50}
\definecolor{Yellow}    {cmyk}{0.01, 0.25, 1.00, 0.05}
\definecolor{Green}     {cmyk}{0.62, 0.40, 0.87, 0.09}
\definecolor{Magenta}   {cmyk}{0.08, 0.86, 0.12, 0.12}
\definecolor{Orange}    {cmyk}{0.00, 0.70, 1.00, 0.04}
\definecolor{Sunny}     {cmyk}{0.00, 0.12, 0.95, 0.00}
\definecolor{LightGreen}{cmyk}{0.04, 0.17, 0.81, 0.07}
\definecolor{LightBlue} {cmyk}{0.80, 0.00, 0.06, 0.04}
\definecolor{Black}     {cmyk}{0.00, 0.00, 0.00, 1.00}
\definecolor{White}     {cmyk}{0.00, 0.00, 0.00, 0.00}


\RequirePackage[
    font={small},
    labelfont={color=GoetheBlue}
]{caption}
\RequirePackage{subcaption}
\renewcommand\thesubfigure{\roman{subfigure}}
\RequirePackage[
    explicit
]{titlesec}
\RequirePackage[
    titles 
]{tocloft}

\newcommand{\subtitle}[1]{
    \def\subtitle{#1}
}
\newcommand{\supervisor}[1]{
    \def\supervisor{#1}
}


\RequirePackage{marginnote}
\RequirePackage{sidenotes}
\RequirePackage{float}
\RequirePackage{rotating}

\RequirePackage{etoolbox}
\RequirePackage{bookmark}
\RequirePackage{xpatch}

\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{paralist}
\RequirePackage{tabularx}

\RequirePackage[
    scale=0.85
]{sourcecodepro}
\RequirePackage[
    normalem 
]{ulem}
\RequirePackage{lmodern}
\RequirePackage{microtype}

\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{thm-restate}
\RequirePackage{mdframed}
\RequirePackage{dsfont}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage{bm}

\declaretheoremstyle[
    spacebelow=\parsep,
    spaceabove=\parsep,
    headfont={\color{GoetheBlue}\scshape},
    headpunct=\textcolor{GoetheBlue}{.},
    bodyfont={\normalfont\itshape},
    headformat={{\color{GoetheBlue}$\vartriangleright\,$} \NAME\ \NUMBER\NOTE},
    postheadspace=1em
]{normal}
\declaretheoremstyle[
    spacebelow=\parsep,
    spaceabove=\parsep,
    headfont={\color{DarkRed}\scshape},
    headpunct=\textcolor{DarkRed}{.},
    bodyfont={\normalfont\itshape},
    headformat={{\color{DarkRed}$\vartriangleright\,$} \NAME\ \NUMBER\NOTE},
    postheadspace=1em
]{sketch}

\declaretheorem[style=normal, parent=chapter]{theorem}
\declaretheorem[style=normal, numbered=no, name=Theorem]{theorem*}

\declaretheorem[style=normal, numberlike=theorem]{definition}
\declaretheorem[style=normal, numberlike=theorem]{fact}
\declaretheorem[style=normal, numbered=no, name=Definition]{definition*}
\declaretheorem[style=normal, numberlike=theorem, name=Corollary]{corollary}
\declaretheorem[style=normal, numbered=no, name=Corollary]{corollary*}
\declaretheorem[style=normal, numberlike=theorem, name=Lemma]{lemma}
\declaretheorem[style=normal, numbered=no, name=Lemma]{lemma*}
\declaretheorem[style=normal, numberlike=theorem]{proposition}
\declaretheorem[style=normal, numbered=no, name=Proposition]{proposition*}
\declaretheorem[style=normal, numberlike=theorem, name=Conjecture]{conjecture}
\declaretheorem[style=normal, numbered=no, name=Conjecture]{conjecture*}
\declaretheorem[style=normal, numberlike=theorem, name=Example]{example}
\declaretheorem[style=normal, numbered=no, name=Example]{example*}
\declaretheorem[style=normal, numberlike=theorem, name=Observation]{observation}
\declaretheorem[style=normal, numberlike=theorem, name=Remark]{remark}
\declaretheorem[style=normal, numbered=no, name=Observation]{observation*}
\declaretheorem[style=normal, numbered=no, name={Open question}]{question*}

\declaretheorem[style=sketch, parent=chapter, name={Theorem (sketch)}]{theoremsketch}
\declaretheorem[style=sketch, numberlike=theorem, name={Lemma (sketch)}]{lemmasketch}
\declaretheorem[style=sketch, numberlike=theorem, name={Example (sketch)}]{examplesketch}

\RequirePackage[
    vlined,
    ruled,
    linesnumbered
]{algorithm2e}
\DontPrintSemicolon
\SetKwInput{KwInput}{Input}
\SetKwInput{KwOutput}{Output}
\SetKwFor{RepTimes}{repeat}{times}{}
\SetKwFor{Repeat}{repeat}{}{}
\SetKwFor{ForPar}{for}{do par}{}
\SetKw{Continue}{continue}
\SetKw{Break}{break}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
    citecolor = GoetheBlue,
    linkcolor = GoetheBlue,
    urlcolor = GoetheBlue
}
\RequirePackage[
    nameinlink,
    capitalise
]{cleveref}
\crefname{observation}{Obs.}{Obs.}
\Crefname{observation}{Observation}{Observations}
\crefname{equation}{Eq.}{Eqs.}
\crefname{algocf}{Alg.}{Algs.}
\Crefname{algocf}{Algorithm}{Algorithms}
\crefname{@theorem}{Theorem}{Theorems}

\RequirePackage{tikz}
\usetikzlibrary{
    graphs,
    graphs.standard,
    calc,
    positioning,
    matrix,
    decorations.pathreplacing,
    decorations.pathmorphing,
    calligraphy,
    backgrounds
}

\RequirePackage{fancyhdr}
\fancyhf{}
\def\headerFormat{\color{DarkGray}\scshape}
\def\defaultPageStyle{
	\pagestyle{fancy}
	\fancyhead[RO]{\headerFormat\nouppercase{\rightmark}}
	\fancyfoot[LE,RO]{\headerFormat\thepage}
	\fancyhead[LE]{\headerFormat\nouppercase{\leftmark}}%
}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[LE,RO]{\headerFormat\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \setlength{\headheight}{0pt}
}
\setlength{\headheight}{14.6pt}
\defaultPageStyle
\xpretocmd\headrule{\color{DarkGray}}{}{\PatchFailed}

\renewcommand{\sectionmark}[1]{\markright{#1}}
\renewcommand{\subsectionmark}[1]{}
\setcounter{secnumdepth}{3}

\newbool{inappendix}
\appto\appendix{\booltrue{inappendix}}

\titleformat{\chapter}[display]{
    \scshape
}{}{
    5pt
}{
    \vspace{-3cm}
    \begin{tikzpicture}
        \node[anchor=south east, inner sep=0] (cpt-mark) {
            \begin{minipage}{1.25\textwidth}
                \raggedleft\fontsize{120pt}{30pt}\selectfont\bfseries\color{DarkGray!60} \thechapter
            \end{minipage}
        };
        \ifbool{inappendix}{
            \node[font={\huge}, anchor=south west, at=(cpt-mark.south west), inner sep=0] (cpt-title) {
                \begin{minipage}{\textwidth}
                    #1
                \end{minipage}
            };        
        }{            
            \node (abc) at (cpt-mark.south west) {};
            \node[font={\huge}, anchor=south west, above right=1cm and 0.001cm of abc, inner sep=0] (cpt-graph) {
                \begin{tikzpicture}[opacity=0.3]
                    \graph[nodes={draw, circle, minimum size=0.1cm}, empty nodes] {
                        subgraph K_n [n=\thechapter, clockwise, radius=0.5cm]
                    };
                \end{tikzpicture}
                \hspace{0.1cm}
                \tiny\color{Black!30}$K_\thechapter$
            };
            \node[font={\huge}, right=0.5cm of cpt-graph, inner sep=0] (cpt-graph2) {
                \begin{tikzpicture}[opacity=0.3]
                    \graph[nodes={draw, circle, minimum size=0.1cm}, empty nodes] {
                        subgraph C_n [n=\thechapter, clockwise, radius=0.5cm]
                    };
                \end{tikzpicture}
                \hspace{0.1cm}
                \tiny\color{Black!30}$C_\thechapter$
            };
            \node[font={\huge}, right=0.5cm of cpt-graph2, inner sep=0] (cpt-graph3) {
                \begin{tikzpicture}[opacity=0.3]
                    \graph[nodes={draw, circle, minimum size=0.1cm}, empty nodes] {
                        subgraph P_n [n=\thechapter, clockwise, radius=0.5cm]
                    };
                \end{tikzpicture}
                \hspace{0.1cm}
                \tiny\color{Black!30}$P_\thechapter$
            };
            \node[font={\huge}, right=0.5cm of cpt-graph3, inner sep=0] (cpt-graph4) {
                \begin{tikzpicture}[opacity=0.3]
                    \graph[nodes={draw, circle, minimum size=0.1cm}, empty nodes] {
                                subgraph I_n [n=\thechapter, name=outer, clockwise, radius=0.5cm] -- 1
                        };
                \end{tikzpicture}
                \hspace{0.1cm}
                \tiny\color{Black!30}$K_{1,\thechapter}$
            };
            \node[font={\huge}, anchor=south west, at=(cpt-mark.south west), inner sep=0] (cpt-title) {
                \begin{minipage}{\textwidth}
                    #1
                \end{minipage}
            };
        }
    \end{tikzpicture}
}

\titleformat{name=\chapter, numberless}[display]{
    \scshape
}{}{
    5pt
}{
    \vspace{-3cm}
    \begin{tikzpicture}
	    \node[anchor=south east, DarkGray!60, inner sep=0] (cpt-mark) {};
		\node[font={\huge}, anchor=south west, at=(cpt-mark.south west), inner sep=0] (cpt-title) {
            \begin{minipage}{\textwidth}
                #1
            \end{minipage}};
	\end{tikzpicture}
}

\titleformat{\section}[hang]{\scshape\large}{\thesection}{5pt}{#1}
\titleformat{name=\section, numberless}[hang]{\scshape\large}{}{5pt}{#1}
\titleformat{\subsection}[hang]{\scshape\large}{\thesubsection}{5pt}{#1}
\titleformat{name=\subsection, numberless}[hang]{\scshape\large}{}{5pt}{#1}
\titleformat{\paragraph}[runin]{\scshape\color{GoetheBlue}}{}{5pt}{#1}

\renewcommand\cftchapfont{\scshape}
\renewcommand\cftsecfont{\scshape}
\renewcommand\cftsubsecfont{\scshape}

\renewcommand*{\proofname}{{\normalfont\color{GoetheBlue}\itshape Proof}}
\renewcommand*{\qedsymbol}{\color{GoetheBlue}$\square$}
\xpatchcmd{\proof}{\@addpunct{.}}{\color{GoetheBlue}\@addpunct{.}}{}{}

\begingroup\expandafter\expandafter\expandafter\endgroup
\expandafter\ifx\csname pdfsuppresswarningpagegroup\endcsname\relax
\else
  \pdfsuppresswarningpagegroup=1\relax
\fi

\hfuzz=200pt


