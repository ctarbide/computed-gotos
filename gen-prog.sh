#!/bin/sh
set -eu
perl -l -0777 -e'while(read(STDIN,$d,64)){print for (unpack(q{C*},$d))}' </dev/urandom |
    perl -lne'$x = $_; next if $x > 215; print(join(qq{\n}, map {$_+1} ($x % 6, $x / 6 % 6, $x / 36 % 6)))' |
    head -n100 | perl -pe'$_=pack(q{C},$_)' > prog
hexdump -Cv prog
echo all done
