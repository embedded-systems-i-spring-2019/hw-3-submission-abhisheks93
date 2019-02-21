----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 10:52:53 AM
-- Design Name: 
-- Module Name: example5 - Dataflow
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
use IEEE.Numeric_std.all;

entity example5 is
--  Port ( );
port(SL1, SL2, clk : in std_logic;
     A, B, C : in std_logic_vector (7 downto 0);
     RAX, RBX : out std_logic_vector (7 downto 0));
     
end example5;

architecture Dataflow of example5 is
    signal decoderout0 : std_logic;
    signal decoderout1 : std_logic;
    signal muxout : std_logic_vector(7 downto 0);
begin
    rega : process(clk)
    begin
        if (rising_edge(clk)) then
            if(decoderout0 = '1') then
                RAX <= A;
            end if;
            
        end if;
    end process;
    
    regb : process(clk)
    begin 
        if (rising_edge(clk)) then
            if (decoderout1 = '1') then
                RBX <= muxout;
            end if;
        end if;
   end process;
   
   with SL2 select
   muxout <= B when '1',
             C when '0',
             (others => '0') when others;
            
   
   decoderout1 <= not SL1;
   decoderout0 <= SL1;         
              


end Dataflow;
