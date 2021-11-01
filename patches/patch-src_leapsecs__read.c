$NetBSD$

PKG_SYSCONFDIR support.

--- src/leapsecs_read.c.orig	2017-01-15 22:38:59.000000000 +0000
+++ src/leapsecs_read.c
@@ -19,7 +19,7 @@ int leapsecs_read()
   int i;
   struct tai u;
 
-  fd = open("/etc/leapsecs.dat",O_RDONLY | O_NDELAY);
+  fd = open("@PKG_SYSCONFDIR@/leapsecs.dat",O_RDONLY | O_NDELAY);
   if (fd == -1) {
     if (errno != ENOENT) return -1;
     if (leapsecs) alloc_free((char *)leapsecs);
