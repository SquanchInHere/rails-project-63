BUNDLE = bundle
INSTALL_CMD = install

install:
	$(BUNDLE) $(INSTALL_CMD)
lint:
	rubocop
test:
	rake test