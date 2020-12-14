PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall dtodo\n\tmake uninstall\tuninstall dtodo\n"
install:
	install -Dm755 dtodo $(BIN)/dtodo
uninstall:
	rm -f $(BIN)/dtodo
