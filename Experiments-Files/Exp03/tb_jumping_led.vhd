----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 13:17:56
-- Design Name: 
-- Module Name: tb_jumping_led - Behavioral
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

entity tb_jumping_led is
--  Port ( );
end tb_jumping_led;

architecture Behavioral of tb_jumping_led is

component jumping_led is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal sCLK, sRESET : std_logic := '0';
signal sLED : std_logic_vector (15 downto 0) := (others => '0');

begin

UUT: jumping_led
port map(
    CLK     => sCLK,
    RESET   => sRESET,
    LED     => sLED
);

sCLK <= not sCLK after 5 ns;
sRESET <= '1' after 10 ns, '0' after 20 ns;

end Behavioral;
