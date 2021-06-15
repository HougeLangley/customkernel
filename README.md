# customkernel

**如果你将我的 overlay 加入到系统中，不用担心，可以安心使用**

**但是非常建议各位使用 Gentoo Linux 的朋友添加 Gentoo-zh overlay 源，这样能够得到更好更稳定的更新，谢谢你们的支持**

**大家注意源中提供的 Xanmod 默认 config 文件的，这两个内核都可以兼容 openZFS 文件爱你系统，望周知**

### Xanmod-Hybrid 内核

[Xanmod-Hybrid](https://xanmod.org/) 是 Linux 第三方定制内核中久负盛名的。大家可以通过 USE 来启用自己喜欢的 CPU 调度器，我将原始版本 xanmod，xanmod-cacule，cjktty 和 uksm 进行了融合，为了区别 xanmod 原始贡献者的版本，取了这个名字。原始 Xanmod 内核通过对默认的 CPU 调度器做足优化的情况下，能够在 [Phoronix Benchmark](https://www.phoronix.com/scan.php?page=article&item=xanmod-2020-kernel&num=3) 中击败众多对手，比方说 [Liquorix](https://liquorix.net/)。并且 Xanmod 的在其官方主页支持基于 Debian 的所有发行版，当然，还有 [Archlinux](https://aur.archlinux.org/packages/linux-xanmod/) 和 [Gentoo](https://gitlab.com/src_prepare/src_prepare-overlay/-/tree/master/sys-kernel/xanmod-sources) 。那么既然已经有 Gentoo 的 overlay 了，我为什么还要做一个 overlay 呢？

1. [src_prepare overlay](https://gitlab.com/src_prepare/src_prepare-overlay) 只提供稳定版本的 Xanmod 内核。而我们作为[Gentoo-zh](https://github.com/microcai/gentoo-zh) 要做出差异化，做出自己的调性；
2. config 配置文件在内核源码安装后就有了，大家注意源码文件夹中有一个名字叫做 CONFIG 的，从中把大家需要的配置文件拷贝到内核源码目录下，取名 .config 就可以开始编译了；
3. UKSM 补丁，来源是 [Piotr Górski](https://gitlab.com/sirlucjan/kernel-patches/-/tree/master) 提供的各式各样第三方补丁，并且根据主线会实时更新；
4. cjktty 补丁，来源是 [zhmars](https://github.com/zhmars/cjktty-patches) 提供的第三方补丁，支持关注并保持更新。

### Linux-TkG 内核

[Linux-TkG](https://github.com/Frogging-Family/linux-tkg) 最早是 Archlinux 中一个小有名气的魔改内核，包括了非常多的补丁，BMQ, PDS, MuQSS，并且还加上了一些第三方的补丁集进行优化和增强。大家不妨可以试试。这个内核将遵循以下原则更新：

1. 内核主要补丁跟随 [Linux-TkG](https://github.com/Frogging-Family/linux-tkg) 官方主线，次要的几个补丁增加 cjktty，uksm 和 BBR2
2. 默认的 config 文件在 ebuild 同目录下的 config 文件中，需要的朋友复制粘贴后，稍加配置就能使用了。

## 写在最后

Xanmod 内核补丁是目前全网性能最好的，突出表现在响应速度。希望大家喜欢。

Linux-TkG 内核因为自己曾经也是忠实使用者，还是很喜欢的。

以上就是该 overlay 现在和将来的目标，维护这三个 ebuild，持续更新，为了更好的性能，为了我们共同的挚爱—Linux Kernel。

希望大家多多提意见，多多提 issue，多多点赞。
