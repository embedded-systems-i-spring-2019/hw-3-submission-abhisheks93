----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 12:11:48 PM
-- Design Name: 
-- Module Name: example6 - Dataflow
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

entity example6 is
--  Port ( );
port(SEL1, SEL2, clk : in std_logic;
     A, B, C : in std_logic_vector(7 downto 0);
     RAP, RBP : out std_logic_vector(7 downto 0));
end example6;

architecture Dataflow of example6 is
    signal decoderout0 : std_logic;
    signal decoderout1 : std_logic;
    signal muxout : std_logic_vector(7 downto 0);
begin
    rega : process(clk)
    begin
        if (rising_edge(clk)) then
        if (decoderout1 = '1') then
            RAP <= muxout;
            
        end if;
        
      end if;
    end process;
    
    
    regb : process(clk)
    begin
        if(rising_edge(clk)) then
            if(decoderout0 = '1') then
                RBP <= C;
            end if;
        end if;
    end process;
    
    with SEL1 select
        muxout <= A when '1',
                  B when '0',
                  (others => '0') when others;
    
    decoderout1 <= SEL2;
    decoderout0 <= not SEL2;        
        

end Dataflow;
