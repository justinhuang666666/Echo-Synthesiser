transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/fsm_VC.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/counter_VCFSM.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/CTR_VC.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/GAIN_VC.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/ram_vc.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/processor_vc.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/mylib {C:/intelFPGA_lite/18_2/projects/mylib/spi2dac.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/mylib {C:/intelFPGA_lite/18_2/projects/mylib/spi2adc.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/mylib {C:/intelFPGA_lite/18_2/projects/mylib/pulse_gen.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/mylib {C:/intelFPGA_lite/18_2/projects/mylib/clktick_16.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge5 {C:/intelFPGA_lite/18_2/projects/challenge5/CTR_13.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/G_VC.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18_2/projects/challenge6 {C:/intelFPGA_lite/18_2/projects/challenge6/challenge6.v}

