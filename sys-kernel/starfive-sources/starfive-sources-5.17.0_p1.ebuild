# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
ETYPE="sources"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
	app-arch/cpio
	sys-devel/bc
	sys-apps/kmod
	dev-libs/elfutils
	dev-util/pahole
"

inherit kernel-2
detect_version
EGIT_COMMIT="b7291fc03413afd87e53df407445c8d0edd3a155"
SRC_URI="https://github.com/starfive-tech/linux/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~riscv"
DESCRIPTION="Linux kernel for StarFive's JH7100 RISC-V SoC"
HOMEPAGE="https://starfivetech.com"

S="${WORKDIR}/linux-${EGIT_COMMIT}}"

K_EXTRAEINFO="For more info on starfive linux and details on how to report problems, see: ${HOMEPAGE}."

src_prepare() {
	kernel-2_src_prepare
}

pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the ${HOMEPAGE} directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""

	kernel-2_pkg_setup
}

pkg_postinst() {
	elog "You could find StarFive dtb"
	elog "in /arch/riscv/boot/dts/starfive/"
	elog "cp to /boot"
}
