--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Fri Jun 03 03:42:52 2016
--Host        : DESKTOP-BGLQMM6 running 64-bit major release  (build 9200)
--Command     : generate_target MB_version_wrapper.bd
--Design      : MB_version_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MB_version_wrapper is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    btnCpuReset : in STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end MB_version_wrapper;

architecture STRUCTURE of MB_version_wrapper is
  component MB_version is
  port (
    clk : in STD_LOGIC;
    btnCpuReset : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    btnC : in STD_LOGIC;
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component MB_version;
begin
MB_version_i: component MB_version
     port map (
      an(7 downto 0) => an(7 downto 0),
      btnC => btnC,
      btnCpuReset => btnCpuReset,
      clk => clk,
      led(15 downto 0) => led(15 downto 0),
      seg(6 downto 0) => seg(6 downto 0),
      sw(3 downto 0) => sw(3 downto 0)
    );
end STRUCTURE;
