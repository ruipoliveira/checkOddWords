library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.ALL;  


entity sendImpar is
    generic (   L: integer := 8; 
                M: integer :=8 ); 
    Port ( data : in STD_LOGIC_VECTOR (L*M -1 downto 0);
           nrimpars : in STD_LOGIC_VECTOR (3 downto 0);
           compt : in STD_LOGIC;
           clk : in STD_LOGIC;
           imparData : out STD_LOGIC_VECTOR(L-1 downto 0));
end sendImpar;

architecture Behavioral of sendImpar is
    signal k : integer :=0 ; 
    begin 

    process (clk, compt, nrimpars)
        
        variable var : integer range 0 to 16; 
        begin
        
        if rising_edge(clk) then
            if compt = '1'  then
                var := conv_integer(unsigned(nrimpars)); 
                imparData <= data(L*(k+1) -1 downto L*k);
                k <= k + 1; 
                if k >= var-1 then 
                    k <= 0; 
                end if;     
            end if;  
        end if; 
        
    end process;
end Behavioral;
