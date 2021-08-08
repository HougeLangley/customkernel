# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Clipboard manager with advanced features"
HOMEPAGE="https://github.com/hluk/CopyQ"
SRC_URI="https://github.com/hluk/CopyQ/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
	dev-qt/qtcore
	dev-qt/qtgui[wayland]
	dev-qt/qtnetwork
	dev-qt/qtscript
	dev-qt/qtsvg
	dev-qt/qtwidgets
	dev-qt/qtx11extras
	x11-libs/libX11
	x11-libs/libXfixes
	x11-libs/libXtst
"
DEPEND="${DEPEND}"
BDEPEND="${DEPEND}
	dev-qt/linguist-tools
"

S="${WORKDIR}/CopyQ-${PV}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
