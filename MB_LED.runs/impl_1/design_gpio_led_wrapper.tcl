proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /mnt/seagate/Development/FPGA/MB_LED/MB_LED.cache/wt [current_project]
  set_property parent.project_path /mnt/seagate/Development/FPGA/MB_LED/MB_LED.xpr [current_project]
  set_property ip_repo_paths {
  /mnt/seagate/Development/FPGA/MB_LED/MB_LED.cache/ip
  /mnt/seagate/Development/FPGA/IP_Repository
} [current_project]
  set_property ip_output_repo /mnt/seagate/Development/FPGA/MB_LED/MB_LED.cache/ip [current_project]
  add_files -quiet /mnt/seagate/Development/FPGA/MB_LED/MB_LED.runs/synth_1/design_gpio_led_wrapper.dcp
  add_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/design_gpio_led.bmm
  set_property SCOPED_TO_REF design_gpio_led [get_files -all /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/design_gpio_led.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/design_gpio_led.bmm]
  add_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_microblaze_0_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF design_gpio_led [get_files -all /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_microblaze_0_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_microblaze_0_0/data/mb_bootloop_le.elf]
  read_xdc -ref design_gpio_led_microblaze_0_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_microblaze_0_0/design_gpio_led_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_microblaze_0_0/design_gpio_led_microblaze_0_0.xdc]
  read_xdc -ref design_gpio_led_dlmb_v10_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_dlmb_v10_0/design_gpio_led_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_dlmb_v10_0/design_gpio_led_dlmb_v10_0.xdc]
  read_xdc -ref design_gpio_led_ilmb_v10_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_ilmb_v10_0/design_gpio_led_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_ilmb_v10_0/design_gpio_led_ilmb_v10_0.xdc]
  read_xdc -ref design_gpio_led_mdm_1_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_mdm_1_0/design_gpio_led_mdm_1_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_mdm_1_0/design_gpio_led_mdm_1_0.xdc]
  read_xdc -prop_thru_buffers -ref design_gpio_led_clk_wiz_1_0 -cells inst /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_clk_wiz_1_0/design_gpio_led_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_clk_wiz_1_0/design_gpio_led_clk_wiz_1_0_board.xdc]
  read_xdc -ref design_gpio_led_clk_wiz_1_0 -cells inst /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_clk_wiz_1_0/design_gpio_led_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_clk_wiz_1_0/design_gpio_led_clk_wiz_1_0.xdc]
  read_xdc -prop_thru_buffers -ref design_gpio_led_rst_clk_wiz_1_100M_0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_rst_clk_wiz_1_100M_0/design_gpio_led_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_rst_clk_wiz_1_100M_0/design_gpio_led_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref design_gpio_led_rst_clk_wiz_1_100M_0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_rst_clk_wiz_1_100M_0/design_gpio_led_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_rst_clk_wiz_1_100M_0/design_gpio_led_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref design_gpio_led_axi_gpio_0_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_axi_gpio_0_0/design_gpio_led_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_axi_gpio_0_0/design_gpio_led_axi_gpio_0_0_board.xdc]
  read_xdc -ref design_gpio_led_axi_gpio_0_0 -cells U0 /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_axi_gpio_0_0/design_gpio_led_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/sources_1/bd/design_gpio_led/ip/design_gpio_led_axi_gpio_0_0/design_gpio_led_axi_gpio_0_0.xdc]
  read_xdc {{/mnt/seagate/Development/FPGA/MB_LED/MB_LED.srcs/constrs_1/imports/Nexys 4 DDR/Nexys4DDR_Master.xdc}}
  link_design -top design_gpio_led_wrapper -part xc7a100tcsg324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force design_gpio_led_wrapper_opt.dcp
  report_drc -file design_gpio_led_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file design_gpio_led_wrapper.hwdef}
  place_design 
  write_checkpoint -force design_gpio_led_wrapper_placed.dcp
  report_io -file design_gpio_led_wrapper_io_placed.rpt
  report_utilization -file design_gpio_led_wrapper_utilization_placed.rpt -pb design_gpio_led_wrapper_utilization_placed.pb
  report_control_sets -verbose -file design_gpio_led_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force design_gpio_led_wrapper_routed.dcp
  report_drc -file design_gpio_led_wrapper_drc_routed.rpt -pb design_gpio_led_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file design_gpio_led_wrapper_timing_summary_routed.rpt -rpx design_gpio_led_wrapper_timing_summary_routed.rpx
  report_power -file design_gpio_led_wrapper_power_routed.rpt -pb design_gpio_led_wrapper_power_summary_routed.pb
  report_route_status -file design_gpio_led_wrapper_route_status.rpt -pb design_gpio_led_wrapper_route_status.pb
  report_clock_utilization -file design_gpio_led_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force design_gpio_led_wrapper.mmi }
  catch { write_bmm -force design_gpio_led_wrapper_bd.bmm }
  write_bitstream -force design_gpio_led_wrapper.bit 
  catch { write_sysdef -hwdef design_gpio_led_wrapper.hwdef -bitfile design_gpio_led_wrapper.bit -meminfo design_gpio_led_wrapper.mmi -file design_gpio_led_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

