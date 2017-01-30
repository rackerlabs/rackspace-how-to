---
permalink: numa-vnuma-and-cpu-scheduling/
audit_date: '2016-07-06'
title: 'NUMA, VNUMA and CPU Scheduling'
type: article
created_date: '2016-01-18'
created_by: Rackspace Support
last_modified_date: '2016-07-05'
last_modified_by: Nate Archer
product: Managed VMware Services
product_url: managed-vmware-services
---

### What is NUMA?

NUMA stands for Non-Uniform Memory Access, but what exactly is NUMA? In a NUMA architecture, each CPU is assigned its own local memory, and the CPU and memory combined form a NUMA node.

     **Local MEM + CPU CORES = NUMA Node**

The following diagram illustrates the difference between systems that are NUMA aware and systems that are not NUMA aware.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA1.png %}" width="600" height="" alt=""  />

NUMA is important because it enables a processor to access its own local memory faster than non-local memory, such as memory local to another processor or memory shared between processors. However, if the locality of memory access is not taken into consideration, NUMA can cause latency problems for applications.

### What is vNUMA?

vNUMA removes the transparency between the VM and the OS and presents the NUMA architecture directly to the VM's operating system. It worth mentioning that vNUMA also known as wide NUMA in the industry. For a wide VM, the underlying architecture where the VM runs, the NUMA topology of the VM spans across multiple NUMA nodes. After the initial power-up of a vNUMA-enabled VM, the architecture presented to the OS is permanently defined and cannot be altered. This restriction is generally positive because changing the vNUMA architecture could cause instabilities in the OS, but it could cause performance problems if the VM is migrated via vMotion to a hypervisor with a different NUMA architecture. It is worth mentioning that although most applications can take advantage of vNUMA, the majority of VMs are small enough to fit into a NUMA node; recent optimization on wide-VM support or vNUMA does not affect them.

Therefore, how the guest OS or its applications place processes and memory can significantly affect performance. The benefit of exposing NUMA topology to the VM can be significant by allowing the guest to make the optimal decision considering underlying NUMA architecture. By assuming that the guest OS will make the optimal decision given the exposed vNUMA topology, instead of interleaving memory among NUMA clients.

**Note:** vNUMA is a vSphere 5. improvement and was not a feature of vSphere 4. Hot-add RAM is now vNuma aware in vSphere 6.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA2.png %}" width="400" height="" alt=""  />

### Why does NUMA matter?

Any abstraction has a performance cost. For a NUMA system, the performance cost is that the latency of a remote memory operation (accessing memory from a different NUMA node) is more expensive than the latency of a local memory operation. When you consider a multi-threaded application, it is worth considering NUMA and locality because latencies could affect the performance of an application.

### Assigning of sockets and cores

The effect of assigning virtual cores per socket and the impact it has on performance is controversial. Following are two contradictory statements from two recognized industry experts.

**Quote by Frank Denneman** : "Using virtual sockets or virtual cores does not impact the performance of the virtual machine."**[1]**

**Quote by Mark Achtemichuk** : "It's often been said that this change of processor presentation does not affect performance, but it may impact performance by influencing the sizing and presentation of virtual NUMA to the guest operating system."**[2]**

So, does assigning sockets and cores affect performance? The reason VMware introduced the advanced settings for cores-per-socket was to address licensing issues with some operating systems. Based on this information alone, you might assume that changing the cores or sockets should not make any performance impact to a VM. This is not true if you follow the results of Mark Achtemichuk, who found during testing that the number of NUMA nodes changes depending on the number of cores or sockets used, which directly impacts performance.

### Performance considerations

When you are assigning virtual sockets, cores per socket, and vNUMA, you might create vNUMA nodes that violate the underlying physical NUMA, which can directly impact performance. You can use the ESXTOP tool to see the number of NUMA nodes a physical host has,which can help determine how many virtual sockets and cores per socket you might want to select for wide VMs. Typically, for best performance, set the sockets to the number of vCPUs needed, and set the cores per socket to 1.  That will let the underlying hardware determine the vNUMA nodes properly.

