# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
PROJECTC_VERSION="r3"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full Project-C CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://cchalpha.blogspot.com/"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-5.9.tar.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/0001-patch-5.9.14.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/prjc_v5.9-r3.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/500.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/mm59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/elevator59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/CPUf59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/cpu59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/25659.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/UKSM59R5.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/zen59.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/0001-patch-5.9.14.xz ${DISTDIR}/prjc_v5.9-r3.xz ${DISTDIR}/mm59.xz ${DISTDIR}/elevator59.xz ${DISTDIR}/CPUf59.xz ${DISTDIR}/cpu59.xz ${DISTDIR}/500.xz ${DISTDIR}/25659.xz ${DISTDIR}/UKSM59R5.xz ${DISTDIR}/zen59.xz"

KEYWORDS="~amd64"

src_prepare() {

	eapply "${FILESDIR}/fsync59.patch"
    eapply "${FILESDIR}/0001-i8042-decrease-debug-message-level-to-info.patch"
    eapply "${FILESDIR}/0002-silence-rapl.patch"
    eapply "${FILESDIR}/0003-intel_idle-tweak-cpuidle-cstates.patch"
    eapply "${FILESDIR}/0004-initialize-ata-before-graphics.patch"
    eapply "${FILESDIR}/0005-give-rdrand-some-credit.patch"
    eapply "${FILESDIR}/0006-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch"
    eapply "${FILESDIR}/0007-kernel-time-reduce-ntp-wakeups.patch"
    eapply "${FILESDIR}/0008-nvme-workaround.patch"
    eapply "${FILESDIR}/0009-increase-the-ext4-default-commit-age.patch"
    eapply "${FILESDIR}/0010-init-wait-for-partition-and-retry-scan.patch"

	kernel-2-src-prepare-overlay_src_prepare

}
