# On-board Slide Switches
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports a]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports b]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports c]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports d]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports s0]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports s1]

# On-board LEDs
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports y]