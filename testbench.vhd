LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
	--
END testbench;

ARCHITECTURE tb OF testbench IS

	-- DUT component
	COMPONENT shiftrotater IS
		PORT 
		(
			din    : IN std_logic_vector(3 DOWNTO 0);
			desloc : IN std_logic_vector(1 DOWNTO 0);
			shift  : IN std_logic;
			dout   : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL din    : std_logic_vector(3 DOWNTO 0);
	SIGNAL desloc : std_logic_vector(1 DOWNTO 0);
	SIGNAL shift  : std_logic;
	SIGNAL dout   : std_logic_vector(3 DOWNTO 0);

BEGIN
	-- Connect DUT
	DUT : shiftrotater
	PORT MAP(din, desloc, shift, dout);

	PROCESS
	BEGIN
		din    <= "0110";
		desloc <= "00";
		shift  <= '0';
		WAIT FOR 1 ns;
		ASSERT(dout = "0110") REPORT "Fail CASE 1" SEVERITY error;
 
 
		din    <= "0110";
		desloc <= "01";
		shift  <= '0';
		WAIT FOR 1 ns;
		ASSERT(dout = "1100") REPORT "Fail CASE 2" SEVERITY error;
 
 
		din    <= "0110";
		desloc <= "10";
		shift  <= '0';
		WAIT FOR 1 ns;
		ASSERT(dout = "1001") REPORT "Fail CASE 3" SEVERITY error;
 
 
		din    <= "0110";
		desloc <= "11";
		shift  <= '0';
		WAIT FOR 1 ns;
		ASSERT(dout = "0011") REPORT "Fail CASE 4" SEVERITY error;
 
 
		din    <= "1111";
		desloc <= "00";
		shift  <= '1';
		WAIT FOR 1 ns;
		ASSERT(dout = "1111") REPORT "Fail CASE Shift 1" SEVERITY error;
 
 
		din    <= "1111";
		desloc <= "01";
		shift  <= '1';
		WAIT FOR 1 ns;
		ASSERT(dout = "1110") REPORT "Fail CASE Shift 2" SEVERITY error;
 
 
		din    <= "1111";
		desloc <= "10";
		shift  <= '1';
		WAIT FOR 1 ns;
		ASSERT(dout = "1100") REPORT "Fail CASE Shift 3" SEVERITY error;
 
 
		din    <= "1111";
		desloc <= "11";
		shift  <= '1';
		WAIT FOR 1 ns;
		ASSERT(dout = "1000") REPORT "Fail CASE Shift 4" SEVERITY error;
 
 
		WAIT;
	END PROCESS;
END tb;