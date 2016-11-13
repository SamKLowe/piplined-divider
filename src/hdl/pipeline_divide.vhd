----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2016 03:25:57 PM
-- Design Name: 
-- Module Name: pipeline_divide - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipeline_divide is
--  Port ( );
generic(n: natural :=16);
port(   A: in std_logic_vector(n-1 downto 0);
        B: in std_logic_vector(n-1 downto 0);
        En: in std_logic;
        Q: out std_logic_vector(n-1 downto 0);
        R: out std_logic_vector(n-1 downto 0)
); 
end pipeline_divide;

architecture Behavioral of pipeline_divide is

-- signal declarations

signal aint,bint: integer range 0 to 65535;

begin
    aint <= CONV_INTEGER(A);
    bint <= CONV_INTEGER(B);
    process(aint, bint)
    
    -- variable temp1, temp2: integer range 0 to 65535;
	variable temp1, temp2, tmp, tmp3: std_logic_vector (n-1 downto 0);
    variable y : std_logic_vector (n-1 downto 0);
    
    begin
        temp1:=A;
        temp2:=B;
        for i in n-1 downto 0 loop
			Tmp:= std_logic_vector(conv_unsigned (unsigned(temp1(n-1 DOWNTO i)),n));
            if Tmp >= temp2 then
                y(i):= '1';
                Tmp3 := Tmp - temp2;
				if i /= 0 then
					temp1(n-1 downto i) := Tmp3(n-1-i downto 0);
					temp1(i-1) := A(i-1);
				end if;
            else
				y(i):= '0';
				Tmp3 := Tmp;
            end if;
        end loop;
        R <= Tmp3;
        Q <= y;   
    end process;         

end Behavioral;