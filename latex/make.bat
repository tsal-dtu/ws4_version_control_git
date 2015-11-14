@ECHO off
setlocal
set MAINFILE=reproducibility
if -%1-==-- goto all

REM parse arguments
:argactionstart
if -%1-==-- goto argactionend
call :%1
shift
goto argactionstart
:argactionend

goto :eof

:latex
copy Makefile Makefile.advanced
latex %MAINFILE%
bibtex %MAINFILE%
REM run latex again to get references right
latex  %MAINFILE%
goto :eof

:all
call :clean
call :pdf
goto :eof

:clean
del /Q /F *.bbl *.aux *.log *.blg *.dvi *.ps  *.tex~ *.out
del /Q /F Makefile.advanced
del /Q /F %MAINFILE%.pdf
goto :eof

:ps
call :latex
dvips %MAINFILE%.dvi
goto :eof

:pdf
call :ps
ps2pdf %MAINFILE%.ps
goto :eof
