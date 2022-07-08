# 第三方社区内核

**我发现还是有朋友将这个 overlay 加入到自己的系统中，而且出现一些奇奇怪怪的问题，不建议各位使用这个 Overlay，我一般会利用这个 Overlay 做一些试验。请大家斟酌。如果您将这个 Overlay 加入到自己的 Gentoo 系统，出现问题，请您自己解决，别告诉我**

**非常建议各位使用 Gentoo Linux 的朋友添加 [Gentoo-zh overlay](https://github.com/microcai/gentoo-zh) 源，这样能够得到更好更稳定的更新，谢谢你们的支持**

**xanmod, liquroix 都可以兼容 OpenZFS 文件系统，但是 RT 内核是不支持的，望周知**

**目前最新的一次第三方内核横评可以参考 [Phoronix](https://www.phoronix.com/scan.php?page=article&item=ryzen5-xanmod-liquorix&num=1)**

### Xanmod 内核

[Xanmod](https://xanmod.org/) 是 Linux 第三方定制内核中久负盛名的。大家可以通过 USE 来启用自己喜欢的 CPU 调度器(只针对长期支持版本)，我将原始版本 xanmod，xanmod-tt 并加上 cjktty 。原始 Xanmod 内核通过对默认的 CPU 调度器做足优化的情况下，能够在 [Phoronix Benchmark](https://www.phoronix.com/scan.php?page=article&item=xanmod-2020-kernel&num=3) 中击败众多对手，比方说 [Liquorix](https://liquorix.net/)。并且 Xanmod 的在其官方主页支持基于 Debian 的所有发行版，当然，还有 [Archlinux](https://aur.archlinux.org/packages/linux-xanmod/) 和 [Gentoo](https://gitlab.com/src_prepare/src_prepare-overlay/-/tree/master/sys-kernel/xanmod-sources) 。那么既然已经有 Gentoo 的 overlay 了，我为什么还要做一个 overlay 呢？

1. [src_prepare overlay](https://gitlab.com/src_prepare/src_prepare-overlay) 只提供稳定版本的 Xanmod 内核。而我们作为[Gentoo-zh](https://github.com/microcai/gentoo-zh) 要做出差异化，做出自己的调性；
2. config 配置文件在内核源码安装后就有了，大家注意源码文件夹中有一个名字叫做 CONFIG 的，从中把大家需要的配置文件拷贝到内核源码目录下，取名 .config 就可以开始编译了；
3. ~~UKSM 补丁，来源是 [Piotr Górski](https://gitlab.com/sirlucjan/kernel-patches/-/tree/master) 提供的各式各样第三方补丁，并且根据主线会实时更新；~~
4. cjktty 补丁，来源是 [zhmars](https://github.com/zhmars/cjktty-patches) 提供的第三方补丁，支持关注并保持更新。

### Xanmod-RT 内核

[RT内核](https://baike.baidu.com/item/RT-Linux/4376175) 是实时内核，这个内核并不是通用内核，或者是大家经常使用的那种，大部分时候需要应用程序支持，才能获得最大的效益。所以，大家根据自己的实际情况选择安装。

### Liquorix 内核

[Liquorix内核](https://liquorix.net/) 是比较老牌针对媒体、音乐和游戏优化的内核，早期的 Liquorix 是基于 CK 补丁，现在是基于 BMQ 和 PDS 两个 CPU 调度器补丁。依照版本不同，和 Xanmod 对比，互有胜负。大家选择使用就好。默认配置文件在 ebuild 所在目录下可以找到。

## 写在最后

最近一段时间第三方内核横品少了，不过就目前大家使用的习惯来看，Xanmod 内核和 Liquorix 是社区性能表现最为优异的。希望大家喜欢。

将来内核的测评我会在有空的时候再更新。

以上就是该 overlay 现在情况，将持续维护。

希望大家多多提意见。