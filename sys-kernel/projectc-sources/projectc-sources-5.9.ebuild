# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
PROJECTC_VERSION="r0"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full Project-C CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://cchalpha.blogspot.com/"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-5.9.tar.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/prjc_v5.9-r0.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/UKSM59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/mm59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/elevator59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/CPUf59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/cpu59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/75059.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/25659.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/prjc_v5.9-r0.xz ${DISTDIR}/UKSM59.xz ${DISTDIR}/mm59.xz ${DISTDIR}/elevator59.xz ${DISTDIR}/CPUf59.xz ${DISTDIR}/cpu59.xz ${DISTDIR}/75059.xz ${DISTDIR}/25659.xz"

KEYWORDS="~amd64"

src_prepare() {

	kernel-2-src-prepare-overlay_src_prepare

}
