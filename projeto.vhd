library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY projeto IS

port
(
	clk: in std_logic;
	rst: in std_logic;
	input1 : in std_logic_vector (0 to 3);
	input2 : in std_logic_vector (0 to 3);
	button : in std_logic;
	output1 : out std_logic_vector (0 to 7);
	output2 : out std_logic
	
);

END projeto;
	
architecture rtl of projeto is

signal op : integer := 0;
signal resultado : std_logic_vector(0 to 4); 
	
begin

		process (clk,button) is
		begin
		if rising_edge(clk) then
			if button = '0' then
				if op = 7 then
					op <= 1;
				else
					op <= op + 1;
				end if;
				end if;
				end if;
		
		 end process;
		 
		 process(clk) is
		 begin
		 if rising_edge(clk) then
			case(op) is
				when 1 => resultado <= ('0' & input1) + ('0' & input2 );  -- soma
				when 2 => resultado <= ('0' & input1) - ('0' & input2 );  -- subtração
				WHEN others => resultado <= "11111";
			end case;
			
		end if;
	end process;
	
	process(resultado) is
	
	begin
	
	case resultado is
			when "00001" =>
			output1 <= "00000010";
			when "10100"=>
			output1 <= "00000011";
							
			when others => 
			output1 <= "00000011";
			
		end case;
		end process;
		 
	
END rtl;
	