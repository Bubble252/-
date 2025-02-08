library ieee;
use ieee.std_logic_1164.all;

entity D4 is
    port (din,clk : in std_logic;
	       dout : out std_logic;
			 m:out std_logic_vector(3 downto 0));
end D4;

architecture dff4  of D4 is
  component dff1 is
  port(d,clk:in std_logic;
           q:out std_logic);
end component;
signal z:std_logic_vector(4 downto 0);
begin
  U0:dff1 port map(din,clk,z(1));
  m(3)<=z(1);
  U1:dff1 port map(z(1),clk,z(2));
  m(2)<=z(2);
  U2:dff1 port map(z(2),clk,z(3));
  m(1)<=z(3);
  U3:dff1 port map(z(3),clk,z(4));
  dout<=z(4);
  m(0)<=z(4);
end dff4;


