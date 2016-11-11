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
generic(n: natural :=2);
port(   A: in std_logic_vector(n-1 downto 0);
        B: in std_logic_vector(n-1 downto 0);
        En: in std_logic;
        Q: out std_logic_vector(n-1 downto 0);
        R: out std_logic_vector(n-1 downto 0)
); 
end pipeline_divide;

architecture Behavioral of pipeline_divide is

-- signal declarations

begin

    Q <= (A and B);
    R <= (A and B);

end Behavioral;
