
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity checkImpar is
    generic (   L: integer := 8 ; 
                M: integer := 8 ); 
                
    Port ( entrada : in STD_LOGIC_VECTOR (L*M -1 downto 0);
           saida : out STD_LOGIC_VECTOR (L*M -1 downto 0);
           rest: in std_logic;  
           --clk: in std_logic;  
           count : out std_logic_vector (3 downto 0); 
           completed: out std_logic );
end checkImpar;

architecture Behavioral of checkImpar is
type data16x16 is array (M-1 downto 0) of std_logic_vector(M-1 downto 0); 
signal zeros : std_logic_vector(L -1 downto 0);
signal zeros1 : std_logic_vector(L*M -1  downto 0);
signal comp : std_logic;
signal cnt: std_logic_vector(3 downto 0);

begin
process(entrada, rest)
variable internal, tmp : data16x16; 

begin

        --zeros <= (others => '0');
       --comp <='0'; 
        --completed <= comp;
        cnt <= "0000";
        
        for i in L-1 downto 0 loop
            internal(i) := entrada(M*(i+1)-1 downto M*i); 
            --tmp(i) := (others => '0'); 
        end loop; 
        
        for j in 0 to L-1 loop
            if internal(j)(0) = '1' then -- é impar 
                --tmp(cnt) := internal(j); 
                cnt <= cnt + "1";
                
            end if;
        end loop;
    
--        for k in 0 to L-1 loop
--            if tmp(k) = zeros then
--                zeros1(L*(k+1) -1 downto L*k) <= (others => '0'); 
--            else
--                zeros1(L*(k+1) -1 downto L*k) <= tmp(k); 
--            end if; 
--        end loop; 
        
        saida <= zeros1; 
        
        count <= cnt;
        --comp <='1';
        --completed <= comp;

end process; 

end Behavioral;
