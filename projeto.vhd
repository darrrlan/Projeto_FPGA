library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY projeto IS

port
(
	input1 : in std_logic_vector (0 to 3);
	input2 : in std_logic_vector (0 to 3);
	btn_op : in std_logic;
	btn_out : in std_logic;
	dsp_op : out std_logic_vector (0 to 6);
	dsp_out: out std_logic_vector (0 to 6) := "1111111";
	dsp_out2: out std_logic_vector (0 to 6) := "1111111";
	dsp_signal: out std_logic := '1';
	led_out : out std_logic_vector (0 to 3)
	
);

END projeto;
	
architecture rtl of projeto is


type states is (Sum, Sub, Ou, E, XOu, No);
signal op : states := sum;
signal in1: integer := 0;
signal in2: integer := 0;
signal resultado : integer := 0; 

	
begin

		process (btn_op) is
		begin

		if rising_edge(btn_op) then
		
			case op is
		
				when sum => op <= sub;
				when sub => op <= ou;
				when ou => op <= E;
				when E => op <= XOu;
				when XOu => op <= No;
				when No => op <= Sum;
				
			end case;
		end if;		
		
		end process;
		 
		process(op) is
		begin
		
		in1 <= to_integer(unsigned(input1));
		in2 <= to_integer(unsigned(input2));	
		
			case op is
				when sum => resultado <= in1 + in2;
				when sub => resultado <= in1 - in2;
				when others => resultado <= 0;
			end case;
		
		end process;
	
	process(btn_out) is
	
	begin
	
	if rising_edge(btn_out) then
	case resultado is
			when 0 =>
			dsp_out <= "0000001"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 1 =>
			dsp_out <= "1001111"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 2 =>
			dsp_out <= "0010010"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 3 =>
			dsp_out <= "0000110"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 4 =>
			dsp_out <= "1001100"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 5 =>
			dsp_out <= "0100100"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 6 =>
			dsp_out <= "0100000"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 7 =>
			dsp_out <= "0001111"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 8 =>
			dsp_out <= "0000000"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 9 =>
			dsp_out <= "0000100"; dsp_out2 <= "0000001"; dsp_signal <= '1';
			when 10 =>
			dsp_out <= "0000001"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 11 =>
			dsp_out <= "1001111"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 12 =>
			dsp_out <= "0010010"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 13 =>
			dsp_out <= "0000110"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 14 =>
			dsp_out <= "1001100"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 15 =>
			dsp_out <= "0100100"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 16 =>
			dsp_out <= "0100000"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 17 =>
			dsp_out <= "0001111"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 18 =>
			dsp_out <= "0000000"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 19 =>
			dsp_out <= "0000100"; dsp_out2 <= "1001111"; dsp_signal <= '1';
			when 20 =>
			dsp_out <= "0000001"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 21 =>
			dsp_out <= "1001111"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 22 =>
			dsp_out <= "0010010"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 23 =>
			dsp_out <= "0000110"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 24 =>
			dsp_out <= "1001100"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 25 =>
			dsp_out <= "0100100"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 26 =>
			dsp_out <= "0100000"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 27 =>
			dsp_out <= "0001111"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 28 =>
			dsp_out <= "0000000"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 29 =>
			dsp_out <= "0000100"; dsp_out2 <= "0010010"; dsp_signal <= '1';
			when 30 =>
			dsp_out <= "0000001"; dsp_out2 <= "0000110"; dsp_signal <= '1';
			when -1 =>
			dsp_out <= "1001111"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -2 =>
			dsp_out <= "0010010"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -3 =>
			dsp_out <= "0000110"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -4 =>
			dsp_out <= "1001100"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -5 =>
			dsp_out <= "0100100"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -6 =>
			dsp_out <= "0100000"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -7 =>
			dsp_out <= "0001111"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -8 =>
			dsp_out <= "0000000"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -9 =>
			dsp_out <= "0000100"; dsp_out2 <= "0000001"; dsp_signal <= '0';
			when -10 =>
			dsp_out <= "0000001"; dsp_out2 <= "1001111"; dsp_signal <= '0';
			when -11 =>
			dsp_out <= "1001111"; dsp_out2 <= "1001111"; dsp_signal <= '0';
			when -12 =>
			dsp_out <= "0010010"; dsp_out2 <= "1001111"; dsp_signal <= '0';
			when -13 =>
			dsp_out <= "0000110"; dsp_out2 <= "1001111"; dsp_signal <= '0';
			when -14 =>
			dsp_out <= "1001100"; dsp_out2 <= "1001111"; dsp_signal <= '0';
			when -15 =>
			dsp_out <= "0100100"; dsp_out2 <= "1001111"; dsp_signal <= '0';
							
			when others => 
			dsp_out <= "1111111"; dsp_out2 <= "1111111";
			
			end case;
		
		end if;
		
		end process;
		 
		 
	process(op)
	begin
		
	case op is 
		when sum => dsp_op <= "1001111"; 
		when sub => dsp_op <= "0010010";
		when Ou => dsp_op <= "0000110";
		when E => dsp_op <= "1001100";
		when XOu => dsp_op <= "0100100";
		when No => dsp_op <= "0100000"; 
	
	end case;
	
	end process;
	
END rtl;
	