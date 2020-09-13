# customkernel

这里将集合各种定制 Linux 内核 ebuild 脚本

到目前为止，完成两个比较主流的 Linux 内和 ebuild 搭建。

第一个是基于 Xanmod，使用 Cachy 作为默认 CPU Scheduler，现阶段这个 CPU Scheduler 还处于比较初级的阶段，关于 Cachy 的算法就我目前理解的情况是这样的，任务分配给 CPU 后，它会坚持执行直到另一个 CPU 闲置，然后该任务才可能被拉到新的 CPU。禁用定期平衡的原因是利用任务在 CPU 缓存。

当然啦，Xanmod 中也包含了其他特性，比方说 fsgsbase，支持 Linux 模块使用 zstd 压缩，GCC 优化等等～可用性还是很好的。

第二个是基于 Project C 的 Linux 内核，本来我打算加入更多可支持的补丁，比方说 Zen 内核的优化，还有一些小的修改。但是因为能力不足，没有实现，后续逐渐学习后给它们加进去。

后续不会盲目增加更多内核，而是在此基础上优化和精进，希望大家多多支持。
