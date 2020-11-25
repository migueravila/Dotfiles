PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall bmkm\n\tmake uninstall\tuninstall bmkm\n"
install:
	install -Dm755 bmkm $(BIN)/bmkm
uninstall:
	rm -f $(BIN)/bmkm
