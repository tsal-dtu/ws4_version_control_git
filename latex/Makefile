MAINFILE=version_control_git
PS2PDF=ps2pdf
DVI2PS=dvips

all: clean pdf

%.dvi : %.tex
	# Makefile is needed to be Makefile.txt, otherwise latex document
	# cant build
	cp Makefile Makefile.advanced
	latex $<
	bibtex $(*F).aux
	# run latex again to get references right
	latex $<

clean:
	-rm Makefile.advanced
	-rm -f *.bbl *.aux *.log *.blg *.dvi *.ps  *.tex~ *.out
	-rm -f $(MAINFILE).pdf

pdf: $(MAINFILE).pdf

dvi: $(MAINFILE).dvi

%.pdf : %.ps
	$(PS2PDF) $< 

%.ps : %.dvi
	$(DVI2PS) $< -o $@