CC = gcc
CFLAGS = -g -Wall
CROSS_COMPILE ?= arm-linux-gnueabihf-
LDFLAGS =

ifneq ($(CROSS_COMPILE),)
	CC := $(CROSS_COMPILE)$(CC)
endif

TARGET = aesdsocket
SRCS = aesdsocket.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean built files
clean:
	rm -f $(TARGET) $(OBJS)

# Phony targets
.PHONY: all clean
