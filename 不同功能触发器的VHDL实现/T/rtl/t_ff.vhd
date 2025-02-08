library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity t_ff is
	port(CLK, T : in std_logic;
			Q: buffer  std_logic);
end entity t_ff;
 
architecture bhv of t_ff is
	signal Q_TEMP : std_logic;
	begin
	process(CLK)
		begin
		if CLK'EVENT and CLK = '1' then
			if T = '1' then 
			Q_TEMP <= not Q_TEMP;
			else
			Q_TEMP <= Q_TEMP;
			end if;
		end if;
	Q <= Q_TEMP;
	end process;
end architecture bhv;
	