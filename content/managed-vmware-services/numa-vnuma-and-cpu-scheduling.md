---
node_id: 5135
title: 'NUMA, VNUMA and CPU Scheduling'
type: article
created_date: '2016-01-18'
created_by: Rackspace Support
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Managed VMware Services
product_url: managed-vmware-services
---

### What is NUMA?

NUMA stands for Non-Uniform Memory Access, but what exactly is NUMA? In a NUMA architecture, each CPU is assigned its own local memory, and the CPU and memory combined form a NUMA node.

     **Local MEM + CPU CORES = NUMA Node**

The following diagram illustrates the difference between systems that are NUMA aware and systems that are not NUMA aware.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA1.png" width="600" height="" alt=""  />















NUMA is important because it enables a processor to access its own local memory faster than non-local memory, such as memory local to another processor or memory shared between processors. However, if the locality of memory access is not taken into consideration, NUMA can cause latency problems for applications.

### What is vNUMA?

vNUMA removes the transparency between the VM and the OS and presents the NUMA architecture directly to the VM's operating system. It worth mentioning that vNUMA also known as wide NUMA in the industry. For a wide VM, the underlying architecture where the VM runs, the NUMA topology of the VM spans across multiple NUMA nodes. After the initial power-up of a vNUMA-enabled VM, the architecture presented to the OS is permanently defined and cannot be altered. This restriction is generally positive because changing the vNUMA architecture could cause instabilities in the OS, but it could cause performance problems if the VM is migrated via vMotion to a hypervisor with a different NUMA architecture. It is worth mentioning that although most applications can take advantage of vNUMA, the majority of VMs are small enough to fit into a NUMA node; recent optimization on wide-VM support or vNUMA does not affect them.

**Quote** : _"...vSphere 5.x allocates memory belonging to a virtual node from the home node of the corresponding NUMA client.  This significantly improves memory locality. vNUMA will only kick in  automatically when vCPU's exceed 8 vCPU's and hot add is disabled on the VM container. "_**[1]**_._

Therefore, how the guest OS or its applications place processes and memory can significantly affect performance. The benefit of exposing NUMA topology to the VM can be significant by allowing the guest to make the optimal decision considering underlying NUMA architecture. By assuming that the guest OS will make the optimal decision given the exposed vNUMA topology, instead of interleaving memory among NUMA clients.

**Quote** : "When a vNUMA virtual machine with the hot-add memory option is enabled and memory is hot-added to it, that memory is now allocated equally across all NUMA regions. In previous releases, all new memory was allocated only to region 0. This enhancement ensures that all regions benefit from the increase in RAM, enabling the virtual machine to scale without requiring any downtime." **[2]**

**Note:** vNUMA is a vSphere 5._x_ improvement and was not a feature of vSphere 4._x_. Hot-add RAM is now vNuma aware in vSphere 6.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA2.png" width="400" height="" alt=""  />

### Why does NUMA matter?

Any abstraction has a performance cost. For a NUMA system, the performance cost is that the latency of a remote memory operation (accessing memory from a different NUMA node) is more expensive than the latency of a local memory operation.

**Does the cost of this latency matter?**

When you consider a multi-threaded application, it is worth considering NUMA and locality because latencies could affect the performance of an application.

### Assigning of sockets and cores

The effect of assigning virtual cores per socket and the impact it has on performance is controversial. Following are two contradictory statements from two recognised industry experts.

**Quote by Frank Denneman** : "Using virtual sockets or virtual cores does not impact the performance of the virtual machine."**[3]**

**Quote by Mark Achtemichuk** : "It's often been said that this change of processor presentation does not affect performance, but it may impact performance by influencing the sizing and presentation of virtual NUMA to the guest operating system."**[4]**

So, does it or does it not affect performance? The reason VMware introduced the advanced settings for cores-per-socket was to address licensing issues with some operating systems. Based on this information alone, you might assume that changing the cores or sockets should not make any performance impact to a VM. This is not true if you follow the results of Mark Achtemichuk, who found during testing that the number of NUMA nodes changes depending on the number of cores or sockets used, which directly impacts performance.

