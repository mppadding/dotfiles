"""
" Latex commands
"""

"" Text:

" Sections:
autocmd FileType tex inoremap ;sec    \section{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}
autocmd FileType tex inoremap ;ssec   \subsection{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}
autocmd FileType tex inoremap ;sssec  \subsubsection{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}

" Hidden Sections:
autocmd FileType tex inoremap ;hsec     \section*{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}
autocmd FileType tex inoremap ;hssec    \subsection*{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}
autocmd FileType tex inoremap ;hsssec   \subsubsection*{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}

"" References:
" Label
autocmd FileType tex inoremap ;lb       \label{}<Enter><++><C-o>k<C-o>$<C-\><C-o>F}

" Reference
autocmd FileType tex inoremap ;ref      \ref{} <++><C-\><C-o>F}

"" Figures:
autocmd FileType tex inoremap ;f        \begin{figure}[H]<Enter>\label{}<Enter>\centering<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter><Backspace>\end{figure}<Enter><++><C-o>5k<C-o>$<C-\><C-o>F}

"" Text Formatting:
" Bold
autocmd FileType tex inoremap ;fb       \textbf{} <++><C-\><C-o>F}

" Italic
autocmd FileType tex inoremap ;fi       \textit{} <++><C-\><C-o>F}

" Mono
autocmd FileType tex inoremap ;fm       \texttt{} <++><C-\><C-o>F}


"" Units:
" Volts
autocmd FileType tex inoremap ;umv      \si{\milli\volt} 
autocmd FileType tex inoremap ;uv       \si{\volt} 
autocmd FileType tex inoremap ;ukv      \si{\kilo\volt} 

" Ohms
autocmd FileType tex inoremap ;uo       \si{\ohm} 
autocmd FileType tex inoremap ;uko      \si{\kilo\ohm} 
autocmd FileType tex inoremap ;umo      \si{\mega\ohm} 

" Amperes
autocmd FileType tex inoremap ;upa      \si{\pico\ampere} 
autocmd FileType tex inoremap ;una      \si{\nano\ampere} 
autocmd FileType tex inoremap ;uua      \si{\micro\ampere} 
autocmd FileType tex inoremap ;uma      \si{\milli\ampere} 
autocmd FileType tex inoremap ;ua       \si{\ampere} 

" Hertz
autocmd FileType tex inoremap ;uh       \si{\hertz} 
autocmd FileType tex inoremap ;ukh      \si{\kilo\hertz} 
autocmd FileType tex inoremap ;umh      \si{\mega\hertz} 
autocmd FileType tex inoremap ;ugh      \si{\giga\hertz} 

" Seconds
autocmd FileType tex inoremap ;uns      \si{\nano\second} 
autocmd FileType tex inoremap ;uus      \si{\micro\second} 
autocmd FileType tex inoremap ;ums      \si{\milli\second} 
autocmd FileType tex inoremap ;us       \si{\second} 
