----------------------------------------------------------------------------------
-- Project Work
-- Student: Victor Orfeu Merlo
-- Professor: Ali Hayek
--
-- Project: Experiment 03
-- Create Date: 21.11.2022 12:56:07
-- Target Device: Nexys A7-100T
-- Tool Version: Vivado 2022.2
--
-- Description:
-- Introduces students to sequential logic by implementing a 'jumping LED'
-- 
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

entity jumping_led is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end jumping_led;

architecture Behavioral of jumping_led is

signal sLED : std_logic_vector (15 downto 0) := (0 => '1', others => '0');
signal sCLK : std_logic := '0';

begin

-- CLOCK DIVIDER FROM 100MHz TO 2Hz
process(CLK, RESET)
	variable counter : integer range 1 to 25_000_000 := 1;
begin
    if reset = '1' then
        sCLK <= '0';
        counter := 1;
    elsif rising_edge(clk) then
        if counter = 25_000_000 then
            counter := 1;
            sCLK <= not sCLK;
        else
            counter := counter + 1;
        end if;
    end if;
end process;

-- JUMPING LED
process(sCLK, RESET)
begin
    if RESET = '1' then
        sLED <= (0 => '1', others => '0');
    elsif rising_edge(sCLK) then
        sLED <= sLED(14 downto 0) & sLED(15);
    end if;
end process;

LED <= sLED;

end Behavioral;
