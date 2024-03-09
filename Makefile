BUNDLE = bundle
INSTALL_CMD = install
LINTER = rubocop

install:
	gem $(INSTALL_CMD) $(BUNDLE)
	$(BUNDLE) $(INSTALL_CMD)
lint:
	LINTER
