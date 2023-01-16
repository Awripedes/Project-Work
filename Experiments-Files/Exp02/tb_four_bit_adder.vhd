----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2023 13:28:28
-- Design Name: 
-- Module Name: tb_four_bit_adder - Behavioral
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

entity tb_four_bit_adder is
--  Port ( );
end tb_four_bit_adder;

architecture Behavioral of tb_four_bit_adder is

component four_bit_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           CARRY_OUT : out STD_LOGIC);
end component;

signal sA, sB, sS : std_logic_vector(3 downto 0) := (others => '0');
signal sCARRY_OUT : std_logic := '0';

begin

UUT: four_bit_adder
port map(
    A   => sA,
    B   => sB,
    S   => sS,
    CARRY_OUT => sCARRY_OUT
);

sA <= "0001" after 10 ns,
      "0101" after 20 ns,
      "1111" after 30 ns;
      
sB <= "0001" after 10 ns,
      "1010" after 20 ns,
      "0001" after 30 ns;

end Behavioral;
