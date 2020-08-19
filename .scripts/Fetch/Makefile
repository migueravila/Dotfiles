PREFIX?=/usr
BIN?=$(PREFIX)/bin

default:
	@printf "Usage:\n\tmake install\tinstall ffetch\n\tmake uninstall\tuninstall ffetch\n"
install:
	install -Dm755 ffetch $(BIN)/ffetch
uninstall:
	rm -f $(BIN)/ffetch
