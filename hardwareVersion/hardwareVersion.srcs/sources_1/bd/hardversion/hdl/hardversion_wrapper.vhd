--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Fri Jun 03 01:29:33 2016
--Host        : DESKTOP-BGLQMM6 running 64-bit major release  (build 9200)
--Command     : generate_target hardversion_wrapper.bd
--Design      : hardversion_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hardversion_wrapper is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
end hardversion_wrapper;

architecture STRUCTURE of hardversion_wrapper is
  component hardversion is
  port (
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component hardversion;
begin
hardversion_i: component hardversion
     port map (
      an(7 downto 0) => an(7 downto 0),
      btnC => btnC,
      clk => clk,
      led(15 downto 0) => led(15 downto 0),
      seg(6 downto 0) => seg(6 downto 0)
    );
end STRUCTURE;
