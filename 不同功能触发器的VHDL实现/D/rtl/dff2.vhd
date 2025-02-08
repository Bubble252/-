library ieee;
use ieee.std_logic_1164.all;
entity dff2 is
	port(CLK, RST, EN, D : in std_logic;
					   Q : out std_logic);
end entity dff2;
architecture bhv of dff2 is
	signal Q1 : std_logic;
	begin
	process(CLK, Q1, RST, EN)
		begin
		if RST = '1' then Q1 <= '0';
		elsif CLK'EVENT and CLK = '1' then 
			if EN = '1' then Q1 <= D;
			end if;
		end if;
	end process;
	Q <= Q1;
end architecture bhv;