### Performance considerations

When you are assigning virtual sockets, cores per socket, and vNUMA, you might create vNUMA nodes that violate the underlying physical NUMA, which can directly impact performance. You can use the ESXTOP tool to see the number of NUMA nodes a physical host has,which can help determine how many virtual sockets and cores per socket you might want to select for wide VMs. Typically, for best performance, set the sockets to the number of vCPUs needed, and set the cores per socket to 1.  That will let the underlying hardware determine the vNUMA nodes properly.

### NUMA alignment best practices

So where do you go from here? These are a few tips.

- Know your NUMA size. Especially consider it when buying new servers. You might need to increase your core count or RAM size to accommodate your workloads.
- CPU. If you have newer hardware, you will have fewer issues with NUMA boundaries. If you have older hardware, especially dual-socket, dual-core HT systems, you will need to be more aware because many VMs have four or more vCPUs.
- RAM. If you have many, smaller servers, you will likewise have more issues with NUMA boundaries because of the increased amount of RAM being required by applications.
- Size your VMs, wherever possible, around even multiples of the NUMA node. For example, on a hex-core (6C) system, use to 2, 3, or 6 cores.
- If you enable Hyper-Threading, enable ESXi or the VM, or both, to be able to use it towards the NUMA core count. Also tell the VM to keep multiple virtual cores together (see below).

### Check NUMA topology

#### ESX host, using ESXTOP

1. Run ESXTOP.

2. To enter on memory statistics, enter m.

3. To change the fields that are displayed, enter f.

4. To show NUMA-related fields, enter g again.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA3.png" width="500" height="" alt=""  />

If NUMA is enabled, you will see values (like 0, 1, or 2 for each node) on the NHN column:

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA4.png" width="600" height="" alt=""  />

The useful aspect of the NUMA statistics in ESXTOP for troubleshooting is the locality information:

- NRMEM: Amount of memory running in a remote memory node.
- NLMEM: Amount of memory running in the local memory node.
- N%L: Percentage of memory running locally. The lower this number, the larger the risk that NUMA locality is causing a performance problem.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA5.png" width="650" height="" alt=""  />

#### Windows

Coreinfo is a Windows Sysinternals tool that you can use to view the NUMA topology on Windows.

Run coreinfo &ndash;n.

In the following example, the VM has a single NUMA node.



<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA6.png" width="600" height="" alt=""  />

#### Linux

numactl -- hardware

numactl -- show

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA7.png" width="450" height="" alt=""  />

### NUMA considerations

As you think about NUMA alignment, consider the following points:

- Enabling CPU hot plug will disable vNUMA (where the underlying NUMA architecture is exposed directly to the guest OS) &mdash; [VMware KB 2040375](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2040375)
- Just because your NUMA node size is 16 CPUs and 128 GB of RAM, that doesn't mean you should create a large VM. Right-size your VMs to avoid unnecessary kernel NUMA scheduling.

### Rackspace recommendations for NUMA

The Hot add option must be disabled on the VM's with more than 8 vCPU's to take advantage of Vnuma.

_When you create a VM, you have the option to specify the number of virtual sockets and the number of cores per virtual socket. In general, we recommend leaving this at the default value of 1__core per socket (with the number of virtual sockets therefore equal to the number of vCPUs). _