### NUMA alignment best practices

The following are recommendations for NUMA alignment:

- Know your NUMA size. Especially consider it when buying new servers. You might need to increase your core count or RAM size to accommodate your workloads.
- CPU. If you have newer hardware, you will have fewer issues with NUMA boundaries. If you have older hardware, especially dual-socket, dual-core HT systems, you will need to be more aware because many VMs have four or more vCPUs.
- RAM. If you have many, smaller servers, you will likewise have more issues with NUMA boundaries because of the increased amount of RAM being required by applications.
- Size your VMs, wherever possible, around even multiples of the NUMA node. For example, on a hex-core (6C) system, use to 2, 3, or 6 cores.
- If you enable Hyper-Threading, enable ESXi or the VM, or both, to be able to use it towards the NUMA core count. Also tell the VM to keep multiple virtual cores together (see below).

### Check NUMA topology

#### ESX host, using ESXTOP

1. Run `ESXTOP`.

2. To enter on memory statistics, enter `m`.

3. To change the fields that are displayed, enter `f`.

4. To show NUMA-related fields, enter `g` again.

If NUMA is enabled, you will see values (like 0, 1, or 2 for each node) on the NHN column:

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA4.png %}" width="600" height="" alt=""  />

The useful aspect of the NUMA statistics in ESXTOP for troubleshooting is the locality information:

- NRMEM: Amount of memory running in a remote memory node.
- NLMEM: Amount of memory running in the local memory node.
- N%L: Percentage of memory running locally. The lower this number, the larger the risk that NUMA locality is causing a performance problem.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA5.png %}" width="650" height="" alt=""  />

#### Windows

Coreinfo is a Windows Sysinternals tool that you can use to view the NUMA topology on Windows.

    Run coreinfo -n.

In the following example, the VM has a single NUMA node.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA6.png %}" width="600" height="" alt=""  />

#### Linux

Numactl is a Linux tool that you can use to view NUMA topology on Linux.

    numactl -- hardware

    numactl -- show


### NUMA considerations

As you think about NUMA alignment, consider the following points:

- Enabling CPU hot plug will disable vNUMA (where the underlying NUMA architecture is exposed directly to the guest OS) - [VMware KB 2040375](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2040375)
- Just because your NUMA node size is 16 CPUs and 128 GB of RAM, that doesn't mean you should create a large VM. Right-size your VMs to avoid unnecessary kernel NUMA scheduling.

### Rackspace recommendations for NUMA

The `Hot add` option must be disabled on VMs with more than 8 vCPU's to take advantage of vNUMA.

When you create a VM, you have the option to specify the number of virtual sockets and the number of cores per virtual socket. In general, we recommend leaving this at the default value of 1__core per socket (with the number of virtual sockets therefore equal to the number of vCPUs).

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

In some cases, though, you might have non-technical reasons to set cores per virtual socket to a value other than for example; software is sometimes licensed on a per-socket basis, making it advantageous to have multiple cores per virtual socket.

If you do choose to configure more than one core per virtual socket, consider the following factors:

- For wide VMs, be very careful about setting cores per virtual socket to a value other than the default (1 core per socket). It's best to first try the default to determine what vNUMA size ESXi selects for your VM in your environment. After you know the vNUMA size, use it to choose a value for cores per virtual socket.
  **Example:** When you run a 16-vCPU VM on a host system with 10 cores per physical socket, ESXi selects a vNUMA size of 8. After you know this vNUMA size, you would configure this VM to have 8 cores per virtual socket.

For non-wide VMs, the number of cores per virtual socket is not as critical as for wide VMs. On rare occasions, however, configuring cores per virtual socket to a value other than 1 could influence guest CPU scheduling in either helpful or harmful ways. Therefore, we recommend careful testing before changing this configuration.

### CPU scheduling

The aim of this section is to give you a better holistic understanding of NUMA and CPU scheduling.

#### Proportional share-based algorithm

