#!/bin/sh

set -e 

export PATH=/usr/lpp/cbclib/xlc/bin:$PATH
export _BPX_SHAREAS=YES
export _CEE_RUNOPTS="FILETAG(,AUTOTAG)"
export REDIS_ENHANCED_ASCII="-qascii -D_ENHANCED_ASCII_EXT=0xFFFFFFFF"
export REDIS_64BIT="-q64"

(cd deps/hiredis && make clean && make)
(cd deps/lua && make clean && make)
(cd deps/linenoise && make clean && make)
make clean && make V=1