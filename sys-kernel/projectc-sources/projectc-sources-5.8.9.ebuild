# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
PROJECTC_VERSION="1"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full Project-C CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://cchalpha.blogspot.com/"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-5.8.9.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/prjc_v5.8-r2.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/fsgsbase.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/UKSM-for-5.8.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/patch-5.8.9.xz ${DISTDIR}/prjc_v5.8-r2.xz ${DISTDIR}/fsgsbase.xz ${DISTDIR}/UKSM-for-5.8.xz"

KEYWORDS="~amd64"

src_prepare() {

	kernel-2-src-prepare-overlay_src_prepare

	rm "${S}"/.config || die

}
