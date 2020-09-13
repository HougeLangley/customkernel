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
HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-5.8.9.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0001-UKSM-for-5.8.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0004-add-acs-overrides_iommu.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0005-fsync.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0006-glitched-bmq.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0007-glitched-ondemand-bmq.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0008-prjc_v5.8-r2.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0009-ZFS-fix.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0010-misc.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0011-fsgsbase.xz https://github.com/HougeLangley/customkernel/releases/download/projectc/0012-zstd.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/patch-5.8.9.xz ${DISTDIR}/0001-UKSM-for-5.8.xz ${DISTDIR}/0004-add-acs-overrides_iommu.xz ${DISTDIR}/0005-fsync.xz ${DISTDIR}/0006-glitched-bmq.xz ${DISTDIR}/0007-glitched-ondemand-bmq.xz ${DISTDIR}/0008-prjc_v5.8-r2.xz ${DISTDIR}/0009-ZFS-fix.xz ${DISTDIR}/0010-misc.xz ${DISTDIR}/0011-fsgsbase.xz ${DISTDIR}/0012-zstd.xz"

KEYWORDS="~amd64"

src_prepare() {

	kernel-2-src-prepare-overlay_src_prepare

	rm "${S}"/.config || die

}
