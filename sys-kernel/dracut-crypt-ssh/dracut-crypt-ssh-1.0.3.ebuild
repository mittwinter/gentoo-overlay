# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Dracut module which allows remote unlocking of systems"
HOMEPAGE="https://github.com/dracut-crypt-ssh/dracut-crypt-ssh/pulls"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-kernel/dracut
	net-misc/dropbear
	net-misc/dhcp[client]
	"
RDEPEND="${DEPEND}"

DOCS=( README.md )
