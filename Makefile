# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# $(O) is meant as a shortcut for $(SPHINXOPTS).
html: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)



# TODO: create targets for
# cd source
# sphinx-build -b gettext . _build/gettext # regenerate *.pot files
# sphinx-intl update -p _build/gettext -l ru # regenerate *.po files
# Edit *.po files (translate and remove 'fuzzy' markers) then commit *.po files


syncpackages: clonepackages installpackages

clonepackages:
	rm -rf guzzle_sphinx_theme
	git clone --depth 1 --branch master git@xgit.tradingview.com:tv/guzzle_sphinx_theme.git

installpackages:
	pip install --user -r requirements.txt

install_hooks:
	cp -r ./git-hooks/. ./.git/hooks
