# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils qmake-utils

DESCRIPTION="Library and tool for personalization of Yubico's YubiKey NEO"
SRC_URI="http://opensource.yubico.com/yubioath-desktop/releases/${P}.tar.gz"
HOMEPAGE="http://opensource.yubico.com/yubioath-desktop"

KEYWORDS="~amd64"
SLOT="4"
LICENSE="BSD-2"
USE="broken"

RDEPEND="dev-qt/qtsingleapplication
dev-qt/qtquickcontrols
>=dev-python/pyotherside-1.5.1
app-crypt/yubikey-manager"
DEPEND="${RDEPEND}"

S="${WORKDIR}/"

src_prepare() {
	epatch ${FILESDIR}/qtsingleapp.patch
	eapply_user
}

src_configure() {
	eqmake5 yubioath-desktop.pro
	python build_qrc.py resources.json
}

src_install() {
	emake install INSTALL_ROOT="${D}"
#    python_optimize  # does all packages by default
	domenu resources/yubioath.desktop
	doicon resources/icons/yubioath.png

	emake compiler_rcc_make_all
	emake compiler_buildqrc_make_all
	emake compiler_moc_header_make_all

}
