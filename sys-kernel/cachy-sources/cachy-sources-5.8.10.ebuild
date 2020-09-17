# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
CACHY_VERSION="r2"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full Cachy CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://github.com/hamadmarri/cachy-sched"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-5.8.10.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/500HZ.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/cachy-5.8-r2.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/cpu-patches.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/UKSM.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/zen.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/fsgsbase.xz https://github.com/HougeLangley/customkernel/releases/download/5.8.10-cachy/aaoi.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/patch-5.8.10.xz ${DISTDIR}/cachy-5.8-r2.xz ${DISTDIR}/cpu-patches.xz ${DISTDIR}/UKSM.xz ${DISTDIR}/zen.xz ${DISTDIR}/500HZ.xz ${DISTDIR}/fsgsbase.xz ${DISTDIR}/aaoi.xz"

KEYWORDS="~amd64"

src_prepare() {

	kernel-2-src-prepare-overlay_src_prepare

}
