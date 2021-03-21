# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Xanmod and UKSM sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://xanmod.org/"
LICENSE+=" CDDL"
SRC_URI="
         ${KERNEL_BASE_URI}/linux-5.11.tar.xz
         https://github.com/HougeLangley/customkernel/releases/download/Kernel-v5.11.x/0001-patch-5.11.7-xanmod1.xz
         ${GENPATCHES_URI}
"

src_unpack() {
    UNIPATCH_LIST_DEFAULT=""
    UNIPATCH_LIST="${DISTDIR}/0001-patch-5.11.7-xanmod1.xz"
    kernel-2-src-prepare-overlay_src_unpack
}

KEYWORDS="~amd64"

src_prepare() {

    eapply "${FILESDIR}/sphinx-workaround.patch"
    eapply "${FILESDIR}/UKSM-reversion01.patch"
    eapply "${FILESDIR}/cjktty.patch"
    eapply "${FILESDIR}/0011-06-Makefile.patch"

	kernel-2-src-prepare-overlay_src_prepare

}

pkg_postinst() {
	elog "MICROCODES"
	elog "Use xanmod-sources with microcodes"
	elog "Read https://wiki.gentoo.org/wiki/Intel_microcode"
}