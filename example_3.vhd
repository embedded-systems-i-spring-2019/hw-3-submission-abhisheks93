----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:37:29 PM
-- Design Name: 
-- Module Name: example_3 - Dataflow
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


entity example_3 is
--  Port ( );
port(LDA, LDB, S1, S0, clk : in std_logic;
    X, Y : in std_logic_vector(7 downto 0);
    RB : inout std_logic_vector(7 downto 0));
end example_3;

architecture Dataflow of example_3 is
    signal mux1out : std_logic_vector(7 downto 0);
    signal mux2out : std_logic_vector(7 downto 0);
    signal regaout : std_logic_vector(7 downto 0);
    
begin
    rega : process(clk)
    begin 
        if(rising_edge(clk)) then
            if(LDA = '1') then
                regaout <= mux1out;
            end if;
        end if;
    end process;

    regb : process(clk)
    begin
        if (rising_edge(clk)) then
            if (LDB = '1') then
                RB <= mux2out;
            end if;
        end if;
    end process;

    with S1 select
        mux1out<= X when '1',
                  RB when '0',
                  (others => '0') when others;
                 
    with S0 select
        mux2out <= regaout when '1',
                   Y when '0',
                   (others => '0') when others;
end Dataflow;
