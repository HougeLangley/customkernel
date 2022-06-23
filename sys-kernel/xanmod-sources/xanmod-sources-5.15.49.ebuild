# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="2"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
ETYPE="sources"
RDEPEND="
	!sys-kernel/xanmod-rt
	!sys-kernel/xanmod-edge
"
inherit kernel-2
detect_version

DESCRIPTION="XanMod sources with or without TT patches and CJKTTY options."
HOMEPAGE="https://xanmod.org
		https://github.com/zhmars/cjktty-patches"
LICENSE+=" CDDL"
KEYWORDS="~amd64"
IUSE="+xanmod tt cjk"
REQUIRED_USE="^^ ( xanmod tt )"
SLOT="0"
XANMOD_VERSION="1"
XANMOD_URI="https://github.com/xanmod/linux/releases/download/"
OKV="${OKV}-xanmod"
CJKTTY_URI="https://raw.githubusercontent.com/zhmars/cjktty-patches/master/v5.x/"
SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${GENPATCHES_URI}
	${XANMOD_URI}/${OKV}${XANMOD_VERSION}/patch-${OKV}${XANMOD_VERSION}.xz
	${XANMOD_URI}/${OKV}${XANMOD_VERSION}-tt/patch-${OKV}${XANMOD_VERSION}-tt.xz
	${CJKTTY_URI}/cjktty-${KV_MAJOR}.${KV_MINOR}.patch
"

src_unpack() {
	UNIPATCH_LIST_DEFAULT=""
	UNIPATCH_LIST=""
	if use xanmod	;	then
		UNIPATCH_LIST+=" ${DISTDIR}/patch-${OKV}${XANMOD_VERSION}.xz"
	fi

	if use tt	;	then
		UNIPATCH_LIST+=" ${DISTDIR}/patch-${OKV}${XANMOD_VERSION}-tt.xz"
	fi

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
	elog "Use xanmod-sources with microcodes"
	elog "Read https://wiki.gentoo.org/wiki/Intel_microcode"
}
