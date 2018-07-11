#!/bin/sh


test -f ChangeLog || touch ChangeLog
test -f config.rpath || touch config.rpath

libtoolize=`which glibtoolize`
if test -z "$libtoolize"; then
    libtoolize=libtoolize
fi

intltoolize --copy --force
$libtoolize --automake --copy --force
aclocal $ACLOCAL_AMFLAGS
autoheader
automake --add-missing --copy
autoconf
