BUNDLE = bundle
INSTALL_CMD = install
LINTER = rubocop

install:
	$(BUNDLE) $(INSTALL_CMD)
lint:
	LINTER
test:
	rake test