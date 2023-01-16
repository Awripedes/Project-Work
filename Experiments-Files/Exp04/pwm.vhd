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
-- PWM component file
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity pwm is
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           DUTY : in STD_LOGIC_VECTOR (3 downto 0);
           PWM_OUT : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is

signal pwm_aux : std_logic := '0';
signal counter : integer range 0 to 10 := 0;
signal preset : integer range 0 to 10 := 0;
constant period : integer := 10;

begin

-- DUTY CYCLE SELECTION
with DUTY select
    preset <= 10 when "1010", --100%
               9 when "1001", --90%
               8 when "1000", --80%
               7 when "0111", --70%
               6 when "0110", --60%
               5 when "0101", --50%
               4 when "0100", --40%
               3 when "0011", --30%
               2 when "0010", --20%
               1 when "0001", --10%
               0 when others; --0%

-- PULSE WIDTH MODULATION
-- Because of how this is designed, the PWM will have a frequency 10x lower than the input clock.
-- So, if you give an input clock of 1kHz, the output PWM will have 100Hz.
process(CLK, RESET)
begin
    if RESET = '0' then
        counter <= 0;
        pwm_aux <= '0';
    elsif rising_edge(CLK) then
        if counter < preset then
            counter <= counter + 1;
            pwm_aux <= '1';
        elsif counter = period then
            counter <= 0;
        else
            counter <= counter + 1;
            pwm_aux <= '0';
        end if;
    end if;
end process;

PWM_OUT <= pwm_aux;

end Behavioral;
