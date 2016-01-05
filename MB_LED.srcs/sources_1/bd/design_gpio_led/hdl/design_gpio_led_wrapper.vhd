--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
--Date        : Tue Jan  5 13:32:08 2016
--Host        : G550-Linux running 64-bit Linux Mint 17.3 Rosa
--Command     : generate_target design_gpio_led_wrapper.bd
--Design      : design_gpio_led_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_gpio_led_wrapper is
  port (
    clock_rtl : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset_rtl : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
end design_gpio_led_wrapper;

architecture STRUCTURE of design_gpio_led_wrapper is
  component design_gpio_led is
  port (
    reset_rtl_0 : in STD_LOGIC;
    clock_rtl : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_gpio_led;
begin
design_gpio_led_i: component design_gpio_led
     port map (
      clock_rtl => clock_rtl,
      led(15 downto 0) => led(15 downto 0),
      reset_rtl => reset_rtl,
      reset_rtl_0 => reset_rtl_0
    );
end STRUCTURE;
