# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-pkg-2

MY_PN=MediathekView
DESCRIPTION="Download files from the public broadcasting services"
HOMEPAGE="http://zdfmediathk.sourceforge.net/"
SRC_URI="https://github.com/${MY_PN,,}/${MY_PN}/releases/download/${PV}/${MY_PN}-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8 >=dev-java/oracle-jre-bin-1.8[javafx]
	media-video/vlc
	media-video/flvstreamer
	"

S="${WORKDIR}"/${MY_PN}-${PV}

src_prepare() {
	ewarn "Bundled libs remaining:"
	ewarn "$(find lib -name '*.jar' | sort)"
	eapply_user
}

src_compile() {
	:
}

src_install() {
	java-pkg_dojar MediathekView.jar
	java-pkg_dojar lib/*.jar

	exeinto /usr/share/${PN}/lib/bin/
	doexe bin/flv.sh || die

	java-pkg_dolauncher ${PN} --main mediathek.Main

	# FIXME javafx:
	local javafx_jar="$(ls -1 /opt/oracle-jre-bin-1.8.*/lib/ext/jfxrt.jar)"
	sed "s,^CLASSPATH=\"\(.*\)\",CLASSPATH=\"\1:${javafx_jar}\"," -i "${JAVA_PKG_ENV}" || die
}