| **Hypervisor** | **VM** |
| --- | --- |
| Socket | Cores per socket | NUMA nodes | Core per Socket | Virtual Cores | vNUMA nodes | Hot add |
| 1 | 1 | 1 | 1 | 1 | 1 | Enable |
| 2 | 1 | 2 | 1 | Enable |
| 4 | 1 | 4 | 1 | Enable |
| 8 | 1 | 8 | 1 | Disable |
| 12 | 1 | 12 | 1 | Disable |
| 2 | 1 | 2 | 1 | 1 | 2 | Enable |
| 2 | 2 | 2 | 2 | Enable |
| 4 | 2 | 4 | 2 | Enable |
| 8 | 2 | 8 | 2 | Disable |
| 12 | 2 | 12 | 2 | Disable |
| 3 | 1 | 3 | 1 | 1 | 3 | Enable |
| 2 | 3 | 2 | 3 | Enable |
| 4 | 3 | 4 | 3 | Enable |
| 8 | 3 | 8 | 3 | Disable |
| 12 | 3 | 12 | 3 | Disable |
| 4 | 1 | 4 | 1 | 1 | 4 | Enable |
| 2 | 4 | 2 | 4 | Enable |
| 4 | 4 | 4 | 4 | Enable |
| 8 | 4 | 8 | 4 | Disable |
| 12 | 4 | 12 | 4 | Disable |

_In some cases, though, you might have non-technical reasons to set cores per virtual socket to a value other than for example; software is sometimes licensed on a per-socket basis, making it advantageous to have multiple cores per virtual socket. _

_If you do choose to configure more than one core per virtual socket, consider the following factors: _

- For wide VMs, be very careful about setting cores per virtual socket to a value other than the default (1 core per socket). It's best to first try the default to determine what vNUMA size ESXi selects for your VM in your environment. After you know the vNUMA size, use it to choose a value for cores per virtual socket. _
_ **Example:** _ _When you run a 16-vCPU VM on a host system with 10 cores per physical socket, ESXi selects a vNUMA size of 8. After you know this vNUMA size, you would configure this VM to have 8 cores per virtual socket._

_For non-wide VMs, the number of cores per virtual socket is not as critical as for wide VMs. On rare occasions, however, configuring cores per virtual socket to a value other than 1 could influence guest CPU scheduling in either helpful or harmful ways. Therefore, we recommend careful testing before changing this configuration_

- _For non-wide VMs, the number of cores per virtual socket is not as critical as for wide VMs. On rare occasions, however, configuring cores per virtual socket to a value other than 1 could influence guest CPU scheduling in either helpful or harmful ways. Therefore, we recommend careful testing before changing this configuration. _

### CPU scheduling

The aim of this section is to give you a better holistic understanding of NUMA and CPU scheduling. Most of the information is directly sources and referred to from, The CPU Scheduler in VMware vSphere&reg; 5.1 Performance Study Technical Whitepaper.

#### Proportional share-based algorithm

ESXi uses the proportional share-based algorithm for CPU scheduling. The algorithm allocates CPU resources to worlds based on their resource specifications (shares, reservations, and limits).

**Quote:**"A world may not fully consume the entitled amount of CPU due to CPU contention. When making scheduling decisions, the ratio of the consumed CPU resources to the entitlement is used as the priority of the world. If there is a world that has consumed less than its entitlement, the world is considered high priority and will likely be chosen to run next. It is crucial to accurately account for how much CPU time each world has used. Accounting for CPU time is also called charging.

One way to understand prioritizing by the CPU scheduler is to compare it to the CPU scheduling that occurs in UNIX. The key difference between CPU scheduling in UNIX and ESXi involves how a priority is determined. In UNIX, a priority is arbitrarily chosen by the user. If one process is considered more important than others, it is given higher priority. Between two priorities, it is the relative order that matters, not the degree of the difference.

In ESXi, a priority is dynamically re-evaluated based on the consumption and the entitlement. The user controls the entitlement, but the consumption depends on many factors including scheduling, workload behavior, and system load. Also, the degree of the difference between two entitlements dictates how much CPU time should be allocated."**[1]**

**Quote:**"The capability of allocating compute resources proportionally and hierarchically in an encapsulated way is quite useful. For example, consider a case where an administrator in a company datacenter wants to divide compute resources among various departments and to let each department distribute the resources according to its own preferences. This is not easily achievable with a fixed priority-based scheme."**[1]**

#### Strict co-scheduling

Strict co-scheduling was deprecated in ESX 3._x_. It has been superseded by relaxed co-scheduling.

#### Relaxed co-scheduling

