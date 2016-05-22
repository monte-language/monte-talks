PYGMENTIZE=~/pygments-upstream/pygmentize

%.html: %.mt
	nix-shell -p pythonPackages.pillow --run '$(PYGMENTIZE) -l monte -f html -O full -o $@ $<'
