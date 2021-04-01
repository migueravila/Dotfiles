PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall prm\n\tmake uninstall\tuninstall prm\n"
install:
	install -Dm755 prm $(BIN)/prm
uninstall:
	rm -f $(BIN)/prm
