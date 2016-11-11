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
port(   A: in std_logic_vector(15 downto 0);
        B: in std_logic_vector(15 downto 0);
        En: in std_logic;
        Q: out std_logic_vector(15 downto 0);
        R: out std_logic_vector(15 downto 0)
); 
end pipeline_divide;

architecture Behavioral of pipeline_divide is

-- signal declarations

signal aint,bint: integer range 0 to 65535;

begin
    aint <= CONV_INTEGER(A);
    bint <= CONV_INTEGER(B);
    process(aint, bint)
    
    variable temp1, temp2: integer range 0 to 65535;
    variable y : std_logic_vector (15 downto 0);
    
    begin
        temp1:=aint;
        temp2:=bint;
        for i in 15 downto 0 loop
            if (temp1 > temp2 * 2 **i) then
                y(i):= '0';
                temp1 := temp1-temp2 * 2 ** i;
            else y(i):= '0';
            end if;
        end loop;
        R <= CONV_STD_LOGIC_VECTOR (temp1, 16);
        Q <= y;   
    end process;         

end Behavioral;
