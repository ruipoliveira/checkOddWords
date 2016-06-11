--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
--Date        : Fri Jun 03 01:29:33 2016
--Host        : DESKTOP-BGLQMM6 running 64-bit major release  (build 9200)
--Command     : generate_target hardversion.bd
--Design      : hardversion
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hardversion is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    btnC : in STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of hardversion : entity is "hardversion,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=hardversion,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=9,numReposBlks=9,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of hardversion : entity is "hardversion.hwdef";
end hardversion;

architecture STRUCTURE of hardversion is
  component hardversion_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component hardversion_blk_mem_gen_0_0;
  component hardversion_clock_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    divided_clk : out STD_LOGIC
  );
  end component hardversion_clock_divider_0_0;
  component hardversion_unroll_0_0 is
  port (
    clk : in STD_LOGIC;
    addr : out STD_LOGIC_VECTOR ( 3 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rst : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 255 downto 0 );
    completed : out STD_LOGIC
  );
  end component hardversion_unroll_0_0;
  component hardversion_imparE_0_0 is
  port (
    entrada : in STD_LOGIC_VECTOR ( 255 downto 0 );
    rest : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 3 downto 0 );
    completed : out STD_LOGIC;
    saida : out STD_LOGIC_VECTOR ( 255 downto 0 )
  );
  end component hardversion_imparE_0_0;
  component hardversion_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component hardversion_xlconcat_0_0;
  component hardversion_DC32_0_0 is
  port (
    clk : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    select_display : out STD_LOGIC_VECTOR ( 7 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component hardversion_DC32_0_0;
  component hardversion_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component hardversion_xlconcat_1_0;
  component hardversion_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component hardversion_xlconstant_0_1;
  component hardversion_sendImpar_0_0 is
  port (
    data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    nrimpars : in STD_LOGIC_VECTOR ( 3 downto 0 );
    compt : in STD_LOGIC;
    clk : in STD_LOGIC;
    imparData : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component hardversion_sendImpar_0_0;
  signal DC32_0_segments : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal DC32_0_select_display : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal blk_mem_gen_0_douta : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal btnC_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal clock_divider_0_divided_clk : STD_LOGIC;
  signal imparE_0_completed : STD_LOGIC;
  signal imparE_0_count : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal imparE_0_saida : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal sendImpar_0_imparData : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal unroll_0_addr : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal unroll_0_completed : STD_LOGIC;
  signal unroll_0_data_out : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 11 downto 0 );
begin
  an(7 downto 0) <= DC32_0_select_display(7 downto 0);
  btnC_1 <= btnC;
  clk_1 <= clk;
  led(15 downto 0) <= sendImpar_0_imparData(15 downto 0);
  seg(6 downto 0) <= DC32_0_segments(6 downto 0);
DC32_0: component hardversion_DC32_0_0
     port map (
      clk => clk_1,
      data_in(31 downto 0) => xlconcat_0_dout(31 downto 0),
      segments(6 downto 0) => DC32_0_segments(6 downto 0),
      select_display(7 downto 0) => DC32_0_select_display(7 downto 0)
    );
blk_mem_gen_0: component hardversion_blk_mem_gen_0_0
     port map (
      addra(3 downto 0) => unroll_0_addr(3 downto 0),
      clka => clk_1,
      douta(15 downto 0) => blk_mem_gen_0_douta(15 downto 0)
    );
clock_divider_0: component hardversion_clock_divider_0_0
     port map (
      clk => clk_1,
      divided_clk => clock_divider_0_divided_clk,
      reset => btnC_1
    );
imparE_0: component hardversion_imparE_0_0
     port map (
      completed => imparE_0_completed,
      count(3 downto 0) => imparE_0_count(3 downto 0),
      entrada(255 downto 0) => unroll_0_data_out(255 downto 0),
      rest => unroll_0_completed,
      saida(255 downto 0) => imparE_0_saida(255 downto 0)
    );
sendImpar_0: component hardversion_sendImpar_0_0
     port map (
      clk => clock_divider_0_divided_clk,
      compt => imparE_0_completed,
      data(255 downto 0) => imparE_0_saida(255 downto 0),
      imparData(15 downto 0) => sendImpar_0_imparData(15 downto 0),
      nrimpars(3 downto 0) => imparE_0_count(3 downto 0)
    );
unroll_0: component hardversion_unroll_0_0
     port map (
      addr(3 downto 0) => unroll_0_addr(3 downto 0),
      clk => clk_1,
      completed => unroll_0_completed,
      data_in(15 downto 0) => blk_mem_gen_0_douta(15 downto 0),
      data_out(255 downto 0) => unroll_0_data_out(255 downto 0),
      rst => btnC_1
    );
xlconcat_0: component hardversion_xlconcat_0_0
     port map (
      In0(15 downto 0) => sendImpar_0_imparData(15 downto 0),
      In1(15 downto 0) => xlconcat_1_dout(15 downto 0),
      dout(31 downto 0) => xlconcat_0_dout(31 downto 0)
    );
xlconcat_1: component hardversion_xlconcat_1_0
     port map (
      In0(11 downto 0) => xlconstant_0_dout(11 downto 0),
      In1(3 downto 0) => imparE_0_count(3 downto 0),
      dout(15 downto 0) => xlconcat_1_dout(15 downto 0)
    );
xlconstant_0: component hardversion_xlconstant_0_1
     port map (
      dout(11 downto 0) => xlconstant_0_dout(11 downto 0)
    );
end STRUCTURE;
