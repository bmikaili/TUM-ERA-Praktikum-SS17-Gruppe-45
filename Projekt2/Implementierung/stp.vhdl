library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


-----------------------------------
--------------ENTITY---------------
-----------------------------------

entity audiostp is
	port (
		sclk, fsync, sdata : in std_logic;				      -- Eingänge definieren
		left, right : out signed (17 downto 0);				  -- 18 Bit Ausgabewerte
		flag : out std_logic							      -- 1 Bit Ausgabeflag
	);
end audiostp;

-------------ENTITY END------------


-----------------------------------
-----------ARCHITECTURE------------
-----------------------------------

architecture converter of audiostp is
    
    -----------------------------------
    ---------SIGNAL DEFINITION---------
    -----------------------------------
	signal ileft, iright : signed (17 downto 0) := "000000000000000000";	 -- interne Zwischenspeicherung der seriellen Daten
	signal iflag : unsigned (0 downto 0) := "0";		      			-- internes Flag um zu speichern, ob sowohl left, als auch
														      			-- right eingelesen wurden und zur Ausgabe bereit sind

	signal hflag : unsigned (0 downto 0) := "0";			  			-- internes Hilfsflag
	signal counter : unsigned(4 downto 0) := "10001";		  			-- Zähler um serielle Daten in Vektor einzufügen
	signal rightold : signed ( 17 downto 0 ) := "000000000000000000";	-- Hilfsvariable weil right output nicht gelesen werden kann
	signal leftold : signed ( 17 downto 0 ) := "000000000000000000";	-- Hilfsvariable weil left output nicht gelesen werden kann

    --------SIGNAL DEFINITION END------

    begin                                                     -- Architecture begin

    -----------------------------------
    --------------SPLIT----------------
    -----------------------------------

	process (fsync, sclk)									  -- nur wenn sclk sich ändert, wird process betreten
	begin
		if falling_edge(fsync) or rising_edge(fsync) then	  -- Wenn fsync sich ändert wird counter zurückgesetzt
			counter <= "10001";
		elsif falling_edge (sclk) then					      -- wenn es sich um eine fallende Kante von sclk handelt
			case fsync is 								      					   -- Je nach aktuellem Wert von fsync wird ...
				when '1' => ileft (to_integer(unsigned(counter))) <= sdata;        -- ... sdata in den 'linken' Vektor an Stelle 'counter' eingefügt
				when others => iright (to_integer(unsigned(counter))) <= sdata;    -- ... oder in den 'rechten' Vektor eingefügt
			end case;
			if counter > 0 then
				counter <= counter - 1 ;					  -- nach dem Einfügen wird counter um 1 dekrementiert
			end if;
			if counter = 0 then							      -- wenn counter = 0, 
				iflag <= iflag + 1;					      	  -- wird i_flag invertiert (markiert, dass left bzw. 
														      -- right nun vollständig ist)
			end if;
		end if;
	end process;

    -------------SPLIT END-------------



    -----------------------------------
    --------------OUTPUT---------------
    -----------------------------------
	hflag <= "1" when iflag = "0"						      -- Wenn i_flag auf 0 gesetzt ist, wird h_flag auf 1 gesetzt.
														      -- Da dies in einem Concurrent Statement geschieht, wird die 
														      -- Aenderung des h_flags erst beim nächsten Durchlauf für
														      -- die anderen Statements sichtbar, was ermöglich, dass
														      -- das Ausgabeflag im nächsten Takt wieder auf 0 gesetzt wird.
														      -- wenn i_flag auf 1 gesetzt ist, wird h_flag auf wieder auf 0 gesetzt
			else "0";

	rightold <= iright when iflag = "0" and hflag = "0"   	  -- erst wenn i_flag wieder auf 0 gesetzt wurde (also nach 
														      -- einem kompletten left-right Zyklus) und das Hilfsflag 
														      -- auf 0 steht (siehe h_flag), wird dem Ausgang 'right' der
														      -- neue Wert von i_right zugewiesen
				else rightold;								  -- ansonsten bleibt der Wert von right beibehalten.
	leftold <= ileft when iflag = "0" and hflag = "0"	   	  -- analog zur Zuweisung von right
				else leftold;

	left <= leftold;
	right <= rightold;

	flag <= '1' when iflag = "0" and hflag = "0"		      -- Ausgabeflag wird für einen Takt auf 1 gesetzt wenn i_flag 
														      -- auf 0 steht (also nach einem kompletten left-right Zyklus)
														      -- und h_flag auch auf 0 steht.
				else '0';								      -- Da h_flag im nächsten Durchlauf bereits auf 1 steht (siehe h_flag) 
														      -- wird Ausgabeflag im nächsten Durchlauf wieder auf 0 gesetzt.

    -------------OUTPUT END------------      
                                                              
end converter;

----------ARCHITECTURE END---------



