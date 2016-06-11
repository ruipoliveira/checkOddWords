library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity imparE is
 generic (   L: integer := 4 ; 
               M: integer := 4 ); 
               
   Port ( entrada : in STD_LOGIC_VECTOR (L*M -1 downto 0);
          rest: in std_logic;  
          count : out std_logic_vector (3 downto 0); 
          completed: out std_logic; 
          saida : out std_logic_vector ( L*M -1 downto 0) );
end imparE;

architecture Behavioral of imparE is

type data16x16 is array (M-1 downto 0) of std_logic_vector(M-1 downto 0); 
signal zeros : std_logic_vector(L -1 downto 0);
signal temp_sgn : std_logic_vector(L*M -1  downto 0);
signal comp : std_logic;

begin
process(entrada, rest)
    variable internal, tmp : data16x16; 
    variable cnt : integer range 0 to 10;
    begin

    cnt := 0; 
    
    for i in L-1 downto 0 loop
        internal(i) := entrada(M*(i+1)-1 downto M*i); 
        tmp(i) := (others => '0'); 
    end loop; 
    
    for j in 0 to L-1 loop
        if internal(j)(0) = '1' then -- é impar 
            tmp(cnt) := internal(j); 
            cnt := cnt + 1;
        end if;
    end loop;
    
    for k in 0 to L-1 loop
        temp_sgn(L*(k+1) -1 downto L*k) <= tmp(k); 
    end loop; 
    
    saida <= temp_sgn;
    count <= conv_std_logic_vector(cnt,4);
    comp <='1';
    completed <= comp;

end process; 

end Behavioral;
