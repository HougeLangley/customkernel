# customkernel

**如果你将我的 overlay 加入到系统中，不用担心，可以安心使用**

**大家注意源中提供的 Xanmod 默认 config 文件的，Project C 的配置在相应文件夹中可以找到。一方面有助于使用者更好的编译，另一方面保留了这个内核配置文件中的优化部分，而我这个 overlay 中 config 文件夹中的 xanmod cacule config 就删掉了，另外的两个保留，保留的是我自己使用的，各位根据具体情况酌情修改，5.9这次更新我发现我的 .config 配置文件不够全面，于是更换成 linux-tkg 的 .config 文件。最后，这个四个内核都可以安装 zfs-kmod，望周知**

## 两个魔改 Linux 内核 ebuild ，通过 USE 还可以添砖加瓦

### Xanmod 内核

[Xanmod](https://xanmod.org/) 是 Linux 第三方定制内核中非常著名的。原始 Xanmod 内核并没有对 CPU 调度器做非常特殊定制的情况下，能够在 [Phoronix Benchmark](https://www.phoronix.com/scan.php?page=article&item=xanmod-2020-kernel&num=3) 中击败众多对手，比方说 [Liquorix](https://liquorix.net/)。并且 Xanmod 的稳定版本在其官方主页支持基于 Debian 的所有发行版，当然，还有 [Archlinux](https://aur.archlinux.org/packages/linux-xanmod/) 和 [Gentoo](https://gitlab.com/src_prepare/src_prepare-overlay/-/tree/master/sys-kernel/xanmod-sources) 。那么既然已经有 Gentoo 的 overlay 了，我为什么还要做一个 overlay 呢？

1. [src_prepare overlay](https://gitlab.com/src_prepare/src_prepare-overlay) 只提供稳定版本的 Xanmod 内核；
2. 跟随上游 [Xanmod Cacule](https://github.com/xanmod/linux/tree/5.10-cacule) 这个分支的主线，目前大家看到的是5.10，后续会维护最新版本的内核；
3. 默认提供的 Xanmod 内核给用户可定制空间较少，我将uksm和cjktty加入到内核中，以 USE 的形式提供，大家需要只需要打开相关 USE 就能够方便使用了；
4. config 在内核源码安装后就有了，是 Xanmod 默认提供的版本，大家直接 make nconfig 就能够狗按照自己的喜好定制了，方便；
5. UKSM 补丁，来源是 [Piotr Górski](https://gitlab.com/sirlucjan/kernel-patches/-/tree/master) 提供的各式各样第三方补丁，并且根据主线会实时更新。

### Project C 内核

[Project C](https://cchalpha.blogspot.com/) 是 Linux 内核中 CPU Scheduler 第三方补丁，Project C 主要包含两个 CPU 调度器，一个是 BMQ，另一个是 PDS，两者都是非常适合在非RT内核中使用，提高响应性是它们的共同目的，就目前测试的结果来看，当然是稍微老的内核，PDS 和 BMQ 都非常适合在 Linux 的游戏机中使用，参考这个[视频](https://youtu.be/phA-M1biogE)，PDS 效果更好。目前这个内核我只添加 Project C 补丁，fsgsbase 和 UKSM 补丁，其余的补丁将来在通过测试慢慢加入。这个内核将遵循以下原则更新：

1. 内核跟随 [Linux Kernel](https://www.kernel.org/) 官方主线，补丁跟随 Project C 主线，UKSM 和 cjktty 都以 USE 形式加入了
2. 加入了部分 Linux-TKg 的一些微调补丁魔改

## 写在最后

Xanmod 内核补丁是目前全网性能最好的，突出表现在响应速度。希望大家喜欢。

以上就是该 overlay 现在和将来的目标，维护这三个 ebuild，持续更新，为了更好的性能，为了我们共同的挚爱—Linux Kernel。

希望大家多多提意见，多多提 issue，多多点赞。
