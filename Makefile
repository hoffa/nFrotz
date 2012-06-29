SOURCES = \
	src/common/buffer.c \
	src/common/err.c \
	src/common/fastmem.c \
	src/common/files.c \
	src/common/hotkey.c \
	src/common/input.c \
	src/common/main.c \
	src/common/math.c \
	src/common/object.c \
	src/common/process.c \
	src/common/quetzal.c \
	src/common/random.c \
	src/common/redirect.c \
	src/common/screen.c \
	src/common/sound.c \
	src/common/stream.c \
	src/common/table.c \
	src/common/text.c \
	src/common/variable.c \
	src/dumb/dumb_init.c \
	src/dumb/dumb_input.c \
	src/dumb/dumb_output.c \
	src/dumb/dumb_pic.c
TARGET = nFrotz.tns
OBJECTS = $(SOURCES:.c=.o)

CC = nspire-gcc
LD = nspire-ld
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -Wall -Wextra -Os -DVERSION="\"2.43d\""
LDFLAGS =
LIBS = -lnspireio2

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $^ $(LIBS) -o $(@:.tns=.elf)
	$(OBJCOPY) -O binary $(@:.tns=.elf) $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET:.tns=.elf) $(TARGET)