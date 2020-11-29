LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2 IS
	PORT 
	(
		i0, i1 : IN std_logic;
		sel    : IN std_logic;
		s      : OUT std_logic
	);
END ENTITY;

ARCHITECTURE behavioral OF mux2 IS
BEGIN
	PROCESS (i0, i1, sel)
	BEGIN
		IF sel = '0' THEN
			s <= i0;
		ELSE
			s <= i1;
		END IF;
	END PROCESS;

END ARCHITECTURE;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY shiftrotater IS
	PORT 
	(
		din    : IN std_logic_vector(3 DOWNTO 0);
		desloc : IN std_logic_vector(1 DOWNTO 0);
		shift  : IN std_logic;
		dout   : OUT std_logic_vector(3 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE structural OF shiftrotater IS
	SIGNAL m : std_logic_vector(0 TO 3);
	SIGNAL f : std_logic_vector(0 TO 3);
	SIGNAL s : std_logic_vector(0 TO 3);

	FUNCTION to_logic(X : BOOLEAN) RETURN std_ulogic IS
	BEGIN
		IF X THEN RETURN ('1');
		ELSE
			RETURN ('0');
		END IF;
	END to_logic;
	BEGIN
		PROCESS (shift, desloc)
		BEGIN
			s(3) <= shift AND to_logic(desloc > "11");
			s(2) <= shift AND to_logic(desloc > "10");
			s(1) <= shift AND to_logic(desloc > "01");
			s(0) <= shift AND to_logic(desloc > "00");
		END PROCESS;

		mux03 : ENTITY work.mux2(behavioral)
			PORT MAP(din(3), din(2), desloc(0), m(3));
		mux02 : ENTITY work.mux2(behavioral)
			PORT MAP(din(2), din(1), desloc(0), m(2));
		mux01 : ENTITY work.mux2(behavioral)
			PORT MAP(din(1), din(0), desloc(0), m(1));
		mux00 : ENTITY work.mux2(behavioral)
			PORT MAP(din(0), din(3), desloc(0), m(0));


		mux13 : ENTITY work.mux2(behavioral)
			PORT MAP(m(3), m(1), desloc(1), f(3));
		mux12 : ENTITY work.mux2(behavioral)
			PORT MAP(m(2), m(0), desloc(1), f(2));
		mux11 : ENTITY work.mux2(behavioral)
			PORT MAP(m(1), m(3), desloc(1), f(1));
		mux10 : ENTITY work.mux2(behavioral)
			PORT MAP(m(0), m(2), desloc(1), f(0));


		mux23 : ENTITY work.mux2(behavioral)
			PORT MAP(f(3), '0', s(3), dout(3));
		mux22 : ENTITY work.mux2(behavioral)
			PORT MAP(f(2), '0', s(2), dout(2));
		mux21 : ENTITY work.mux2(behavioral)
			PORT MAP(f(1), '0', s(1), dout(1));
		mux20 : ENTITY work.mux2(behavioral)
			PORT MAP(f(0), '0', s(0), dout(0));
END ARCHITECTURE;