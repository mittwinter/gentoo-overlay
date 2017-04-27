# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="ASN.1 to C compiler"
HOMEPAGE="http://asn1c.sourceforge.net/"
SRC_URI="https://github.com/vlm/asn1c/releases/download/v${PV}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install(){
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc BUGS FAQ README.md TODO || die "dodoc failed"
}
