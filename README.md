# customkernel

**在大家安装 Project C 内核之前，请先安装以下两个包 dev-util/dwarves dev-libs/libbpf**

**在内核的 config 中的 CONFIG_LOCALVERSION="" 请大家还是给自己的版本取个名字，另一个源提供的 Xanmod 中是不提供 config 文件的，但是我的保留了原始的 .config 文件，一方面有助于使用者更好的编译，另一方面保留了这个内核配置文件中的优化部分，而我这个 overlay 中 config 文件夹中的 xanmod cacule config 就删掉了，另外的两个保留，保留的是我自己使用的，各位根据具体情况酌情修改，5.9这次更新我发现我的 .config 配置文件不够全面，于是更换成 linux-tkg 的 .config 文件。最后，这个四个内核都可以安装 zfs-kmod，望周知**

## 三个魔改 Linux 内核 ebuild

### Xanmod Cacule 内核

[Xanmod](https://xanmod.org/) 是 Linux 第三方定制内核中非常著名的。原始 Xanmod 内核并没有对 CPU 调度器做非常特殊定制的情况下，能够在 [Phoronix Benchmark](https://www.phoronix.com/scan.php?page=article&item=xanmod-2020-kernel&num=3) 中击败众多对手，比方说 [Liquorix](https://liquorix.net/)。并且 Xanmod 的稳定版本在其官方主页支持基于 Debian 的所有发行版，当然，还有 [Archlinux](https://aur.archlinux.org/packages/linux-xanmod/) 和 [Gentoo](https://gitlab.com/src_prepare/src_prepare-overlay/-/tree/master/sys-kernel/xanmod-sources) 。那么既然已经有 Genoo 的 overlay 了，我为什么还要做一个 overlay 呢？

1. [src_prepare overlay](https://gitlab.com/src_prepare/src_prepare-overlay) 只提供稳定版本的 Xanmod 内核；
2. 跟随上游 [Xanmod Cacule](https://github.com/xanmod/linux/tree/5.10-cacule) 这个分支的主线，目前大家看到的是5.10，后续不会维护长期支持版本的内核，只会一直跟随最新内核；
4. config 在内核文件夹中，内容同 Xanmod-Cacule 官方提供的相同；
5. 添加 UKSM 补丁，这个补丁的来源是 [Piotr Górski](https://gitlab.com/sirlucjan/kernel-patches/-/tree/master) 提供的各式各样第三方补丁，并且根据主线会实时更新。

关于 customkernel 内核中，Xanmod-Cacule 魔改仅会添加 UKSM 这个私货给各位朋友，大家记住使用 500Hz 时钟频率。

### Project C 内核

[Project C](https://cchalpha.blogspot.com/) 是 Linux 内核中 CPU Scheduler 第三方补丁，Project C 主要包含两个 CPU 调度器，一个是 BMQ，另一个是 PDS，两者都是非常适合在非RT内核中使用，提高响应性是它们的共同目的，就目前测试的结果来看，当然是稍微老的内核，PDS 和 BMQ 都非常适合在 Linux 的游戏机中使用，参考这个[视频](https://youtu.be/phA-M1biogE)，PDS 效果更好。目前这个内核我只添加 Project C 补丁，fsgsbase 和 UKSM 补丁，其余的补丁将来在通过测试慢慢加入。这个内核将遵循以下原则更新：

1. 内核跟随 [Linux Kernel](https://www.kernel.org/) 官方主线，补丁跟随 Project C 主线，UKSM 也加入了
2. 加入了 zen-kenrel 的一些微调补丁魔改
3. bcachefs 文件系统的支持

### Houge 内核

[Houge 内核](https://github.com/HougeLangley/customkernel) 内核是我私自魔改的，Linux 内核中 CPU Scheduler 使用的是 MuQSS，就是 CK 内核针对多线程的那个补丁。遵循以下原则持续更新：

1. 上游跟随 [CK 内核](https://ck-hack.blogspot.com/)) 的 MuQSS 补丁集（如果中途断裂开，Houge 内核也将暂停维护，如果大家想使用其他的，可以考虑 BMQ 作为替代）
2. 加入 UKSM 补丁
3. 加入 zen-kernel 的一些微调补丁魔改
4. 加入 GCC 优化补丁

## 写在最后

以上就是该 overlay 现在和将来的目标，维护这三个 ebuild，持续更新，为了更好的性能，为了我们共同的挚爱—Linux Kernel。

希望大家多多提意见，多多提 issue，多多点赞。
