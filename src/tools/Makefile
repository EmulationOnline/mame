CXX = g++
CXXFLAGS = -std=c++17 -DCRLF=2 -I../osd -I../lib/util -I../../3rdparty -I../../3rdparty/zlib -I../../3rdparty/flac/include -I../../3rdparty/utf8proc
LIBS = -lFLAC -lzstd -lpthread

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
	   $(wildcard ../../3rdparty/zlib/*.c) \
       ../../3rdparty/utf8proc/utf8proc.c

OBJS = $(SRCS:.cpp=.o)
OBJS := $(OBJS:.c=.o)

chdman: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

EMCXX=~/external/emscripten/em++
OBJ_JS := $(OBJ_JS:.c=.js)
WASMFLAGS=-Wl,--no-entry -Wl,--export-all -s EXPORTED_FUNCTIONS=$(EXPORTS) -s EXPORTED_RUNTIME_METHODS=['HEAPU8'] -DISWASM -sALLOW_MEMORY_GROWTH
chdman.js: $(OBJ_JS)
	$(EMCXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

.PHONY: clean deps
deps:
	apt-get update && apt-get install -y libflac-dev libzstd-dev

clean:
	rm -f $(OBJS) chdman
