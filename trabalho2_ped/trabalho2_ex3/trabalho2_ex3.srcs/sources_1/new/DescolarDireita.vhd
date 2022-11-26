library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DescolarDireita is
    Port ( D_LOAD : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (1 downto 0);
           DR_IN : in STD_LOGIC;
           DL_IN : in STD_LOGIC;
           clk : in STD_LOGIC;
           D_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end DescolarDireita;

architecture Behavioral of DescolarDireita is

    signal reg : std_logic_vector(7 downto 0) := "00000000";
    signal D_OUTsig : std_logic_vector(7 downto 0) := "00000000";
        
    signal y0: std_logic := '0';
    signal y1: std_logic := '0';
    signal y2: std_logic := '0';
    signal y3: std_logic := '0';
    signal y4: std_logic := '0';
    signal y5: std_logic := '0';
    signal y6: std_logic := '0';
    signal y7: std_logic := '0';
    
    signal SEL_A: std_logic := '0';
    signal SEL_B: std_logic := '0';
    
    signal DRIN: std_logic := '0';
    signal DLIN: std_logic := '0';
    
    signal DOUT: std_logic := '0';
    
    signal settingD_Load: std_logic := '0';
    signal deslocarDireitaController: std_logic := '0';
    signal deslocarEsquerdaController: std_logic := '0';
    
    signal clk_dividido: std_logic := '0';
    signal counter: integer range 1 to 100_000_000 := 1;

begin

    
    --------------Divisor de Clock -----------------
    
        divisor_clk: process(clk)
        begin 
            if rising_edge(clk) then
                if counter = 100_000_000 then
                    counter <= 1;
                    clk_dividido <= not clk_dividido;
                else
                    counter <= counter + 1;
                end if;
            end if;
            
        end process;
    --------------Divisor de Clock  end-----------------
   
    
        selectOperation: process (clk_dividido)
        begin 
            if rising_edge(clk_dividido) then
                case SEL is
                    when "00" => null;
                    when "01" => settingD_Load <= '1';
                    when "10" => deslocarDireitaController <= '1'; 
                    when "11" => deslocarEsquerdaController <= '1';
                    when others => D_OUTsig <= "00000000";
                end case;
                 
                 if deslocarEsquerdaController = '1' then 
                       reg <= reg(6 downto 0) & DR_IN;
                       D_OUTsig <= reg;
                       deslocarEsquerdaController <= '0';
                 end if;
                       
                if deslocarDireitaController = '1' then        
                    reg <= DL_IN & reg(7 downto 1);
                    D_OUTsig <= reg;
                    deslocarDireitaController <= '0';
                end if;
                        
                 if settingD_Load = '1' then
                       reg <= D_LOAD;
                       D_OUTsig <= reg;
                       settingD_Load <= '0'; 
                 end if;
        
            end if;      
        end process;
        
        D_OUT <= D_OUTsig;

end Behavioral;
