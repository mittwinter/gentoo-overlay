# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

EAPI=5

inherit autotools-utils

DESCRIPTION="Yubico Universal 2nd Factor (U2F) Server C Library"
HOMEPAGE="https://developers.yubico.com/libu2f-server/"
SRC_URI="https://developers.yubico.com/${PN}/Releases/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

RDEPEND="
	dev-libs/json-c"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-libs/check"
RDEPEND="${RDEPEND}
	"

src_prepare() {
	autotools-utils_src_prepare
}

src_configure() {
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
}
