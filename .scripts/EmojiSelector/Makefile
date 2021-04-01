PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall demoji\n\tmake uninstall\tuninstall demoji\n"
install:
	install -Dm755 demoji $(BIN)/demoji
uninstall:
	rm -f $(BIN)/demoji
