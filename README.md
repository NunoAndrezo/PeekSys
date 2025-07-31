<div align="center">
  <h1>📡 PeekSys</h1>
  <p><strong>Cross-platform system information tool for the terminal.</strong></p>
  <p>Linux + Windows | C | CLI-based</p>

<img src="assets/demo.gif" alt="PeekSys demo" width="700">
</div>

---
> **🚧 Work in Progress**  
> This project is currently under development. Some features may be incomplete or subject to change.

---
## 📦 What is PeekSys?

**PeekSys** is a lightweight, cross-platform command-line utility written in **C** that displays detailed system information, including:

- OS name and version
- CPU specs
- GPU details
- Motherboard info
- RAM usage
- Disk sizes and partitions
- Network interfaces and live upload/download stats
- Temperatures (CPU, GPU, etc.)
- Display configuration
- Battery status (if present)

It’s fast, dependency-minimal, and modular — making it perfect for diagnostics, custom dashboards, or simply peeking under the hood.

---

## ⚙️ Supported Platforms

| Feature           | Linux ✅ | Windows ✅ |
|------------------|----------|------------|
| OS Info          | ✅       | ✅         |
| CPU Info         | ✅       | ✅         |
| GPU Info         | ✅       | ✅         |
| RAM              | ✅       | ✅         |
| Storage          | ✅       | ✅         |
| Temperatures     | ✅       | ✅         |
| Motherboard Info | ✅       | ✅         |
| Network Info     | ✅       | ✅         |
| Net Speed        | ✅       | ✅         |
| Display Info     | ✅       | ✅         |
| Battery          | ✅       | ✅         |

> **Note:** Windows support for temps and hardware info may require WMI access or 3rd-party tools like OpenHardwareMonitor.

---

## 🖥️ Preview (in the making)

| Linux Terminal Output | Windows Terminal Output |
|-----------------------|--------------------------|
| ![](assets/linux_output.png) | ![](assets/windows_output.png) |

---

## 🚀 Usage

### 📦 Build

> Requires a C compiler (`gcc` or `clang`) and `make`.

```bash
git clone https://github.com/NunoAndrezo/PeekSys.git
cd PeekSys
make

🧪 Run
./peeksys [options]

🔧 Options
--os           Show OS information
--cpu          Show CPU information
--gpu          Show GPU information
--motherboard  Show motherboard information
--ram          Show memory information
--disk         Show disk information
--network      Show network and net speeds
--temp         Show temperature info
--display      Show display configuration
--battery      Show battery info
--all, --complete Show everything
--help         Show help
--version      Show version info

🧠 Default Behavior
Running ./peeksys with no arguments will display all system info.

📁 Project Structure
PeekSys/
├── src/
│   ├── cpu/
│   ├── gpu/
│   ├── os/
│   ├── ...
├── include/
│   └── *.h
├── assets/
│   └── demo.gif, screenshots...
├── obj/
├── peeksys
├── Makefile
└── README.md

📦 Dependencies

    Linux:
        lscpu, lspci, xrandr, sensors, /proc
    Windows:
        WMI (via wmic, or Win32_* API)
        Optionally: OpenHardwareMonitor for temps

🤝 Contributing
Want to improve or add features? Open an issue, fork the repo, and submit a PR!

🧑‍💻 Author
Made by @NunoAndrezo
