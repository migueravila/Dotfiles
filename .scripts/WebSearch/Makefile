PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall search\n\tmake uninstall\tuninstall search\n"
install:
	install -Dm755 search $(BIN)/search
uninstall:
	rm -f $(BIN)/search
