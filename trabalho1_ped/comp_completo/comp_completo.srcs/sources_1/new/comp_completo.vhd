library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q2 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           F1 : out STD_LOGIC;
           F2 : out STD_LOGIC;
           F3 : out STD_LOGIC);
end Q2;

architecture Behavioral of Q2 is

    signal notA0, notB0, notA1, notB1, G, H, I, J, K, L, M, N, O, P, Q : STD_LOGIC;

begin

    notA0 <= not A0;
    notB0 <= not B0;
    notA1 <= not A1;
    notB1 <= not B1;
    
    G <= A0 and notB0;
    H <= notA0 and B0; 
    I <= A1 and notB1;
    J <= G and A1;
    K <= G and notB1;
    L <= notA1 and B1;
    M <= H and notA1;
    N <= H and B1;
    O <= J or I or K;
    P <= L or M or N;
    Q <= O or P;
    F1 <= O;
    F2 <= P;
    F3 <= not Q;
    
end Behavioral;