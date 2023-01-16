----------------------------------------------------------------------------------
-- Project Work
-- Student: Victor Orfeu Merlo
-- Professor: Ali Hayek
--
-- Project: Experiment 04
-- Create Date: 16.01.2023 15:15:09
-- Target Device: Nexys A7-100T
-- Tool Version: Vivado 2022.2
--
-- Description:
-- Introduces students to components by implementing a PWM wave generator using the clock divider from previous experiment
-- 
-- Additional Comments:
-- Clock divider component file
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity clk_divider is
	Generic ( sys_clk : integer := 100_000_000;
			  out_clk : integer := 1);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_div : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is

constant limit : integer := sys_clk/(2*out_clk);
signal sclk : std_logic := '0';

begin

clk_div <= sclk;

process(clk, reset)
	variable counter : integer range 1 to limit := 1;
begin
    if reset = '0' then
        sclk <= '0';
        counter := 1;
    elsif rising_edge(clk) then
        if counter = limit then
            counter := 1;
            sclk <= not sclk;
        else
            counter := counter + 1;
        end if;
    end if;
end process;

end Behavioral;
