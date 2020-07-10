CC = gcc
CFLAGS = -O2 -Wall -Wextra -Wpedantic
LINKFLAGS = -lrt

.PHONY: clean

weather_signaler: weather_signaler.c
	$(CC) $(CFLAGS) $(LINKFLAGS) $< -o weather_signaler

clean:
	@rm -v weather_signaler
