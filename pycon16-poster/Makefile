PYGMENTIZE=~/pygments-upstream/pygmentize

%-mt.html: %.mt
	nix-shell -p pythonPackages.pillow --run '$(PYGMENTIZE) -l monte -f html $< > $@'

%-py.html: %.py
	nix-shell -p pythonPackages.pillow --run '$(PYGMENTIZE) -l py -f html $< > $@'

%.html: %-mt.html %-py.html header.html middle.html footer.html
	cat header.html $*-py.html middle.html $*-mt.html footer.html > $@

%.png: %.html
	nix-shell -p fira-mono -p inconsolata -p wkhtmltopdf --run 'wkhtmltoimage $< $@'
