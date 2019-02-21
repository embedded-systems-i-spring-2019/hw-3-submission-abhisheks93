----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:04:06 PM
-- Design Name: 
-- Module Name: example4 - Dataflow
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
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.Numeric_std.all;



entity example4 is
--  Port ( );
port(LDB, S1, LDA, RD,S0,clk : in std_logic;
    X,Y: in std_logic_vector (7 downto 0);
    RB : inout std_logic_vector (7 downto 0); 
    RA : out std_logic_vector (7 downto 0) );
end example4;

architecture Dataflow of example4 is
    signal mux1_result : std_logic_vector (7 downto 0);
    signal mux2_result : std_logic_vector (7 downto 0);
    signal tempout : std_logic;
begin
    rega : process(clk)
    begin
        if(rising_edge(clk)) then
            if(LDA = '1' and RD = '1') then
                RA <= mux1_result;
            end if;
        end if;
    end process;
    
    regb : process(clk)
    begin
        if (rising_edge(clk)) then
            if (LDB = '1' and tempout = '1') then
                RB <= mux2_result;
            end if;
        end if;
    end process;
    
    with S1 Select
    mux2_result <= Y when '0',
                   X when '1',
                   (others => '0') when others;
    
    with S0 Select
    mux1_result <= Y when '0',
                   RB when '1',
                   (others => '0') when others;  
    tempout <= not RD;          

end Dataflow;
