## ---------------------------------------------------------
## Virtex-7 XC7VX690T Pins (VC709) - OpenTitan Constraints
## ---------------------------------------------------------

## System Clocks
set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVDS } [get_ports { IO_CLK_P }]
set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVDS } [get_ports { IO_CLK_N }]

## Reset Buttons
set_property -dict { PACKAGE_PIN AV35 IOSTANDARD LVCMOS18 } [get_ports { POR_BUTTON_N }]
set_property -dict { PACKAGE_PIN AW40 IOSTANDARD LVCMOS18 PULLTYPE PULLUP } [get_ports { POR_N }]

## UART0 (For Console Output)
set_property -dict { PACKAGE_PIN AU36 IOSTANDARD LVCMOS18 } [get_ports { IOC3 }]
set_property -dict { PACKAGE_PIN AU33 IOSTANDARD LVCMOS18 } [get_ports { IOC4 }]

## ---------------------------------------------------------
## Configuration Options
## ---------------------------------------------------------
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

## CLOCK ROUTING OVERRIDES
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets u_ast/u_ast_clks_byp/u_no_scan_clk_src_io_d1ord2/u_clk_div_buf/clk_i]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clkgen/clk_aon_o]
set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets top_earlgrey/u_clkmgr_aon/u_main_root_ctrl/u_cg/i_cg/gen_gate.gen_bufgce.u_bufgce_0]

## ---------------------------------------------------------
## PHYSICAL EXTERNAL PIN MAPPING (MASTER 74-PIN ROUTING)
## ---------------------------------------------------------

## The New SPI Host (External PROM)
set_property -dict {PACKAGE_PIN AW25 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_CLK]
set_property -dict {PACKAGE_PIN AW26 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_CS_L]
set_property -dict {PACKAGE_PIN AV25 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_D0]
set_property -dict {PACKAGE_PIN AV26 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_D1]
set_property -dict {PACKAGE_PIN AU26 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_D2]
set_property -dict {PACKAGE_PIN AU27 IOSTANDARD LVCMOS18} [get_ports SPI_HOST_D3]

## SPI Device / JTAG
set_property -dict {PACKAGE_PIN AH34 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_CLK]
set_property -dict {PACKAGE_PIN AG32 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_CS_L]
set_property -dict {PACKAGE_PIN AG33 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_D0]
set_property -dict {PACKAGE_PIN AV18 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_D1]
set_property -dict {PACKAGE_PIN AF34 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_D2]
set_property -dict {PACKAGE_PIN AE32 IOSTANDARD LVCMOS18} [get_ports SPI_DEV_D3]

## USB Interface
set_property -dict {PACKAGE_PIN AT17 IOSTANDARD LVCMOS18} [get_ports IO_USB_CONNECT]
set_property -dict {PACKAGE_PIN AR35 IOSTANDARD LVCMOS18} [get_ports IO_USB_D_RX]
set_property -dict {PACKAGE_PIN AT35 IOSTANDARD LVCMOS18} [get_ports IO_USB_DN_RX]
set_property -dict {PACKAGE_PIN AM34 IOSTANDARD LVCMOS18} [get_ports IO_USB_DN_TX]
set_property -dict {PACKAGE_PIN AN34 IOSTANDARD LVCMOS18} [get_ports IO_USB_DP_RX]
set_property -dict {PACKAGE_PIN AL34 IOSTANDARD LVCMOS18} [get_ports IO_USB_DP_TX]
set_property -dict {PACKAGE_PIN AL35 IOSTANDARD LVCMOS18} [get_ports IO_USB_OE_N]
set_property -dict {PACKAGE_PIN AJ32 IOSTANDARD LVCMOS18} [get_ports IO_USB_SPEED]
set_property -dict {PACKAGE_PIN AK32 IOSTANDARD LVCMOS18} [get_ports IO_USB_SUSPEND]

