<div align="center">
  <h1>PeekSys</h1>
  <p>Cross-platform system information tool for the terminal</p>
  <p>C | Linux + Windows | CLI</p>
  <img src="assets/demo.gif" alt="PeekSys demo" width="700">
</div>

### Project Status
**Active Development.**

### Overview
PeekSys is a minimal system information utility written in C. It is designed to provide hardware and OS diagnostics with low overhead and zero bloat.

### Supported Operating Systems
* **Linux**
* **Windows**
* 
### System Metrics
PeekSys extracts and displays the following data points:
- **OS & Kernel:** Name, version, and architecture.
- **Processor:** CPU model, core count, and frequency.
- **Graphics:** GPU identification and driver details.
- **Memory:** Total and active RAM utilization.
- **Storage:** Disk partitions, mount points, and capacity.
- **Network:** Interface details and live I/O throughput.
- **Hardware:** Motherboard/BIOS info and battery telemetry.
- **Thermals:** Real-time temperature sensors for CPU and GPU.*
- **Cooling:** Fans speeds.

*Windows thermal data currently requires WMI or OpenHardwareMonitor hooks.

### Preview

None yet.
<!--
| <img src="assets/linux_output.png" width="350"> | <img src="assets/windows_output.png" width="350"> |
-->

### Installation & Build

### Requirements
- C compiler (GCC / Clang)
- Make
- **Linux:** `pciutils`, `lm-sensors`, and access to `/proc` / `/sys`.
- **Windows:** MSVC or MinGW environment.

### Compile
```bash
git clone [https://github.com/NunoAndrezo/PeekSys.git](https://github.com/NunoAndrezo/PeekSys.git)
cd PeekSys
make
```

### Usage

```bash
./peeksys [options]

Options:
  --os            Show OS information
  --cpu           Show CPU information
  --gpu           Show GPU information
  --motherboard   Show motherboard information
  --ram           Show memory information
  --disk          Show disk information
  --network       Show network and net speeds
  --temp          Show temperature info
  --display       Show display configuration
  --battery       Show battery info
  --all           Show everything
  --help          Show help
  --version       Show version info
```
Default Behavior:
Running ./peeksys with no arguments will display all system info.
