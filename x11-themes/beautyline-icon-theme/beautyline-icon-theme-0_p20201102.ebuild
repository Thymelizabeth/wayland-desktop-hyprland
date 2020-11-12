# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="BeautyLine Icons Theme"

HOMEPAGE="https://www.gnome-look.org/p/1425426"
SRC_URI="BeautyLine.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~ppc-aix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
S="${WORKDIR}"/BeautyLine

LICENSE="GPL-3"
SLOT="0"
RESTRICT="fetch"

pkg_pretend() {
	elog "download the package manually from"
	elog "\t ${HOMEPAGE}"
	elog "and put it in ${DISTDIR}"
}

# dead symbolic links QA
src_prepare() {
	default
	find . -xtype l -delete || die
	mv mimetypes/scalable/application-vnd.oasis.opendocument.text-master.svg{ln,} || die
	rm apps/scalable/goa-account-msn* || die
}

src_install() {
	insinto /usr/share/icons/BeautyLine
	doins -r index.theme actions \
		apps devices mimetypes places
}
