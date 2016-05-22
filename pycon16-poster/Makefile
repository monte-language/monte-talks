PYGMENTIZE=~/pygments-upstream/pygmentize

%.html: %.mt
	$(PYGMENTIZE) -l monte -f html -O full,style=colorful -o $@ $<
