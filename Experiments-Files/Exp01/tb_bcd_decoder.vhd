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
-- Testbench file
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

entity tb_bcd_decoder is
--  Port ( );
end tb_bcd_decoder;

architecture Behavioral of tb_bcd_decoder is

component bcd_decoder is
    Port ( NUMBER : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal sNUMBER : std_logic_vector (3 downto 0) := (others => '0');
signal sSEG : std_logic_vector (6 downto 0);

begin

UUT: bcd_decoder
port map(
    NUMBER  => sNUMBER,
    SEG     => sSEG
);

sNUMBER <= "0000" after 10 ns,
           "0001" after 20 ns,
           "0010" after 30 ns,
           "0011" after 40 ns,
           "0100" after 50 ns,
           "0101" after 60 ns,
           "0110" after 70 ns,
           "0111" after 80 ns,
           "1000" after 90 ns,
           "1001" after 100 ns,
           "1010" after 110 ns,
           "1011" after 120 ns,
           "1100" after 130 ns,
           "1101" after 140 ns,
           "1110" after 150 ns,
           "1111" after 160 ns,
           "ZZZZ" after 170 ns;

end Behavioral;
