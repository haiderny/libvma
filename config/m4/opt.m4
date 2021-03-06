# opt.m4 - Macros to control optimization
# 
# Copyright (C) Mellanox Technologies Ltd. 2016-2017.  ALL RIGHTS RESERVED.
# See file LICENSE for terms.
#

##########################
# Logging control
#
# VMA_OPTIMIZE_LOG values:
# 5 - VMA_DEBUG and up
# 6 - VMA_FINE and up
# 10 - invalid value (no logging optimization)
#
AC_ARG_ENABLE(
    [opt-log],
    AC_HELP_STRING(
        [--enable-opt-log],
        [Optimize logging output: none, medium, high (default=medium)]),,
    enableval=medium)
AC_MSG_CHECKING(
    [checking for logging optimization])
case "$enableval" in
    yes | medium)
        CPPFLAGS="$CPPFLAGS -DVMA_OPTIMIZE_LOG=6 -DNDEBUG"
        ;;
    no | none)
	CPPFLAGS="$CPPFLAGS -DVMA_OPTIMIZE_LOG=10"
        ;;
    high)
        CPPFLAGS="$CPPFLAGS -DVMA_OPTIMIZE_LOG=5 -DNDEBUG"
        ;;
    *)
        AC_MSG_ERROR([Unrecognized --enable-opt-log parameter as $enableval])
        ;;
esac
AC_MSG_RESULT([$enableval])

