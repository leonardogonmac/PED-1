----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.07.2022 08:24:41
-- Design Name: 
-- Module Name: detector_prioridade - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detector_prioridade is
    Port ( 
           p0:  in STD_LOGIC;
           p1: in STD_LOGIC;
           p2: in STD_LOGIC;
           p3: in STD_LOGIC;
           x0 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           int : out STD_LOGIC);
end detector_prioridade;

architecture Behavioral of detector_prioridade is

signal s0: STD_LOGIC :='0';
signal s1: STD_LOGIC :='1';

begin

    x0 <= '0' when p0='1' else  
          '1' when p0='0' and p1='1' else
          '0' when p0='0' and p1='0' and p2='1' else
          '1' when p0='0' and p1='0' and p2='0' and p3='1' else 
          '1' when p0='0' and p1='0' and p2='0' and p3='0';
          
    x1 <=   '0' when p0='1' else
            '0' when p0='0' and p1='1' else
            '1' when p0='0' and p1='0' and p2='1' else  
            '1'when p0='0' and p1='0' and p2='0' and p3='1' else
            '1' when p0='0' and p1='0' and p2='0' and p3='0'; 
          
    int <= '0' when p0='0' and p1='0' and p2='0' and p3='0' else
           '1';


end Behavioral;
