PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall bmkf\n\tmake uninstall\tuninstall bmkf\n"
install:
	install -Dm755 bmkf $(BIN)/bmkf
uninstall:
	rm -f $(BIN)/bmkf
