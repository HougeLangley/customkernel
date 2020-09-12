# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
XANMOD_VERSION="1"
ETYPE="sources"

inherit customkernel
detect_version

DESCRIPTION="Full XanMod and Cachy CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://xanmod.org"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz https://sourceforge.net/projects/xanmod/files/experimental/cachy_cpu_sched/5.8.8-xanmod1-cachy/patch-5.8.8-xanmod1-cachy.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/patch-${OKV}-xanmod${XANMOD_VERSION}-cachy.xz"

KEYWORDS="~amd64"

src_prepare() {

	rm "${S}"/.config || die

}