**Quote:**"Co-scheduling executes a set of threads or processes at the same time to achieve high performance. Because multiple cooperating threads or processes frequently synchronize with each other, not executing them concurrently would only increase the latency of synchronization.

Prior to vSphere 4, a guest used to be considered making progress if a vCPU was either in the RUN or IDLE state. This included the time the guest spent in the hypervisor. However, enforcing synchronous progress including the hypervisor layer is too restrictive. This is because the correctness aspect of co-scheduling only matters in terms of guest-level progress. Also, the time spent in the hypervisor might not be uniform across vCPUs, which unnecessarily increases the measured skew. Since vSphere 4, a virtual machine is considered to make progress if it consumes CPU in the guest level or halts as the IDLE state and the time spent in the hypervisor is excluded from the progress.

Note that tracking the slowest sibling vCPU still needs coordination among sibling vCPUs. To support multiprocessor virtual machines as wide as 64-vCPUs, there have been a few improvements in vSphere 5.x including scalable locking and optimized progress monitoring.

With relaxed co-scheduling, ESXi achieves high CPU utilization by flexibly scheduling the vCPUs of multiprocessor virtual machines in a consolidated environment. To achieve the best performance for a given situation, ESXi tries to schedule as many sibling vCPUs together as possible. If there are enough available pCPUs, relaxed co-scheduling performs as well as strict co-scheduling." **[1]**

#### Hyper-Threading

**Quote:** On an HT system, a physical processor typically has two logical processors (pCPUs) that share many parts of the processor pipeline. When both pCPUs on the same physical processor are busy, each gets only a fraction of the full capacity of the underlying physical processor. The CPU scheduler tends to choose a pCPU with low CPU utilization not just on the pCPU itself but also on neighbouring pCPUs that share the compute and memory resources. If the neighbouring pCPUs share more resources with the destination pCPU, the CPU load on them is factored more. This policy maximizes resource utilization on the system. **[1]**

To better visualize how CPU scheduling works with virtual CPU's and physical CPU's, I have the diagram below to illustrate the abstraction lays with hyper-threading.

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA8.png" width="450" height="" alt=""  />

# Overcommitting CPU resources

Rackspace recommends overcommitting CPU resources by no more than 3:1. This recommendation does not specify whether the overcommit is per VM or an aggregate level per host or cluster. Customer workload and utilization can influence how resources perform. When you are distributing resources in a solution, there is no absolute correct answer; we recommend that you give your VM only as many vCPUs as you have pCPU cores. You may have a number of VMs consuming CPU resources and the aggregate total gives you an overcommit ratio of 3:1.

VMware have some recommendations, which they have summarized in two sections. Listed below are the recommendations from VMware.**[5]**

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA9.png" width="550" height="" border="2" alt=""  />

<img src="http://16909682886ee5c2b59a-fffceaebb8c6ee053c935e8915a3fbe7.r35.cf2.rackcdn.com/NUMA10.png" width="550" height="" border="2" alt=""  />

            **[5]**

**Example:** If you have dual hex core (2 X 6 core) CPUs on your hypervisor, then do not present more than 6 CPUs per VM. For the same configuration that has 24 GB of RAM total, do not allocate more than 12 GB of RAM maximum for any single VM.  It is a best practice to present the minimum amount of resources required to get your application running optimally; do not assign more resources than necessary because it can impact performance.



### Additional Reading

