#!/bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

test -z "$VALAC" && VALAC=valac
if ! $VALAC --version | sed -e 's/^Vala \([0-9]\+\.[0-9]\+\).*$/\1/' | grep -vq '^0\.\([0-9]\|1[0-1]\)$'
then
    echo "**Error**: You must have valac >= 0.12.0 installed"
    echo "  to build vala. Download the appropriate package"
    echo "  from your distribution or get the source tarball at"
    echo "  http://download.gnome.org/sources/vala/"
    exit 1
fi

patch -p1 -RN -r ignored.rej << EOF
commit cc935eba2d66a250fc62c70d1f25f558ef21e81a
Author: Ole André Vadla Ravnås <oleavr@gmail.com>
Date:   Fri Jul 2 19:27:58 2010 +0200

    Fix close() binding on Windows.
    
    This is obviously a hack.

diff --git a/vapi/glib-2.0.vapi b/vapi/glib-2.0.vapi
index 815654a..922cf9d 100644
--- a/vapi/glib-2.0.vapi
+++ b/vapi/glib-2.0.vapi
@@ -3103,7 +3103,7 @@ namespace GLib {
 		[CCode (cname = "symlink")]
 		public static int symlink (string oldpath, string newpath);
 
-		[CCode (cname = "close", cheader_filename = "unistd.h")]
+		[CCode (cname = "_close", cheader_filename = "io.h")]
 		public static int close (int fd);
 	}
 
EOF
rm -f ignored.rej

patch -p1 -RN -r ignored.rej << EOF
commit e6f54231b527c84a1bc7b019eb5caf4546efab37
Author: Ole André Vadla Ravnås <oleavr@gmail.com>
Date:   Mon May 1 04:47:20 2017 +0200

    Work around broken UTimBuf binding on Windows
    
    This is obviously a hack.

diff --git a/vapi/glib-2.0.vapi b/vapi/glib-2.0.vapi
index b1a1785..5649870 100644
--- a/vapi/glib-2.0.vapi
+++ b/vapi/glib-2.0.vapi
@@ -3567,7 +3567,7 @@ namespace GLib {
 		}
 	}
 
-	[CCode (cname = "struct utimbuf", cheader_filename = "sys/types.h,utime.h")]
+	[CCode (cname = "struct utimbuf", cheader_filename = "sys/types.h,sys/utime.h")]
 	public struct UTimBuf {
 		time_t actime;       /* access time */
 		time_t modtime;      /* modification time */
EOF
rm -f ignored.rej

# Automake requires that ChangeLog exist.
touch ChangeLog
mkdir -p m4

rm -f .version
autoreconf -v --install || exit 1
cd $ORIGDIR || exit $?

if test -z "$NOCONFIGURE"; then
    $srcdir/configure "$@"
fi