## General Purpose MIOs (Bank A & B)
set_property -dict {PACKAGE_PIN AP26 IOSTANDARD LVCMOS18} [get_ports IOA0]
set_property -dict {PACKAGE_PIN AJ26 IOSTANDARD LVCMOS18} [get_ports IOA1]
set_property -dict {PACKAGE_PIN AJ25 IOSTANDARD LVCMOS18} [get_ports IOA2]
set_property -dict {PACKAGE_PIN AL26 IOSTANDARD LVCMOS18} [get_ports IOA3]
set_property -dict {PACKAGE_PIN AL25 IOSTANDARD LVCMOS18} [get_ports IOA4]
set_property -dict {PACKAGE_PIN AK25 IOSTANDARD LVCMOS18} [get_ports IOA5]
set_property -dict {PACKAGE_PIN AK24 IOSTANDARD LVCMOS18} [get_ports IOA6]
set_property -dict {PACKAGE_PIN AM27 IOSTANDARD LVCMOS18} [get_ports IOA7]
set_property -dict {PACKAGE_PIN AM26 IOSTANDARD LVCMOS18} [get_ports IOA8]
set_property -dict {PACKAGE_PIN AL27 IOSTANDARD LVCMOS18} [get_ports IOB0]
set_property -dict {PACKAGE_PIN AK27 IOSTANDARD LVCMOS18} [get_ports IOB1]
set_property -dict {PACKAGE_PIN AN25 IOSTANDARD LVCMOS18} [get_ports IOB2]
set_property -dict {PACKAGE_PIN AR25 IOSTANDARD LVCMOS18} [get_ports IOB3]
set_property -dict {PACKAGE_PIN AP25 IOSTANDARD LVCMOS18} [get_ports IOB4]
set_property -dict {PACKAGE_PIN AT26 IOSTANDARD LVCMOS18} [get_ports IOB5]
set_property -dict {PACKAGE_PIN AT25 IOSTANDARD LVCMOS18} [get_ports IOB6]
set_property -dict {PACKAGE_PIN AP28 IOSTANDARD LVCMOS18} [get_ports IOB7]
set_property -dict {PACKAGE_PIN AN28 IOSTANDARD LVCMOS18} [get_ports IOB8]
set_property -dict {PACKAGE_PIN AR28 IOSTANDARD LVCMOS18} [get_ports IOB9]
set_property -dict {PACKAGE_PIN AM29 IOSTANDARD LVCMOS18} [get_ports IOB10]
set_property -dict {PACKAGE_PIN AM28 IOSTANDARD LVCMOS18} [get_ports IOB11]
set_property -dict {PACKAGE_PIN AN26 IOSTANDARD LVCMOS18} [get_ports IOB12]

## General Purpose MIOs (Bank C & R)
set_property -dict {PACKAGE_PIN AP27 IOSTANDARD LVCMOS18} [get_ports IOC0]
set_property -dict {PACKAGE_PIN AT27 IOSTANDARD LVCMOS18} [get_ports IOC1]
set_property -dict {PACKAGE_PIN AV28 IOSTANDARD LVCMOS18} [get_ports IOC2]
set_property -dict {PACKAGE_PIN AU28 IOSTANDARD LVCMOS18} [get_ports IOC5]
set_property -dict {PACKAGE_PIN AW28 IOSTANDARD LVCMOS18} [get_ports IOC6]
set_property -dict {PACKAGE_PIN AW27 IOSTANDARD LVCMOS18} [get_ports IOC7]
set_property -dict {PACKAGE_PIN AM39 IOSTANDARD LVCMOS18} [get_ports IOC8]
set_property -dict {PACKAGE_PIN AN39 IOSTANDARD LVCMOS18} [get_ports IOC9]
set_property -dict {PACKAGE_PIN AR27 IOSTANDARD LVCMOS18} [get_ports IOC10]
set_property -dict {PACKAGE_PIN AR37 IOSTANDARD LVCMOS18} [get_ports IOC11]
set_property -dict {PACKAGE_PIN AT37 IOSTANDARD LVCMOS18} [get_ports IOC12]
set_property -dict {PACKAGE_PIN AK34 IOSTANDARD LVCMOS18} [get_ports IOR0]
set_property -dict {PACKAGE_PIN AU17 IOSTANDARD LVCMOS18} [get_ports IOR1]
set_property -dict {PACKAGE_PIN AJ33 IOSTANDARD LVCMOS18} [get_ports IOR2]
set_property -dict {PACKAGE_PIN AU18 IOSTANDARD LVCMOS18} [get_ports IOR3]
set_property -dict {PACKAGE_PIN AH33 IOSTANDARD LVCMOS18} [get_ports IOR4]
set_property -dict {PACKAGE_PIN BA29 IOSTANDARD LVCMOS18} [get_ports IOR5]
set_property -dict {PACKAGE_PIN AY29 IOSTANDARD LVCMOS18} [get_ports IOR6]
set_property -dict {PACKAGE_PIN BB27 IOSTANDARD LVCMOS18} [get_ports IOR7]
set_property -dict {PACKAGE_PIN BB26 IOSTANDARD LVCMOS18} [get_ports IOR8]
set_property -dict {PACKAGE_PIN BB29 IOSTANDARD LVCMOS18} [get_ports IOR9]
set_property -dict {PACKAGE_PIN AT29 IOSTANDARD LVCMOS18} [get_ports IOR10]
set_property -dict {PACKAGE_PIN AR29 IOSTANDARD LVCMOS18} [get_ports IOR11]
set_property -dict {PACKAGE_PIN AP41 IOSTANDARD LVCMOS18} [get_ports IOR12]
set_property -dict {PACKAGE_PIN AU39 IOSTANDARD LVCMOS18} [get_ports IOR13]

## Tie-offs for unused ChipWhisperer ports (Mapped to VC709 DIP Switches)
set_property -dict { PACKAGE_PIN AV30 IOSTANDARD LVCMOS18 } [get_ports { IO_CLKOUT }]
set_property -dict { PACKAGE_PIN AY33 IOSTANDARD LVCMOS18 } [get_ports { IO_TRIGGER }]
