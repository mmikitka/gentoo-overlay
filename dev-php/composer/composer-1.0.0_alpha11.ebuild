# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
#
# Credits:
#  - Derived from https://github.com/jamiel/gentoo-overlay

EAPI=5

inherit versionator

MY_PV=$(replace_version_separator _ -)

DESCRIPTION="A dependency manager for PHP"
HOMEPAGE="http://getcomposer.org"
SRC_URI="http://getcomposer.org/download/${MY_PV}/composer.phar -> ${PN}-${MY_PV}.phar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/php[zip]"

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
	S=${WORKDIR}
}

src_install() {
	mv "${WORKDIR}/${A}" "${WORKDIR}/composer"
	dobin composer
}
