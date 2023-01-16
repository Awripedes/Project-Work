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

entity top is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DUTY : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC);
end top;

architecture Behavioral of top is

component pwm is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DUTY : in STD_LOGIC_VECTOR (3 downto 0);
           PWM_OUT : out STD_LOGIC);
end component;

component clk_divider is
	Generic ( sys_clk : integer := 100_000_000;
			  out_clk : integer := 1);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_div : out STD_LOGIC);
end component;

signal div_clk : std_logic;

begin

-- 10kHz into the PWM will give a wave with frequency 1kHz
COMPONENT_CLK_DIV: clk_divider
generic map(
    out_clk => 10_000
)
port map(
    clk     => CLK,
    reset   => RESET,
    clk_div => div_clk
);

COMPONENT_PWM: pwm
port map(
    CLK     => div_clk,
    RESET   => RESET,
    DUTY    => DUTY,
    PWM_OUT => LED
);

end Behavioral;
