CXX = g++
CXXFLAGS = -std=c++17 -DCRLF=2 -I../osd -I../lib/util -I../../3rdparty -I../../3rdparty/zlib -I../../3rdparty/flac/include -I../../3rdparty/utf8proc
LIBS = -lz -lFLAC -lzstd -lpthread

SRCS = chdman.cpp \
       version.cpp \
       osd_misc.cpp \
       ../lib/util/avhuff.cpp \
       ../lib/util/aviio.cpp \
       ../lib/util/bitmap.cpp \
       ../lib/util/cdrom.cpp \
       ../lib/util/chd.cpp \
       ../lib/util/chdcodec.cpp \
       ../lib/util/corefile.cpp \
       ../lib/util/corestr.cpp \
       ../lib/util/coreutil.cpp \
       ../lib/util/flac.cpp \
       ../lib/util/hash.cpp \
       ../lib/util/hashing.cpp \
       ../lib/util/huffman.cpp \
       ../lib/util/ioprocs.cpp \
       ../lib/util/md5.cpp \
       ../lib/util/palette.cpp \
       ../lib/util/path.cpp \
       ../lib/util/strformat.cpp \
       ../lib/util/unicode.cpp \
       ../lib/util/vbiparse.cpp \
       ../lib/util/vecstream.cpp \
       ../lib/util/wavwrite.cpp \
       ../osd/osdcore.cpp \
       ../osd/osdsync.cpp \
       ../osd/modules/file/stdfile.cpp \
       ../../3rdparty/lzma/C/LzmaDec.c \
       ../../3rdparty/lzma/C/LzmaEnc.c \
       ../../3rdparty/lzma/C/LzFind.c \
       ../../3rdparty/lzma/C/LzFindMt.c \
       ../../3rdparty/lzma/C/Threads.c \
       ../../3rdparty/lzma/C/CpuArch.c \
       ../../3rdparty/lzma/C/LzFindOpt.c \
       ../../3rdparty/utf8proc/utf8proc.c

OBJS = $(SRCS:.cpp=.o)
OBJS := $(OBJS:.c=.o)

chdman: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

.PHONY: clean deps
deps:
	apt-get update && apt-get install -y libflac-dev libzstd-dev

clean:
	rm -f $(OBJS) chdman
