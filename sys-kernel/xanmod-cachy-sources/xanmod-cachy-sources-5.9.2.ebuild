# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
CACHY_VERSION="r7"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full XanMod and UKSM sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-5.9.tar.xz https://github.com/xanmod/linux/releases/download/5.9.2-xanmod1/patch-5.9.2-xanmod1.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/UKSM59R4.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/patch-5.9.2-xanmod1.xz ${DISTDIR}/UKSM59R4.xz"

KEYWORDS="~amd64"

src_prepare() {

    eapply "${FILESDIR}/fsync59.patch"

	kernel-2-src-prepare-overlay_src_prepare

}