ESXi uses the proportional share-based algorithm for CPU scheduling. The algorithm allocates CPU resources to worlds based on their resource specifications (shares, reservations, and limits).

One way to understand prioritizing by the CPU scheduler is to compare it to the CPU scheduling that occurs in UNIX. The key difference between CPU scheduling in UNIX and ESXi involves how a priority is determined. In UNIX, a priority is arbitrarily chosen by the user. If one process is considered more important than others, it is given higher priority. Between two priorities, it is the relative order that matters, not the degree of the difference.

In ESXi, a priority is dynamically re-evaluated based on the consumption and the entitlement. The user controls the entitlement, but the consumption depends on many factors including scheduling, workload behavior, and system load. Also, the degree of the difference between two entitlements dictates how much CPU time should be allocated.

#### Strict co-scheduling

Strict co-scheduling was deprecated in ESX 3._x_. It has been superseded by relaxed co-scheduling.

#### Relaxed co-scheduling

Prior to vSphere 4, a guest used to be considered making progress if a vCPU was either in the RUN or IDLE state. This included the time the guest spent in the hypervisor. However, enforcing synchronous progress including the hypervisor layer is too restrictive. This is because the correctness aspect of co-scheduling only matters in terms of guest-level progress. Also, the time spent in the hypervisor might not be uniform across vCPUs, which unnecessarily increases the measured skew. Since vSphere 4, a virtual machine is considered to make progress if it consumes CPU in the guest level or halts as the IDLE state and the time spent in the hypervisor is excluded from the progress.

Note that tracking the slowest sibling vCPU still needs coordination among sibling vCPUs. To support multiprocessor virtual machines as wide as 64-vCPUs, there have been a few improvements in vSphere 5.x including scalable locking and optimized progress monitoring.

With relaxed co-scheduling, ESXi achieves high CPU utilization by flexibly scheduling the vCPUs of multiprocessor virtual machines in a consolidated environment. To achieve the best performance for a given situation, ESXi tries to schedule as many sibling vCPUs together as possible. If there are enough available pCPUs, relaxed co-scheduling performs as well as strict co-scheduling.

#### Hyper-Threading

To better visualize how CPU scheduling works with virtual CPU's and physical CPU's, I have the diagram below to illustrate the abstraction lays with hyper-threading.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA8.png %}" width="450" height="" alt=""  />

### Overcommitting CPU resources

Rackspace recommends overcommitting CPU resources by no more than 3:1. This recommendation does not specify whether the overcommit is per VM or an aggregate level per host or cluster. Customer workload and utilization can influence how resources perform. When you are distributing resources in a solution, there is no absolute correct answer; we recommend that you give your VM only as many vCPUs as you have pCPU cores. You may have a number of VMs consuming CPU resources and the aggregate total gives you an overcommit ratio of 3:1.

VMware has some recommendations, which they have summarized in two sections. Listed below are the recommendations from VMware.

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA9.png %}" width="550" height="" border="2" alt=""  />

<img src="{% asset_path managed-vmware-services/numa-vnuma-and-cpu-scheduling/NUMA10.png %}" width="550" height="" border="2" alt=""  />

**Example:** If you have dual hex core (2 X 6 core) CPUs on your hypervisor, then do not present more than 6 CPUs per VM. For the same configuration that has 24 GB of RAM total, do not allocate more than 12 GB of RAM maximum for any single VM.  It is a best practice to present the minimum amount of resources required to get your application running optimally; do not assign more resources than necessary because it can impact performance.

### Numbered citations

1. [http://frankdenneman.nl/2013/09/18/vcpu-configuration-performance-impact-between-virtual-sockets-and-virtual-cores/](http://frankdenneman.nl/2013/09/18/vcpu-configuration-performance-impact-between-virtual-sockets-and-virtual-cores/)
2. [https://blogs.vmware.com/vsphere/author/mark\_achtemichuk/page/2](https://blogs.vmware.com/vsphere/author/mark_achtemichuk/page/2)
