# Copyright 2018 Martin Wegner
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils git-r3

DESCRIPTION="ASN.1 to C compiler"
HOMEPAGE="https://github.com/vlm/asn1c"
EGIT_REPO_URI="https://github.com/vlm/asn1c"

LICENSE="BSD-2"
SLOT="0"
IUSE=""

src_prepare() {
	eautoreconf
	default
}

src_install(){
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc BUGS ChangeLog FAQ LICENSE README.md || die "dodoc failed"
}
