# $NetBSD: Makefile,v 1.4 2025/05/22 04:51:29 schmonz Exp $

GITHUB_PROJECT=		shttpd
GITHUB_TAG=		179e52631ce26d2e3b6137596466b1764ba276ea
DISTNAME=		${GITHUB_TAG}
PKGNAME=		superscript-${GITHUB_PROJECT}-0.65
CATEGORIES=		www
MASTER_SITES=		${MASTER_SITE_GITHUB:=SuperScript/}
DIST_SUBDIR=		${GITHUB_PROJECT}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://web.archive.org/web/20120908072828/http://www.superscript.com/shttpd/index.html
COMMENT=		HTTP daemons designed to complement publicfile
#LICENSE=		# TODO: (see mk/license.mk)

DJB_SLASHPACKAGE=	yes

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	do-configure
SUBST_FILES.paths=	src/leapsecs_read.c
SUBST_VARS.paths=	PKG_SYSCONFDIR

FORCE_C_STD=		c89

DJB_ERRNO_FIXUP=	error.h leapsecs_read.c

LDFLAGS.SunOS+=		-lsocket

post-configure:
	cd ${DJB_CONFIG_DIR} && cp conf-ld conf-lds

# XXX do-install:

.include "../../mk/djbware.mk"
.include "../../mk/bsd.pkg.mk"
