----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2016 09:39:57 PM
-- Design Name: 
-- Module Name: divide_block - Behavioral
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

entity divide_block is
generic(n: natural :=16;
        stage: natural := 0);
        
port(   Ain: in std_logic_vector(n-1 downto 0);
        Ainitial: in std_logic_vector(n-1 downto 0);
        Bin: in std_logic_vector(n-1 downto 0);
        Rin: in std_logic_vector(n-1 downto 0);        
--        Stage: in std_logic_vector(n-1 downto 0);
        Q: out std_logic;
        Aout: out std_logic_vector(n-1 downto 0);
        Bout: out std_logic_vector(n-1 downto 0);
        Rout: inout std_logic_vector(n-1 downto 0)
);
--  Port ( );
end divide_block;

architecture Behavioral of divide_block is

signal i : integer range 0 to 65535;
signal temp: std_logic_vector(n-1 downto 0);

begin
--    i <= CONV_INTEGER(Stage);
    i <= stage ;
    process(Ain, Bin, Rin, i)
    
    begin
--        temp <= std_logic_vector(conv_unsigned ((1),n));
        temp <= std_logic_vector(conv_unsigned (conv_integer(unsigned(Ain(n-1 DOWNTO i))),n));
        if temp >= Bin then
            Q <= '1';
            Rout <= temp - Bin;
            if i /= 0 then
                Aout(n-1 downto i) <= Rout(n-1-i downto 0);
                Aout(i-1) <= Ainitial(i-1);
            end if;
        else
            Q <= '0';
            Rout <= temp;
            Aout<= Ain;            
        end if;
        Bout <= temp;
    end process;

end Behavioral;
