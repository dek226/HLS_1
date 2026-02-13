set_property IOSTANDARD LVCMOS33 [get_ports *]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_ports ap_clk_IBUF]
#set_property DONT_TOUCH true [get_ports ap_clk]
# CW305 clock and reset
create_clock -period 20.000 -name pll_clk1 -waveform {0.000 10.000} [get_ports ap_clk]
#create_clock -period 20.000 -name tio_clkin -waveform {0.000 10.000} [get_nets tio_clkin]
#create_clock -period 20.000 -name swclk -waveform {0.000 10.000} [get_nets swclk]
#create_clock -period 10.000 -name usb_clk -waveform {0.000 5.000} [get_nets USB_clk]

#set_case_analysis 0 [get_pins U_clk_select/U_clk_sel1/S]
#set_case_analysis 1 [get_pins U_clk_select/U_clk_sel2/S]


# DUT input clock from PLL_CLK1:
#set_property PACKAGE_PIN N13 [get_ports ap_clk] 
# Set the package pin for the clock input (e.g., pll_clk1 on pin N13)
# Pin Assignment and I/O Standard
set_property PACKAGE_PIN N13 [get_ports ap_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ap_clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ap_clk_IBUF]
# Clock Definition for 10 MHz (100 ns period)
#create_clock -period 100.000 -name pll_clk1 [get_ports ap_clk]

#set_property -dict { PACKAGE_PIN N13   IOSTANDARD LVCMOS33 } [get_ports ap_clk]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports ap_clk]
#set_property PACKAGE_PIN N14 [get_ports tio_clkin]

# output clock to CW lite so it can use it for sampling: HS1 on 20-pin
#set_property PACKAGE_PIN M16 [get_ports ext_clock]

# SW4 button on board:
#set_property PACKAGE_PIN R1 [get_ports ap_rst];
#set_property IOSTANDARD LVCMOS33 [get_ports ap_rst]
# JTAG:
#set_property PULLUP true [get_ports nTRST]
#set_property PULLDOWN true [get_ports TDI]

####### USB Connector
#set_property PACKAGE_PIN F5 [get_ports USB_clk]

#set_property PACKAGE_PIN A7 [get_ports {ap_rst}]
#set_property PACKAGE_PIN B6 [get_ports {p_9[1]}]
#set_property PACKAGE_PIN D3 [get_ports {p_9[2]}]
#set_property PACKAGE_PIN E3 [get_ports {p_9[3]}]
#set_property PACKAGE_PIN F3 [get_ports {p_9[4]}]
#set_property PACKAGE_PIN B5 [get_ports {p_9[5]}]
#set_property PACKAGE_PIN K1 [get_ports {p_9[6]}]
#set_property PACKAGE_PIN K2 [get_ports {p_9[7]}]

#set_property PACKAGE_PIN F4 [get_ports {p_9[8]}]
#set_property PACKAGE_PIN G5 [get_ports {p_9[9]}]
#set_property PACKAGE_PIN J1 [get_ports {p_9[10]}]
#set_property PACKAGE_PIN H1 [get_ports {p_9[11]}]
#set_property PACKAGE_PIN H2 [get_ports {p_9[12]}]
#set_property PACKAGE_PIN G1 [get_ports {p_9[13]}]
#set_property PACKAGE_PIN G2 [get_ports {p_9[14]}]
#set_property PACKAGE_PIN F2 [get_ports {p_9[15]}]
#set_property PACKAGE_PIN E1 [get_ports {p_9[16]}]
#set_property PACKAGE_PIN E2 [get_ports {p_9[17]}]
#set_property PACKAGE_PIN D1 [get_ports {p_9[18]}]
#set_property PACKAGE_PIN C1 [get_ports {p_9[19]}]
#set_property PACKAGE_PIN K3 [get_ports {p_9[20]}]
#set_property PACKAGE_PIN L2 [get_ports {p_9[21]}]
#set_property PACKAGE_PIN J3 [get_ports {p_9[22]}]
#set_property PACKAGE_PIN B2 [get_ports {p_9[23]}]
#set_property PACKAGE_PIN C7 [get_ports {p_9[24]}]
#set_property PACKAGE_PIN C6 [get_ports {p_9[25]}]
#set_property PACKAGE_PIN D6 [get_ports {p_9[26]}]
#set_property PACKAGE_PIN C4 [get_ports {p_9[27]}]
#set_property PACKAGE_PIN D5 [get_ports {p_9[28]}]

#set_property PACKAGE_PIN A4 [get_ports {p_9[29]}]
#set_property PACKAGE_PIN C2 [get_ports {p_9[30]}]
#set_property PACKAGE_PIN A3 [get_ports {p_9[31]}]
#set_property PACKAGE_PIN A2 [get_ports {p_5_address0[3]}]

