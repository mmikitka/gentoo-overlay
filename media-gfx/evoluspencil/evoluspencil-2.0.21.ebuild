EAPI=5
MY_P="evolus-pencil"

inherit fdo-mime

DESCRIPTION="A simple GUI prototyping tool to create mockups"
HOMEPAGE="http://pencil.evolus.vn/"
SRC_URI="https://github.com/prikhi/pencil/releases/download/v2.0.21/Pencil-2.0.21-linux-pkg.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="|| ( www-client/firefox www-client/firefox-bin )"

S=${WORKDIR}/${MY_P}

src_prepare() {
	# avoid file collisions with media-gfx/pencil
	mv usr/share/applications/{pencil,evoluspencil}.desktop || die
	sed -e "s/\/usr\/bin\/pencil/\/usr\/bin\/evoluspencil/" -i usr/share/applications/${PN}.desktop || die
}

src_install() {
	doins -r usr
	newbin "${FILESDIR}"/launcher ${PN}
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
