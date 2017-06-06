%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------LaTeX-DOCUMENT-CLASS------------% 
%------------------------------------------%
%--------for-preparing-articles-to-the-----%
%------------------------------------------%
%---------INTERNATIONAL-JOURNAL-OF---------%
%-APPLIED-MATHEMATICS-AND-COMPUTER-SCIENCE-% 
%------------------------------------------%
%----------A------MM---MM----CCCC----SSSS--%
%--------A-A-----M-M-M-M---C----C--S-------%
%------AAAAA----M--M--M---C--- ----SSSS----%
%----A-----A---M-----M---C----C-------S----%
%--A-------A--M-----M----CCCC----SSSS------%
%------------------------------------------%
%------------------------------------------%
%------Zielona Gora,-30-November-2010------%
%------------------------------------------%
%-----------(c)-Krzysztof-Patan------------%
%------e-mail:-k.patan@issi.uz.zgora.pl----%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\typeout{Document Style `amcs' <2010>.}

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{amcs}[2010/11/30]
\LoadClass[twoside,twocolumn,a4paper]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New option editorial added 14.12.2009
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{editorial}{\@twocolumnfalse}
\ProcessOptions

\RequirePackage{times}
\RequirePackage{amsmath,amssymb}
\RequirePackage[hang]{caption2}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This definition is needed due to problems with the
%% hyperref package and its compatibility with harvard
%% in the newest versions of MiKTeX (4.11.2010)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\IfFileExists{ltxcmds.sty}{\RequirePackage{ltxcmds}}{}
\long\def\ltx@LocalAppendToMacro#1#2{%
\global\let\LTXcmds@gtemp#1%
\ifx\ltx@undefined\LTXcmds@gtemp
\global\let\LTXcmds@gtemp\ltx@empty
\else
\ifx\relax\LTXcmds@gtemp
\global\letLTXcmds@gtemp\ltx@empty
\fi
\fi
\begingroup
\toks0\expandafter{\LTXcmds@gtemp#2}%
\xdef\LTXcmds@gtemp{\the\toks0}%
\endgroup
\let#1\LTXcmds@gtemp
}
\RequirePackage[dcucite,abbr]{harvard}
\RequirePackage{url}
%%%%%%%%%%%%%%%%%%%%%%%%% Page layout %%%%%%%%%%%%%%%%%%%%%%%%
%% Last change 26.03.2010 
\marginparsep=.1cm
\setlength{\textheight}{23.2cm}
\setlength{\textwidth}{17cm}
\addtolength{\oddsidemargin}{-0.cm} 
\addtolength{\evensidemargin}{-1cm}
\setlength{\headsep}{4mm}
\addtolength{\topmargin}{-.2cm}
\columnsep 8mm
\linespread{1}
\setlength{\parindent}{7mm}

%%%%%%%%%%%%%%%%%%%%%%% Editorial variables %%%%%%%%%%%%%%%%%%%%  
\newcommand{\Year}[1]{\gdef\@Year{#1}}
\newcommand{\Vol}[1]{\gdef\@Vol{#1}}
\newcommand{\No}[1]{\gdef\@No{#1}}
\newcommand{\Startpage}[1]{\gdef\@Startpage{#1}}
\newcommand{\Endpage}[1]{\gdef\@Endpage{#1}}
\newcommand{\Runauthors}[1]{\gdef\@Runauthors{#1}}
\newcommand{\Received}[1]{\gdef\@Received{#1}}
\newcommand{\Revised}[1]{\gdef\@Revised{#1}}
\newcommand{\Rerevised}[1]{\gdef\@Rerevised{#1}}
\newcommand{\DOI}[1]{\gdef\@DOI{#1}}

\let\@Year\@empty
\let\@Vol\@empty
\let\@No\@empty
\let\@Startpage\@empty
\let\@Endpage\@empty
\let\@Runauthors\@empty
\let\@Received\@empty
\let\@Revised\@empty
\let\@Rerevised\@empty
\let\@DOI\@empty

%%%%%%%%%%%%%%%%%%%%%%%% Title page %%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\title}[2][]{
 \def\@temp{#1}
 \gdef\@title{#2}
 \ifx\@temp\@empty 
   \gdef\head@title{#2}
 \else
   \gdef\head@title{#1}
 \fi 
}

\gdef\@znak#1{\ifcase#1 \or *\or {**}\or {***}\or
   {****} \or \dag \or \ddag\fi}

\let\@authora\@empty\let\@authorb\@empty
\let\@authorc\@empty\let\@authord\@empty
\let\@authore\@empty\let\@authorf\@empty

\let\@markaa\@empty\let\@markba\@empty\let\@markca\@empty
\let\@markda\@empty\let\@markea\@empty\let\@markfa\@empty

\let\@markab\@empty\let\@markbb\@empty\let\@markcb\@empty
\let\@markdb\@empty\let\@markeb\@empty\let\@markfb\@empty

\gdef\@autor#1#2{\ifcase#1\or\gdef\@authora{#2}\or\gdef\@authorb{#2}\or\gdef\@authorc{#2}
   \or\gdef\@authord{#2}\or\gdef\@authore{#2}\or\gdef\@authorf{#2}\fi} 

\gdef\@autoradra#1#2{\ifcase#1\or\gdef\@markaa{#2}\or\gdef\@markba{#2}\or\gdef\@markca{#2}
   \or\gdef\@markda{#2}\or\gdef\@markea{#2}\or\gdef\@markfa{#2}\fi} 

\gdef\@autoradrb#1#2{\ifcase#1\or\gdef\@markab{#2}\or\gdef\@markbb{#2}\or\gdef\@markcb{#2}
   \or\gdef\@markdb{#2}\or\gdef\@markeb{#2}\or\gdef\@markfb{#2}\fi} 

\newcounter{author}
\def\author[#1][#2]#3{
 \stepcounter{author}
 \@autor{\theauthor}{#3}
 \def\@temp{#1}
 \ifx\@temp\@empty
   \errmessage{\@temp: Institution not defined}
 \else
   \@autoradra{\theauthor}{#1}  
   \@autoradrb{\theauthor}{#2}	     
 \fi
 }

\let\@adr\@empty 
\let\@adra\@empty\let\@adrb\@empty\let\@adrc\@empty
\let\@adrd\@empty\let\@adre\@empty\let\@adrf\@empty

\let\@markad\@empty\let\@markbd\@empty\let\@markcd\@empty
\let\@markdd\@empty\let\@marked\@empty\let\@markfd\@empty

\gdef\@adres#1#2#3{\ifcase#1\or\gdef\@adra{#2}\gdef\@markad{#3}\or\gdef\@adrb{#2}\gdef\@markbd{#3}\or\gdef\@adrc{#2}\gdef\@markcd{#3}\or\gdef\@adrd{#2}\gdef\@markdd{#3}\or\gdef\@adre{#2}\gdef\@marked{#3}\or\gdef\@adrf{#2}\gdef\@markfd{#3}\fi} 

\gdef\@sprawdza#1{\ifcase#1\or\@markaa\or\@markba\or\@markca\or\@markda\or\@markea\or\@markfa\fi} 
\gdef\@sprawdzb#1{\ifcase#1\or\@markab\or\@markbb\or\@markcb\or\@markdb\or\@markeb\or\@markfb\fi} 
\gdef\@sprawdzautor#1{\ifcase#1\or\@authora\or\@authorb\or\@authorc\or\@authord\or\@authore\or\@authorf\fi} 
\gdef\@sprawdzadres#1{\ifcase#1\or\@markad\or\@markbd\or\@markcd\or\@markdd\or\@marked\or\@markfd\fi} 
\gdef\@sprawdzc#1{\ifcase#1\or\@adra\or\@adrb\or\@adrc\or\@adrd\or\@adre\or\@adrf\fi} 

\newcounter{address}
\newcommand{\address}[2][]{
 \stepcounter{address}
 \edef\@temp{#1}
 \ifx \@temp\@empty 
 \else
  \@adres{\theaddress}{#2}{#1}
  \count0=1\relax
  \loop
    \ifnum \theaddress>\count0
      \edef\@tempa{\@sprawdzadres{\the\count0}}
      \ifx \@temp\@tempa \errmessage{\@temp: Multiple definition} \fi
    \fi
  \advance\count0by1
  \ifnum \count0<\theaddress\repeat
 \fi 
}

\def\test@autor{\count0=6\relax 
  \loop 
   \edef\@temp{\@sprawdza{\the\count0}}
   \ifx\@temp\@markad \else 
    \ifx\@temp\@markbd \else
     \ifx\@temp\@markcd \else
      \ifx\@temp\@markdd \else
       \ifx\@temp\@marked \else
        \ifx\@temp\@markfd \else
	 \@autoradra{\the\count0}{\@empty}
	 \errmessage{\@temp: Institution not defined}
   \fi\fi\fi\fi\fi\fi
   \advance\count0by-1
  \ifnum \count0>0  \repeat
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New definitions of formatting authors and
%% addresses in the frontmatter (26.03.2010) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
\def\@format@autor{
   \count2=\theauthor \advance\count2by1
   \count0=1\relax
   \loop
    \edef\@tempa{\@sprawdzautor{\the\count0}}\relax
    \edef\@tempb{\@sprawdza{\the\count0}}\relax
    \edef\@tempbdwa{\@sprawdzb{\the\count0}}\relax
    \ifx \@tempb\@empty 
      \mbox{\@tempa}
    \else
      {\count1=1\relax\loop
         \edef\@tempc{\@sprawdzadres{\the\count1}}\relax
         \ifx\@tempc\@tempb 
	  \ifnum\theauthor=1 \mbox{\@tempa}
	  \else
            \ifnum\theaddress=1 
	      \ifnum\theauthor=\the\count0 
	      \mbox{\@tempa}
	      \else \mbox{\@tempa,}
              \fi
	    \else
	      \ifx \@tempbdwa\@empty 
	      \ifnum\theauthor=\the\count0 
	      \mbox{\@tempa\,$^\@znak{\the\count1}$}
	      \else \mbox{\@tempa\,$^\@znak{\the\count1}$,}
              \fi
	      \else
	        {\count2=1\relax\loop
	          \edef\@tempcdwa{\@sprawdzadres{\the\count2}}\relax
		  \ifx\@tempcdwa\@tempbdwa
	            \ifnum\theauthor=\the\count0 
	            \mbox{\@tempa\,$^\@znak{\the\count1}$$^{,\@znak{\the\count2}}$}
	            \else \mbox{\@tempa\,$^\@znak{\the\count1}$$^{,\@znak{\the\count2}}$,}
                    \fi
		  \fi  
	        \advance\count2by1\ifnum\count2<7\repeat}
	      \fi
	    \fi
	  \fi
         \fi
       \advance\count1by1\ifnum\count1<7\repeat}
    \fi 
     \advance\count0by1
  \ifnum\count0<\count2\repeat
}

\def\@format@adres{
 \ifx\@adra\@empty\relax
 \else
   \ifnum \theauthor=1 \@adra
   \else 
     \ifnum\theaddress=1 \@adra
     \else
       $^*$\,\@adra
     \fi  
   \fi
 \fi  
 \count1=2\relax\loop
   \edef\@tempa{\@sprawdzadres{\the\count1}}\relax
    \def\@tempb{\@sprawdzc{\the\count1}}\relax
    \ifx\@tempa\@empty\relax    
    \else
       {\count2=1\relax\loop
        \edef\@tempc{\@sprawdza{\the\count2}}\relax
        \edef\@tempd{\@sprawdzb{\the\count2}}\relax
        \ifx\@tempa\@tempc
           \vskip10pt
           \ifnum \theauthor=1 \@tempb
           \else $^\@znak{\the\count1}$\@tempb
           \fi
           \count2=6  
        \else
           \ifx\@tempa\@tempd
             \vskip10pt
             \ifnum \theauthor=1 \@tempb
             \else $^\@znak{\the\count1}$\@tempb
             \fi
             \count2=6
           \else
              \relax
           \fi 
         \fi
       \advance\count2by1\ifnum\count2<7\repeat} 
    \fi
  \advance\count1by1\ifnum\count1<7\repeat
}

\newbox\abstractbox
\def\abstract{\global\setbox\abstractbox=\hbox\bgroup
  \small \begin{minipage}{155mm}}
\def\endabstract{\end{minipage}\egroup}

\newbox\keywordbox
\def\keywords{\global\setbox\keywordbox=\hbox\bgroup
   \small \begin{minipage}[t]{155mm}{\bf Keywords:}}
\def\endkeywords{\end{minipage}\egroup}

%%%%%%%%%%%%%%%%%%%%%%%% Headers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@titlepage

\def\ps@plain{
 \let\@mkboth\markboth
 \def\@oddhead{}
 \def\@evenhead{}
 \def\@oddfoot{}
 \def\@evenfoot{}
}

\def\ps@amcs{
 \let\@mkboth\markboth
 \let\@oddfoot\@empty
 \let\@evenfoot\@empty
 \def\@oddhead{\vtop{\vskip-5.8em
   \includegraphics[width=18.4cm]{logop}\vskip-2.1em
   \hb@xt@\textwidth{
   \hspace{-0.7mm}\mbox{\raisebox{.5mm}{\sl \head@title}}\hfil
   \parbox{9mm}{\vskip5pt \centering \textcolor{white}{\bf \thepage}}\parbox{2mm}{~}}}}
 \def\@evenhead{\vtop{\vskip-5.8em
   \hspace{-1.4cm}\includegraphics[width=18.4cm]{logol}\vskip-2.1em
   \hb@xt@\textwidth{
    \hspace{0.5mm}\parbox{9mm}{\vskip5pt \centering \textcolor{white}{\bf \thepage}}
   \hfil{\sl \@Runauthors}\hspace{0.5mm}}}}
}
\if@twocolumn
\pagestyle{amcs}
\else
\pagestyle{empty} 
\fi
%%%%%%%%%%%%%%%%%%%%%%%% Maketitle %%%%%%%%%%%%%%%%%%%%%%%
\def\@maketitle{\newpage
      \if@twocolumn
      \vskip4.5mm\vskip-8.3em
      \includegraphics[width=18.4cm]{logop}
      \vskip-3.7em
      {\sl Int. J. Appl. Math. Comput. Sci., \@Year, Vol. \@Vol, No. \@No, \@Startpage--\@Endpage}
      \ifx\@Startpage\@empty\setcounter{page}{1}\else\setcounter{page}{\@Startpage}\fi\newline
      {DOI:~\@DOI}
      \vskip2.2em
      \begin{center}
      \begin{minipage}{155mm}
        \centering
        \vskip42pt
        \let\footnote\thanks
	\let\author\relax
	\test@autor
	{\large \bfseries \MakeUppercase{\@title} \par}
	\vskip20pt
	{\sc\@format@autor}
	\vskip20pt
	{\small \@format@adres}
	\vskip30pt
	\usebox{\abstractbox}
	\vskip20pt
	\usebox{\keywordbox}
      \end{minipage}	
      \end{center}\par\vskip35pt
      \else\relax
      \fi 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sections %%%%%%%%%%%%%%%%%%%%%%%%%%
\if@twocolumn
 \def\section{\@startsection{section}{1}{\z@}{-3.1ex plus -1ex minus 
 -.2ex}{1.3ex plus .2ex}{\large\bf}}
 \renewcommand\@seccntformat[1]{\csname the#1\endcsname. \hspace{0.5em}}
\else
  \newcommand\additem[2]{%
    \def\@temp{#2} 
    \addpenalty\@secpenalty    
    \ifx\@temp\@empty
      \addvspace{2.25em \@plus\p@}%
      \setlength\@tempdima{2em}%
    \else
      \addvspace{1.0em \@plus\p@}%
      \setlength\@tempdima{3.6em}%
    \fi
    \setlength\@tempdimb{1.8em}%
    \begingroup
      \parindent \z@ 
      \rightskip 2.5em
      \parfillskip -2.5em
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\@tempdimb
      \ifx\@temp\@empty 
        #1\nobreak\hfill\nobreak\par
      \else
        #1\nobreak\dotfill~~~\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \fi
    \endgroup
   }
\fi
 
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {-1em}%
                                     {\normalfont\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {-1em}%
                                     {\normalfont\bfseries}}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8 \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8.}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
  
%%%%%%%%%%%%%%%%%%%%% Figures and tables %%%%%%%%%%%%%%%%%%%%%%%%
\def\fnum@figure{Fig.~\thefigure}
\def\fnum@table{Table~\thetable}

\renewcommand{\captionsize}{\small}
\renewcommand{\captionlabeldelim}{.\hspace*{1mm}}

%%%%%%%%%%%%%%%%%%%%%%%%%% Bibliography %%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\refname}{References}
\renewenvironment{thebibliography}[1]
     {\small\section*{\centering \refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
      
%%%%%%%%%%%%%%%%%%%%%%%%% Final information %%%%%%%%%%%%%%%%%%%
\newlength{\dlugosc}
\def\makeinfo{\small
      \vskip10pt
      \flushright
      \ifx\@Revised\@empty
        \setbox\@tempboxa\hbox{Received: \@Received}
	\setlength\dlugosc{\wd\@tempboxa}
	\parbox{\dlugosc}{
	Received: \@Received}
      \else
       \ifx\@Rerevised\@empty
         \setbox\@tempboxa\hbox{Received: \@Received}
	 \setlength\dlugosc{\wd\@tempboxa}
	 \setbox\@tempboxa\hbox{Revised: \@Revised}
	 \ifdim \dlugosc < \wd\@tempboxa \setlength\dlugosc{\wd\@tempboxa}\fi
	 \parbox{\dlugosc}{
	 Received: \@Received
         \vskip1pt
         Revised: \@Revised}
	\else 
         \setbox\@tempboxa\hbox{Received: \@Received}
	 \setlength\dlugosc{\wd\@tempboxa}
	 \setbox\@tempboxa\hbox{Revised: \@Revised}
	 \ifdim \dlugosc < \wd\@tempboxa  \setlength\dlugosc{\wd\@tempboxa}\fi
	 \setbox\@tempboxa\hbox{Re-revised: \@Rerevised}      
	 \ifdim \dlugosc < \wd\@tempboxa \setlength\dlugosc{\wd\@tempboxa}\fi
	 \parbox{\dlugosc}{Received: \@Received
         \vskip1pt
         Revised: \@Revised
      	 \vskip1pt
         Re-revised: \@Rerevised}
        \fi 
      \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Theorem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\partopsep\z@
\parsep\z@
\newcounter{theorem}
\def\theorem#1{
 \refstepcounter{theorem}
 \trivlist\item
 \noindent\textbf{Theorem \thetheorem .}
 \def\@temp{#1}\relax
 \ifx \@temp\@empty \else (#1)\fi 
 \it
}
\def\endtheorem{\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Proposition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{proposition}
\def\proposition#1{
 \refstepcounter{proposition}
 \trivlist\item
 \noindent\textbf{Proposition \theproposition .}
 \def\@temp{#1}\relax
 \ifx \@temp\@empty \else (#1) \fi 
 \it
}
\def\endproposition{\endtrivlist\unskip}
 
%%%%%%%%%%%%%%%%%%%%%%%%%% Lemma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{lemma}
\def\lemma#1{
 \refstepcounter{lemma}
 \trivlist\item
 \noindent\textbf{Lemma~\thelemma .}
 \def\@temp{#1}\relax
 \ifx \@temp\@empty \else (#1) \fi 
 \it
}
\def\endlemma{\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Corollary %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{corollary}
\def\corollary#1{
 \refstepcounter{corollary}
 \trivlist\item
 \noindent\textbf{Corollary \thecorollary .}
 \def\@temp{#1}\relax
 \ifx \@temp\@empty \else (#1) \fi 
 \it
}
\def\endcorollary{\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Proof %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\proof{
 \trivlist\item
 \noindent
 \textit{Proof.}
}
\def\endproof{\hspace*{\fill}\quad{\footnotesize $\blacksquare$}\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Example %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{example}
\def\example#1{
 \refstepcounter{example}
 \trivlist\item 
 \noindent
 \def\@temp{#1}\relax
 \def\@znak{putsign}\relax
 \textbf{Example \theexample .}
}
\def\endexample{
 \ifx\@temp\@znak \hspace*{\fill}\quad $\blacklozenge$ \fi
 \endtrivlist\unskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Remark %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{remark}
\def\remark{
 \refstepcounter{remark}
 \trivlist\item
 \noindent\textbf{Remark \theremark .}
}
\def\endremark{\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%% Definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{definition}
\def\definition{
 \refstepcounter{definition}
 \trivlist\item
 \noindent\textbf{Definition \thedefinition .}
}
\def\enddefinition{\endtrivlist\unskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Biography %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Added 19.03.2009
%% Changed 14.12.2009
\newdimen\@npoints
\newcount\@nbrak
\newcount\@nlines
\newcount\@tekst
\@nlines=10

\def\biography[#1]#2{
\vskip20pt
\parskip=0pt
\interlinepenalty500
\unitlength 1cm
\footnotesize
\def\@temp{#1}
\ifx\@temp\@empty 
 \noindent\textbf{#2}
\else
 \def\@tempbox{\begin{minipage}[b][3.2cm][c]{2.5cm}
  \includegraphics[height=3.2cm,width=2.5cm]{#1}
  \end{minipage}}
 \penalty\interlinepenalty
 \clubpenalty4000
 \@tekst\pagegoal
 \advance\@tekst-\pagetotal 
 \ifnum\@tekst<5966975
   \newpage
 \fi
 \hangindent2.6cm
 \hangafter-\@nlines 
 \noindent\makebox[0pt][l]{\hspace{-2.6cm}\raisebox{-3cm}[0pt][0pt]{\@tempbox}}
 \noindent\textbf{#2}	
\fi
}

\def\endbiography{
\relax\par
\@nbrak=\prevgraf
\ifnum \@nbrak < 10
 \advance\@nlines-\@nbrak
 \@npoints=\baselineskip
 \multiply\@npoints by \@nlines
 \vskip\@npoints
\fi 
}
%%%%%%%%%%%%%%%%%%%%%% Acknowledgment %%%%%%%%%%%%%%%%%%%%%%%%
%% Added 17.07.2009
\newenvironment{acknowledgment}{
  \section*{\centering Acknowledgment}
}

%%%%%%%%%%%%%%%%%%%%%% Appendix %%%%%%%%%%%%%%%%%%%%%%%%
%% Environment appendix added 17.07.2009
%% Environment appendices added 14.12.2009
\newcounter{appendix}
\renewcommand{\theappendix}{\Alph{appendix}}
\newenvironment{appendices}{
  \refstepcounter{appendix}
  \section*{\centering Appendix \theappendix}
}

\renewenvironment{appendix}{
  \section*{\centering Appendix}
}

%%%%%%%%%%%%%%%%%%%% Editioral %%%%%%%%%%%%%%%%%%
%% Added 14.12.2009
\newcommand{\editorial}[1]{
 \section*{\Large \centering \MakeUppercase{#1}}\vskip20pt
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%