#set_input_delay -clock usb_clk 2.0 [get_ports USB_nCS]
#set_input_delay -clock usb_clk 2.0 [get_ports USB_nRD]
#set_input_delay -clock usb_clk 2.0 [get_ports USB_nWE]
#set_input_delay -clock usb_clk 2.0 [get_ports USB_Data]
#set_input_delay -clock usb_clk 2.0 [get_ports USB_Addr]

# read data will be grabbed one cycle later so no need to constrain:
#set_output_delay -clock usb_clk 0.0 [get_ports USB_Data]
#set_false_path -to [get_ports USB_Data]


# Master clock frequencies derived from clock wizard

# Rename main clock for clarity:
#create_generated_clock -name cpu_clk  [get_pins {U_clk_select/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0} ]
# virtual clock:
#create_clock -period 100.000 -name slow_out_clk

# UART has no timing requirements:
#set untimed_od 0.5
#set untimed_id 0.5
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports uart_rxd]
#set_output_delay -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports uart_txd]

# Reset
#set_input_delay  -clock [get_clocks cpu_clk] -add_delay $untimed_id [get_ports reset*]

# *****************************************************************************

# UART and trigger on 20-pin connector:
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { uart_txd}]; # IO1
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { uart_rxd}]; # IO2
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { trig_out }]; # IO4

# LEDs
#set_property DRIVE 8 [get_ports {p_5_address0[0]}]
#set_property DRIVE 8 [get_ports {p_5_address0[1]}]
#set_property DRIVE 8 [get_ports {p_5_address0[2]}]
#set_property PACKAGE_PIN T2 [get_ports {ap_rst}]
#set_property PACKAGE_PIN T3 [get_ports {ap_start}]
#set_property PACKAGE_PIN T4 [get_ports {ap_done}]

# DIP switches

#set_property PACKAGE_PIN A1 [get_ports {ap_idle}]
#set_property PACKAGE_PIN A1 [get_ports {ap_ready}]
#set_property PACKAGE_PIN A13 [get_ports {ap_start}]
#set_property PACKAGE_PIN B14 [get_ports {ap_done}]
#set_property PACKAGE_PIN A1 [get_ports {ap_idle}]
set_property PACKAGE_PIN P16 [get_ports {trig_o}]
set_property PACKAGE_PIN R16 [get_ports {ap_start}]
set_property PACKAGE_PIN T14 [get_ports {ap_done_o}]
set_property PACKAGE_PIN T15 [get_ports {ap_rst}]
set_property PACKAGE_PIN T2 [get_ports {done_led}]
set_property PACKAGE_PIN T4 [get_ports {test_led}]

# Debug on JP3:
# --------------------------------------------------
#set_property PACKAGE_PIN A12 [get_ports {p[0]}]
#set_property PACKAGE_PIN A14 [get_ports {p[1]}]
#set_property PACKAGE_PIN A15 [get_ports {p[2]}]
#set_property PACKAGE_PIN C12 [get_ports {p[3]}]
#set_property PACKAGE_PIN B14 [get_ports {p[4]}]
#set_property PACKAGE_PIN B16 [get_ports {p[5]}]
#set_property PACKAGE_PIN C13 [get_ports {p[6]}]

#set_property PACKAGE_PIN C11 [get_ports {p[7]}]
#set_property PACKAGE_PIN B12 [get_ports {p[8]}]
#set_property PACKAGE_PIN C14 [get_ports {p[9]}]
#set_property PACKAGE_PIN A13 [get_ports {p[10]}]
#set_property PACKAGE_PIN B15 [get_ports {p[11]}]

# TODO: sort out later, may lead to SWD debugging issues?
# (required because otherwise P+R fails with "Poor placement for routing between an IO pin and BUFG")
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets swclk_IBUF]
# --------------------------------------------------
# Configuration pins
# --------------------------------------------------
#set_property CFGBVS VCCO [current_design]
#set_property CONFIG_VOLTAGE 3.3 [current_design]

# --------------------------------------------------
# Bitstream generation
# --------------------------------------------------
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# --------------------------------------------------
# Remaining input delays
# --------------------------------------------------
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports TDI]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports j16_sel]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports k16_sel]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports l14_sel]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports k15_sel]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports swdio]
#set_input_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports nTRST]
# --------------------------------------------------
# Remaining output delays
# --------------------------------------------------
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports SWOTDO]
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports led1]
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports led2]
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports led3]
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports swdio]
#set_output_delay  -clock [get_clocks slow_out_clk] -add_delay $untimed_id [get_ports trig_out]


