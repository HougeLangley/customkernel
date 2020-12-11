# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson pam systemd

DESCRIPTION="D-Bus service to access fingerprint readers"
HOMEPAGE="https://fprint.freedesktop.org/ https://gitlab.freedesktop.org/libfprint/fprintd"

if [[ "${PV}" == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.freedesktop.org/libfprint/${PN}.git"
else
	SRC_URI="https://gitlab.freedesktop.org/libfprint/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +pam test systemd"

RDEPEND="
	sys-apps/dbus
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=sys-auth/libfprint-1.90.0
	sys-auth/polkit
	pam? (
		systemd? ( sys-apps/systemd )
		!systemd? ( sys-auth/elogind )
		sys-libs/pam
	)"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
	test? (
		dev-python/dbus-python
		dev-python/dbusmock
		dev-python/pycairo
		pam? ( sys-libs/pam_wrapper )
	)
	doc? (
		dev-util/gtk-doc
		dev-libs/libxml2
		dev-libs/libxslt
	)"

RESTRICT="mirror
	!test? ( test )"

S="${WORKDIR}/${PN}-v${PV}"

PATCHES=(
	"${FILESDIR}/${PV}-tests-optional.patch"
	"${FILESDIR}/${PV}-libsystemd-provider.patch"
)

src_configure() {
	local emesonargs=(
		$(meson_feature test)
		$(meson_use pam)
		-Dman=true
		-Dgtk_doc=$(usex doc true false)
		-Dpam=$(usex pam true false)
		-Dpam_modules_dir=$(getpam_mod_dir)
		-Dsystemd_system_unit_dir=$(systemd_get_systemunitdir)
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	dodoc NEWS README
	newdoc pam/README README.pam_fprintd
}
