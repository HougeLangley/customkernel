# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Define what default functions to run
ETYPE="sources"

# No 'experimental' USE flag provided, but we still want to use genpatches
K_EXP_GENPATCHES_NOUSE="1"

# Just get basic genpatches, -xanmod patch set already includes main updates
K_GENPATCHES_VER="1"

# -xanmod-hybrid already sets EXTRAVERSION to kernel Makefile
K_NOSETEXTRAVERSION="1"

# Not supported by the Gentoo security team
K_SECURITY_UNSUPPORTED="1"

# We want the very basic patches from gentoo-sources, experimental patch is
# already included in xanmod-hybrid
K_WANT_GENPATCHES="extras"

# Default enable Xanmod, You have to choose one of them.
# Both of them will make some errors
IUSE="+cjk"

# If you have been enable src_prepare-overlay
# please unmerge sys-kernel/xanmod-sources
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

DESCRIPTION="Liquorix kernel is best one for desktop, multimedia and gaming workloads"
HOMEPAGE="https://liquorix.net/"
LQX_VERSION="2"
LQX_URI="https://github.com/zen-kernel/zen-kernel/releases/download/"
CJKTTY_URI="https://raw.githubusercontent.com/zhmars/cjktty-patches/master/v5.x/"
OKV="${OKV}-lqx"
SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${GENPATCHES_URI}
	${LQX_URI}/v${OKV}${LQX_VERSION}/v${OKV}${LQX_VERSION}.patch.xz
	${CJKTTY_URI}/cjktty-${KV_MAJOR}.${KV_MINOR}.patch
"
KEYWORDS="~amd64"

K_EXTRAEINFO="For more info on liquorix-kernel and details on how to report problems, see: ${HOMEPAGE}."

src_unpack() {
	UNIPATCH_LIST="${DISTDIR}/v${OKV}${LQX_VERSION}.patch.xz"
	UNIPATCH_STRICTORDER="yes"
	
	if use cjk	;	then
		UNIPATCH_LIST+=" ${DISTDIR}/cjktty-${KV_MAJOR}.${KV_MINOR}.patch"
	fi

	kernel-2_src_unpack
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
	elog "MICROCODES"
	elog "Use Liquorix-Kernel with microcodes"
	elog "Read https://wiki.gentoo.org/wiki/Intel_microcode"
}
