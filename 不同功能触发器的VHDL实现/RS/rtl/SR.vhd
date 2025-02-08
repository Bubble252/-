library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity SR is
	port(S, R, CLK : in std_logic;
				Q  : buffer std_logic);
end entity SR;
 
architecture bhv of SR is
	signal Q_TEMP : std_logic;
	begin
	process(CLK)
	begin
		if CLK'EVENT and CLK = '1' then 		--或非门构成的SR触发器
			if S = '0' and R = '1' then
			Q_TEMP <= '0';
			elsif S = '1' and R = '0' then 
			Q_TEMP <= '1';
			end if;
		end if;
	Q <= Q_TEMP;
	end process;
end architecture bhv;