PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall dsys\n\tmake uninstall\tuninstall dsys\n"
install:
	install -Dm755 dsys $(BIN)/dsys
uninstall:
	rm -f $(BIN)/dsys
