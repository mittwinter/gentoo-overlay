# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

DESCRIPTION=""
SRC_URI="https://github.com/thp/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE=""

KEYWORDS="~amd64"
SLOT="0"
LICENSE=""
USE=""

RDEPEND=">=virtual/qt-5
>=dev-lang/python-3.3.0"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
}

src_configure() {
	eqmake5 pyotherside.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
