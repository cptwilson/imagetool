CC = gcc
LD = gcc
LEX = flex
YACC = bison
RM = rm -f
LIBS = -L/usr/lib -lm
CFLAGS = -I. -mmmx -msse -msse2 -mtune=generic -I/usr/include -std=gnu99
LDFLAGS =
INCS = -I.

SOURCES = \
font.c \
imageread.c \
imagetool.c \
imagewrite.c \
lexxer.c \
makeimage.c \
packer.c \
parser.c

OBJS = \
font.o \
imageread.o \
imagetool.o \
imagewrite.o \
lexxer.o \
makeimage.o \
packer.o \
parser.o

build :
	$(LEX) -is -olexxer.c lexxer.l
	$(YACC) -d -oparser.c parser.y
	$(CC) $(CFLAGS) $(INCS) -c $(SOURCES)
	$(LD) $(LDFLAGS) -o imagetool $(OBJS) $(LIBS)
	
clean :
	$(RM) $(OBJS)
	$(RM) imagetool
