----------------------------------------------------------------------------------
-- Project Work
-- Student: Victor Orfeu Merlo
-- Professor: Ali Hayek
--
-- Project: Experiment 02
-- Create Date: 16.01.2023 12:59:52
-- Target Device: Nexys A7-100T
-- Tool Version: Vivado 2022.2
--
-- Description:
-- Introduces students to combinational logic by implementing a 4-bit adder
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

entity four_bit_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           CARRY_OUT : out STD_LOGIC);
end four_bit_adder;

    architecture Behavioral of four_bit_adder is

signal Sum : std_logic_vector(3 downto 0) := (others => '0');
signal Carry : std_logic_vector(3 downto 0) := (others => '0');

begin

-- 1 BIT FULL ADDER CIRCUIT:
-- SUM <= A xor B xor CARRY_IN;
-- CARRY_OUT <= (A and B) or (CARRY_IN and (A xor B));

-- BIT 1 : Assumes no carry on first bit
Sum(0)      <= A(0) xor B(0) xor '0';
Carry(0)    <= (A(0) and B(0)) or ('0' and (A(0) xor B(0)));

-- BIT 2
Sum(1)      <= A(1) xor B(1) xor Carry(0);
Carry(1)    <= (A(1) and B(1)) or (Carry(0) and (A(1) xor B(1)));

-- BIT 3
Sum(2)      <= A(2) xor B(2) xor Carry(1);
Carry(2)    <= (A(2) and B(2)) or (Carry(1) and (A(2) xor B(2)));

-- BIT 4
Sum(3)      <= A(3) xor B(3) xor Carry(2);
Carry(3)    <= (A(3) and B(3)) or (Carry(2) and (A(3) xor B(3)));

-- OUTPUT ASSIGNMENT
S <= Sum;
CARRY_OUT <= Carry(3);

end Behavioral;
