----------------------------------------------------------------------------------
-- Project Work
-- Student: Victor Orfeu Merlo
-- Professor: Ali Hayek
--
-- Project: Experiment 01
-- Create Date: 17.01.2023 12:51:42
-- Target Device: Nexys A7-100T
-- Tool Version: Vivado 2022.2
--
-- Description:
-- Introduces students to Vivado and VHDL using a simple example
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

entity bcd_decoder is
    Port ( NUMBER : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (0 to 6);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end bcd_decoder;

architecture Behavioral of bcd_decoder is

begin

-- DECODER 4-BIT NUMBER TO 7SEG
-- Segments in Nexys A7 are common anode, meaning they are activated when input is 0
process(NUMBER)
begin
    case NUMBER is
        when "0000" => SEG <= "1000000"; -- 0
        when "0001" => SEG <= "1111001"; -- 1
        when "0010" => SEG <= "0100100"; -- 2
        when "0011" => SEG <= "0110000"; -- 3
        when "0100" => SEG <= "0011001"; -- 4
        when "0101" => SEG <= "0010010"; -- 5
        when "0110" => SEG <= "0000010"; -- 6
        when "0111" => SEG <= "1111000"; -- 7
        when "1000" => SEG <= "0000000"; -- 8
        when "1001" => SEG <= "0011000"; -- 9
        when "1010" => SEG <= "0001000"; -- A
        when "1011" => SEG <= "0000011"; -- B
        when "1100" => SEG <= "1000110"; -- C
        when "1101" => SEG <= "0100001"; -- D
        when "1110" => SEG <= "0000110"; -- E
        when "1111" => SEG <= "0001110"; -- F
        when others => SEG <= "1111111"; -- off
    end case;
end process;

-- Turns on only the first display
AN <= (0 => '0', others => '1');

end Behavioral;
