import chipwhisperer as cw

target = cw.target(
    None,
    cw.targets.CW305,
    force=True,
    bsfile="HLS_final_proj_1_1/HLS_final_proj_1_1.runs/impl_1/fn1.bit",
    fpga_id="100t",
    platform="cw305"
)
#bsfile="HLS_final_proj_1_1/HLS_final_proj_1_1.runs/impl_1/fn1.bit",
# Enable PLL
target.pll.pll_enable_set(True)
target.pll.pll_outenable_set(True, 1)
target.pll.pll_outfreq_set(10E6, 1)

# Check FPGA state
#print(hex(target.fpga.read_idcode()))
#If it returns something like:
#0x0362d093
#Then your FPGA is configured and alive.
print("Made it!")
# I have a custom HLS design I am programming the fpga with, do I need a defines file adn how do I make it
