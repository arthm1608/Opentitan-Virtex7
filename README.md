# OpenTitan Virtex-7 (VC709) Hardware Port

This repository is a complete, ready-to-build fork of the [OpenTitan](https://opentitan.org/) Earlgrey System-on-Chip (SoC) architecture, modified to run natively on the **Xilinx Virtex-7 VC709 FPGA**. 

It includes the core OpenTitan filesystem along with the customized top-level SystemVerilog wrappers, FuseSoC core configurations, updated Bazel build targets, and Xilinx constraint files (XDC) necessary to bypass Virtex-7 routing congestion and successfully compile the bitstream.

## 🔗 Upstream Project Reference
This repository is a downstream fork of the official OpenTitan project. For comprehensive documentation, software development guides, and licensing, please refer to the upstream project:
* **Upstream Repository:** [lowRISC/opentitan](https://github.com/lowRISC/opentitan)
* **Documentation:** [OpenTitan Getting Started Guide](https://opentitan.org/book/doc/getting_started/)

---

## 🚀 Installation & Build Instructions

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone [https://github.com/YOUR_USERNAME/Opentitan-Virtex7.git](https://github.com/YOUR_USERNAME/Opentitan-Virtex7.git)
cd Opentitan-Virtex7
```

### 2. Install Dependencies
Before building, you must install the standard OpenTitan toolchain prerequisites (Verilator, Vivado, Bazel, RISC-V toolchain, etc.). Follow the official guide here:
[OpenTitan Setup Instructions](https://opentitan.org/book/doc/getting_started/)

### 3. Compile the Bitstream
Because all custom hardware wrappers and build targets are already integrated, you can immediately synthesize and route the design using Bazel.

*(Note: Due to the massive size of the Virtex-7 and the complexity of the OpenTitan Pinmux, Vivado Place and Route may take 30–60 minutes depending on your CPU).*

```bash
bazel build //hw/bitstream/vivado:fpga_virtex7_test_rom --action_env=XILINXD_LICENSE_FILE
```

Once finished, the compiled golden bitstream will be located at:
`bazel-out/k8-fastbuild/bin/hw/bitstream/vivado/build.fpga_virtex7/lowrisc_systems_chip_earlgrey_virtex7_0.1/synth-vivado/lowrisc_systems_chip_earlgrey_virtex7_0.1.bit`

---

## 🛠️ Architectural Notes & Virtex-7 Quirks

If you are modifying this port, be aware of the following architectural changes made to adapt the CW310 architecture to the VC709:

### Routing Congestion & Clock Promotes
The OpenTitan Pinmux and JTAG networks create massive fanouts that cause Congestion Level 6 routing failures on the Virtex-7 fabric. The `clocks_virtex7.xdc` file contains specific directives to promote the highest-congestion nets (like the JTAG TAP state and CSB buffers) directly to the Global Clock (BUFG) routing network to bypass the logic grid.

### Ghost Clocks & SPI Host
The default ChipWhisperer 310 implementation utilizes a dedicated SPI Host for external peripherals. If left unmapped on the VC709, Vivado's optimizer aggressively deletes the internal clock gating logic for this domain, causing a fatal crash during constraint application. The `clocks_virtex7.xdc` file safely comments out these ghost clocks.

### JTAG & Tri-State Tie-Offs
To maintain compatibility with the upstream automated `padring` generators, the top-level ports `IO_CLKOUT` and `IO_TRIGGER` (used strictly for side-channel analysis on the CW310) remain in the top-level `.sv` module.

To satisfy Vivado's DRC checks without causing electrical contention, their Output Enables are tied to `0` (High-Z) internally, and they are mapped to physical DIP switches (`AV30` and `AY33`) in the `pins_virtex7.xdc` file. They safely act as benign, unconnected inputs.

---

## 💻 Booting Software

Because OpenTitan is a bare-metal RISC-V environment, the internal C architecture remains identical regardless of the FPGA board. You can use the standard ChipWhisperer 310 software targets to build and flash payloads for this Virtex-7 port.

**Compile Hello World:**
```bash
bazel build //sw/device/examples/hello_world:hello_world_fpga_cw310
```

**Flash to the VC709 via opentitantool:**
```bash
opentitantool --conf cw310 bootstrap bazel-out/k8-fastbuild/bin/sw/device/examples/hello_world/hello_world_fpga_cw310.bin
```
