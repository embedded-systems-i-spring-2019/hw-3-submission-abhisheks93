----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 01:05:15 PM
-- Design Name: 
-- Module Name: example1 - Dataflow
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

entity example1 is
--  Port ( );
port(LDA, SEL, clk : in std_logic;
    A, B : in std_logic_vector (7 downto 0);
    F : out std_logic_vector (7 downto 0));
end example1;

architecture Dataflow of example1 is
    signal muxout : std_logic_vector(7 downto 0);
begin
    rega : process(clk)
    begin 
        if (rising_edge(clk)) then
            if(LDA = '1') then
                F <= muxout;
            end if;
        end if;
    end process;
    
    with SEL select
        muxout <= A when '1',
                  B when '0',
                  (others => '0') when others;
    

end Dataflow;
