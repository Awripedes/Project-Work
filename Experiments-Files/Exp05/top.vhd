----------------------------------------------------------------------------------
-- Project Work
-- Student: Victor Orfeu Merlo
-- Professor: Ali Hayek
--
-- Project: Experiment 05
-- Create Date: 17.01.2023 13:51:21
-- Target Device: Nexys A7-100T
-- Tool Version: Vivado 2022.2
--
-- Description:
-- Introduces students to 7-segment displays and counters
-- 
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           ENABLE : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           SEG : out STD_LOGIC_VECTOR (6 downto 0));
end top;

architecture Behavioral of top is

component clk_divider is
	Generic ( SYS_CLK : integer := 100_000_000;
			  OUT_CLK : integer := 1);
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CLK_DIV : out STD_LOGIC);
end component;

component bcd_decoder is
    Port ( NUMBER : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (0 to 6);
           AN : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_1Hz : std_logic;
signal counter : integer range 0 to 15 := 0;
signal binary_digit : std_logic_vector(3 downto 0);

begin

DIVIDER: clk_divider
port map(
    CLK     => CLK,
    RESET   => RESET,
    CLK_DIV => clk_1Hz
);

DECODER: bcd_decoder
port map(
    NUMBER  => binary_digit,
    SEG     => SEG,
    AN      => AN
);

-- COUNTER FROM 0 TO 9
-- Counts up until 9 when enabled, wraping around to 0
process(clk_1Hz, RESET)
begin
    if RESET = '0' then
        counter <= 0;        
    elsif rising_edge(clk_1Hz) then
        if ENABLE = '1' then
            if counter = 9 then
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end if;
end process;

-- Converts integer to vector
binary_digit <= std_logic_vector(TO_UNSIGNED(counter, 4));

end Behavioral;
