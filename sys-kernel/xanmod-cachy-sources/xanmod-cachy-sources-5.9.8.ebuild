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
SRC_URI="${KERNEL_BASE_URI}/linux-5.9.tar.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/0001-patch-5.9.8-xanmod1-cachy.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/UKSM59R5.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/0001-patch-5.9.8-xanmod1-cachy.xz ${DISTDIR}/UKSM59R5.xz"

KEYWORDS="~amd64"

src_prepare() {

    kernel-2-src-prepare-overlay_src_prepare

}
