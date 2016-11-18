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

entity basic_divide is
--  Port ( );
generic(n: integer :=16; stages: integer :=3);
port(   A: in std_logic_vector(n-1 downto 0);
        B: in std_logic_vector(n-1 downto 0);
        En: in std_logic;
        Q: out std_logic_vector(n-1 downto 0);
        R: out std_logic_vector(n-1 downto 0);
        DATA_RDY: out std_logic
);
end basic_divide;

architecture Behavioral of basic_divide is

-- signal declarations

signal div1,div2, quo: integer range 0 to 65535;

begin



    process(aint, bint, Clk)




    -- variable temp1, temp2: integer range 0 to 65535;
	variable temp1, temp2, tmp, tmp3: std_logic_vector (n-1 downto 0);
    variable y : std_logic_vector (n-1 downto 0);

    begin
       div1 <= n;
       div2 <= stages;
       quo <= div1 / div2;
        temp1:=A;
        temp2:=B;
        for i in n-1 downto 0 loop
          if i = n-1 or i mod quo = 0 then
    				if rising_edge(Clk) then
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
            else
              temp1 := last_temp1;
              temp2 := last_temp2;
              tmp3:= last_tmp3;
              y(i) := last_y(i);
    				end if;
          else
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
          end if;
          if i = 0 then
            R <= Tmp3;
            Q <= y;
            DATA_RDY <= '1'
          end if;

        end loop;

    end process;

end Behavioral;
