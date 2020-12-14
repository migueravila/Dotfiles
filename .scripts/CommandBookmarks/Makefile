PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall cbmkm\n\tmake uninstall\tuninstall cbmkm\n"
install:
	install -Dm755 cbmkm $(BIN)/cbmkm
uninstall:
	rm -f $(BIN)/cbmkm
