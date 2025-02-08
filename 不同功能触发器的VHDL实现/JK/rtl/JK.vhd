library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity JK is
	port(CLK,J, K : in std_logic;
			Q, NQ : out std_logic);
end entity JK;
 
architecture bhv of JK is
	signal Q_TEMP : std_logic;
	signal NQ_TEMP: std_logic;
	begin
	process(CLK, J, K)
	begin
		if CLK'EVENT  and CLK = '1' then
			if (J = '0') and  (K = '1') then
			Q_TEMP <= '0';
			NQ_TEMP <= '1';
			elsif (J = '1') and (K ='0') then
			Q_TEMP <= '1';
			NQ_TEMP <= '0';
			elsif (J = '1') and (K = '1') then
			Q_TEMP <=  not Q_TEMP;
			NQ_TEMP <= not NQ_TEMP;
			end if;
		end if;
	Q <= Q_TEMP;
	NQ <= NQ_TEMP;
	end process;
end architecture bhv;
			
	