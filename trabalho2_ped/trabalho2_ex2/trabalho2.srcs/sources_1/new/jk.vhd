library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk is
   port (  j: in STD_LOGIC;
           k : in STD_LOGIC;
           preset: in STD_LOGIC;
           clear: in STD_LOGIC;
           clk: in STD_LOGIC;
	       q: out STD_LOGIC;
	       not_q: out STD_LOGIC);
end jk;
 
architecture behavioral of jk is	 
    constant maximo   : INTEGER := 100000000;
    signal contador   : INTEGER range 0  to maximo;
    signal inversor   : STD_LOGIC := '0';
    signal input: STD_LOGIC_VECTOR (1 downto 0);
    
begin
        input <= j & k;
              
              
        p_1_HZ : process (clk) is
          begin
            if rising_edge(clk) then
              if contador =  maximo then  
                inversor <= not inversor;
                contador   <= 0;
              else
                contador <= contador + 1;
              end if;
            end if;
          end process p_1_HZ;      
              
              
        process (clear,clk,j,k,preset) 
            variable temp: STD_LOGIC := '0';
        begin
        
         if (preset = '1' and clear = '0') then
                 temp := '1';
                 
        elsif (preset = '0' and clear = '1') then
                  temp :='0';

        elsif (preset = '0' and clear = '0') then
               
              if (rising_edge(clk) and inversor = '1') then
                    case input is
                        when "10" => temp := '0';
                        when "01" => temp := '1';
                        when "11" => temp := not temp;
                        when others => null;
                    end case;
                    
             end if;
        end if;    
                 q <=temp;
                 not_q <=  not temp;      
       
       end process;
         
    END behavioral;