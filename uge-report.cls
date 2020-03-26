%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uge-report}

%% Main class options
\LoadClass[a4paper, onecolumn]{article} % Load default options for the class
\RequirePackage[utf8]{inputenc} % For handling special characters 
\RequirePackage{xifthen}% provides \isempty test
\RequirePackage{tikz} % For drawing
\RequirePackage{geometry} % For handling the margins
\geometry{left=2cm, right=2.47cm, top=3.8cm, bottom=0.5cm}
\RequirePackage{fontspec}
\RequirePackage{dejavu} % Tahoma not good at all...
\setsansfont{DejaVu Sans}
\setromanfont{DejaVu Serif}
\setmonofont{DejaVu Sans Mono}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif

%%This parts handles the options passed to the class.
\newcommand{\campus}{Marne-la-Vallée}
\newcommand{\adresse}{5, Boulevard Descartes $\cdot$ Champs-sur-Marne $\cdot$ 77454 Marne-La-Vallée CEDEX 2}
\DeclareOption{marne}{ % Marne campus
  \renewcommand{\campus}{Marne-la-Vallée}
  \renewcommand{\adresse}{5, Boulevard Descartes $\cdot$ Champs-sur-Marne $\cdot$ 77454 Marne-La-Vallée CEDEX 2}
}
\DeclareOption{nantes}{ % Naoned campus
  \renewcommand{\campus}{Nantes}
  \renewcommand{\adresse}{Allée des Ponts et Chaussées $\cdot$ 44344 Bouguenais Cedex}
}
\DeclareOption{twocolumn}{\OptionNotUsed} % Force the two column not to be used
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%% 

%% Colors
\RequirePackage{xcolor} % For colors
\definecolor{uge-blue}{HTML}{2F2A85}
\definecolor{uge-light-blue}{HTML}{ADB9CA}
\definecolor{uge-light-gray}{HTML}{AEAAAA}
\definecolor{uge-darker-gray}{HTML}{7F8895}

\color{uge-blue}


%% Headers and footers
\RequirePackage{fancyhdr}
% Header different for titlepage
\fancypagestyle{uge-title}{
  \setlength{\headheight}{110pt}
  \renewcommand{\headrulewidth}{0pt} % Remove the top line
  \fancyhf{} % No top header
  \rhead{} % No top header
  \lhead{\includegraphics[height=1.28cm]{img/logo-uge.png}\\
    \vspace{0.3cm}
    univ-gustave-eiffel.fr}
  \rfoot{\centering Université Gustave Eiffel $\cdot$ Campus de \campus\\ \adresse\\univ-gustave-eiffel.fr} % Footer
}
\fancypagestyle{uge}{
  \renewcommand{\headrulewidth}{0pt} % Remove the top line
  \fancyhf{} % No top header
  \rhead{} % No top header
  \lhead{} % No top header
  \rfoot{\centering \textcolor{uge-light-gray}{Université Gustave Eiffel $\cdot$ Campus de \campus\\ \adresse\\univ-gustave-eiffel.fr}} % Footer
}
\pagestyle{uge} % Set the fancy headers

\makeatletter
\def\@city{\campus}
\def\@thankstext{}

\newcommand{\checkempty}[3]{
\if\relax #1\relax #2\else #3\fi
}
\newcommand{\city}[1]{\def\@city{#1}}
\newcommand{\thankstext}[1]{\def\@thankstext{#1}}
\newcommand{\squaresep}{
\resizebox{\textwidth}{!}{%
    \begin{tikzpicture}
      \draw [color=uge-darker-gray, line width=0.1pt, fill=uge-light-blue] (0,0) rectangle (1,0.03) ;
    \end{tikzpicture}
  }%
}
%%Body of the class, most of the declarations appear here.
\renewcommand{\maketitle}{%
  \thispagestyle{uge-title}
  \parbox{\linewidth}{
    \linespread{2}\selectfont\setlength{\parskip}{0.4cm}
    À \@city, le \@date\par\par
    {\centering\bfseries RAPPORT\par\par}
    \squaresep\par
    \checkempty{\@title}{}{Titre : \@title\\}
    \checkempty{\@author}{}{Auteurs : \@author\par}
    \squaresep\par
    \checkempty{\@thankstext}{}{Remerciements : \@thankstext}
  }
  \vfill\newpage
}
\makeatother

%% Customize the sections titles
\RequirePackage{titlesec}

\titleformat{\section}[block]
  {\normalfont\huge\bfseries}
  {\thesection}
  {20pt}
  {}
\titlespacing*{\section}
              {0pt}{20pt}{20pt}

\titleformat{\subsection}[block]
  {\normalfont\Large}{\thesubsection}{20pt}{}
\titlespacing*{\subsection}
  {0pt}{14pt}{14pt}

\titleformat{\subsubsection}[block]
  {\normalfont\large}{\thesubsubsection}{20pt}{}
\titlespacing*{\subsubsection}
  {0pt}{10pt}{10pt}

\titleformat{\paragraph}[runin]
  {\normalfont\normalsize\bfseries}{}{20pt}{}
\titlespacing*{\paragraph}
  {0pt}{10pt}{10pt}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\pagenumbering{arabic}

\AtBeginDocument{\color{uge-blue}}
