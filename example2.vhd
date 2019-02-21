----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:21:58 PM
-- Design Name: 
-- Module Name: example2 - Dataflow
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


entity example2 is
--  Port ( );
port(DS, clk : in std_logic;
     MS : in std_logic_vector(1 downto 0);
     X, Y, Z : std_logic_vector (7 downto 0);
     RA, RB : inout std_logic_vector (7 downto 0));
end example2;

architecture Dataflow of example2 is
    signal muxout : std_logic_vector(7 downto 0);
    signal decoderout1 : std_logic;
    signal decoderout0 : std_logic;
begin
    
    regb : process(clk)
        begin
        if (rising_edge(clk)) then
            if (decoderout1 = '1') then
                RB <= RA;
            end if;
        end if;
    end process;
    
    
    rega : process(clk)
    begin
    if (rising_edge(clk)) then
        if(decoderout0 = '1') then
            RA <= muxout;
            
        end if;
    end if;
    end process;
   
   
    with MS select
    muxout <= X when "00",
              Y when "01",
              Z when "10",
              RB when "11";
              
   
    decoderout1 <= DS;
    decoderout0 <= not DS;

end Dataflow;