1.  [https://pubs.vmware.com/vsphere-51/index.jsp?topic=%2Fcom.vmware.vsphere.resmgmt.doc%2FGUID-BD4A462D-5CDC-4483-968B-1DCF103C4208.html](https://pubs.vmware.com/vsphere-51/index.jsp?topic=%2Fcom.vmware.vsphere.resmgmt.doc%2FGUID-BD4A462D-5CDC-4483-968B-1DCF103C4208.html)
2.  [http://blogs.vmware.com/vsphere/2013/10/does-corespersocket-affect-performance.html](http://blogs.vmware.com/vsphere/2013/10/does-corespersocket-affect-performance.html)
3.  [http://frankdenneman.nl/2010/02/03/sizing-vms-and-numa-nodes/](http://frankdenneman.nl/2010/02/03/sizing-vms-and-numa-nodes/)
4.  [http://cs.nyu.edu/~lerner/spring10/projects/NUMA.pdf](http://cs.nyu.edu/~lerner/spring10/projects/NUMA.pdf)
5.  [https://communities.vmware.com/blogs/VirtualPharaohs/2014/09/06/many-cores-per-socket-or-single-core-socket-mystery](https://communities.vmware.com/blogs/VirtualPharaohs/2014/09/06/many-cores-per-socket-or-single-core-socket-mystery)
6.  [http://wahlnetwork.com/2013/09/30/hyper-threading-gotcha-virtual-machine-vcpu-sizing/](http://wahlnetwork.com/2013/09/30/hyper-threading-gotcha-virtual-machine-vcpu-sizing/)
7.  [http://blogs.vmware.com/vsphere/2014/02/overcommit-vcpupcpu-monster-vms.html](http://blogs.vmware.com/vsphere/2014/02/overcommit-vcpupcpu-monster-vms.html)
8.  [http://www.virtuallycloud9.com/index.php/2013/08/virtual-processor-scheduling-how-vmware-and-microsoft-hypervisors-work-at-the-cpu-level/](http://www.virtuallycloud9.com/index.php/2013/08/virtual-processor-scheduling-how-vmware-and-microsoft-hypervisors-work-at-the-cpu-level/)
9.  [https://communities.vmware.com/people/marcelo.soares/blog/2012/09/21/how-to-check-if-numa-is-enabled-on-esx-hardware](https://communities.vmware.com/people/marcelo.soares/blog/2012/09/21/how-to-check-if-numa-is-enabled-on-esx-hardware)
10.  [http://www.datacenterdan.com/blog/vsphere-55-bpperformance02-numa-alignment](http://www.datacenterdan.com/blog/vsphere-55-bpperformance02-numa-alignment)
11.  [https://technet.microsoft.com/en-us/sysinternals/cc835722.aspx](https://technet.microsoft.com/en-us/sysinternals/cc835722.aspx)
12.  [http://www.drdobbs.com/windows/the-coreinfo-20-utility/220900822](http://www.drdobbs.com/windows/the-coreinfo-20-utility/220900822)
13.  [http://blogs.vmware.com/vsphere/2015/05/vsphere-6-webcast-series.html](http://blogs.vmware.com/vsphere/2015/05/vsphere-6-webcast-series.html) (July 21 - vSphere 6 Performance)
14.  [http://blogs.vmware.com/performance/2015/07/performance-best-practices-vsphere-6-0-available.html](http://blogs.vmware.com/performance/2015/07/performance-best-practices-vsphere-6-0-available.html)



### Numbered citations

1. [https://www.vmware.com/files/pdf/techpaper/VMware-vSphere-CPU-Sched-Perf.pdf](https://www.vmware.com/files/pdf/techpaper/VMware-vSphere-CPU-Sched-Perf.pdf)
2. [https://www.vmware.com/files/pdf/vsphere/VMW-WP-vSPHR-Whats-New-6-0-PLTFRM.pdf](https://www.vmware.com/files/pdf/vsphere/VMW-WP-vSPHR-Whats-New-6-0-PLTFRM.pdf)
3. [http://frankdenneman.nl/2013/09/18/vcpu-configuration-performance-impact-between-virtual-sockets-and-virtual-cores/](http://frankdenneman.nl/2013/09/18/vcpu-configuration-performance-impact-between-virtual-sockets-and-virtual-cores/)
4. [https://blogs.vmware.com/vsphere/author/mark\_achtemichuk/page/2](https://blogs.vmware.com/vsphere/author/mark_achtemichuk/page/2)
5. [http://blogs.vmware.com/vsphere/files/2015/05/Webcast-Series-vSphere-6.0-Performance.pdf](http://blogs.vmware.com/vsphere/files/2015/05/Webcast-Series-vSphere-6.0-Performance.pdf)
