library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity clk_divider is
	Generic ( SYS_CLK : integer := 100_000_000;
			  OUT_CLK : integer := 1);
    Port ( CLK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CLK_DIV : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is

constant limit : integer := SYS_CLK/(2*OUT_CLK);
signal sclk : std_logic := '0';

begin

CLK_DIV <= sclk;

process(CLK, RESET)
	variable counter : integer range 1 to limit := 1;
begin
    if RESET = '0' then
        sclk <= '0';
        counter := 1;
    elsif rising_edge(CLK) then
        if counter = limit then
            counter := 1;
            sclk <= not sclk;
        else
            counter := counter + 1;
        end if;
    end if;
end process;

end Behavioral;
