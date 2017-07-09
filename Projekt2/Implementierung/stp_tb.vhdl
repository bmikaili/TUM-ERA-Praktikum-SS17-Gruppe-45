library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-----------------------------------
--------------ENTITY---------------
-----------------------------------

entity audiostp_tb is
end audiostp_tb;

architecture test of audiostp_tb is
	component audiostp
		port (
			sclk, fsync, sdata : in std_logic;				      -- Eingänge definieren
			left, right : out signed (17 downto 0);				  -- 18 Bit Ausgabewerte
			flag : out std_logic							      -- 1 Bit Ausgabeflag
		);
	end component;

	signal sclk, fsync, sdata, flag: std_logic;
	signal left, right: signed (17 downto 0);

begin
	audioconverter: audiostp port map (sclk => sclk, fsync => fsync, sdata => sdata, flag => flag, left => left, right => right);

	process begin

		sclk <= 'X';
		fsync <= 'X';
		sdata <= 'X';
		wait for 1 ns;

		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;



		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;







		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		------------------------

		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;



		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;
		sclk <= '0';
		fsync <= '0';
		sdata <= '0';
		wait for 1 ns;







		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		
		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '1';
		wait for 1 ns;


		sclk <= '1';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		sclk <= '0';
		fsync <= '1';
		sdata <= '0';
		wait for 1 ns;

		wait;
	end process;
end test;