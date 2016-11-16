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
generic(div_width: natural :=16;
		stages: natural := 2
		);
		
port(   A: in std_logic_vector(div_width-1 downto 0);
        B: in std_logic_vector(div_width-1 downto 0);
        En: in std_logic;
        Q: out std_logic_vector(div_width-1 downto 0);
        R: out std_logic_vector(div_width-1 downto 0)
		
); 
end pipeline_divide;

architecture Behavioral of pipeline_divide is

-- signal declarations
    
    component divide_block
        generic(n: integer;
                stage: integer); 
        port(   Ain: in std_logic_vector(div_width-1 downto 0);
            Ainitial: in std_logic_vector(div_width-1 downto 0);
            Bin: in std_logic_vector(div_width-1 downto 0);
            Rin: in std_logic_vector(div_width-1 downto 0);        
--            Stage: in std_logic_vector(div_width-1 downto 0);
            Q: out std_logic;
            Aout: out std_logic_vector(div_width-1 downto 0);
            Bout: out std_logic_vector(div_width-1 downto 0);
            Rout: inout std_logic_vector(div_width-1 downto 0)
    );
    end component;
    
    type signal_bus is array (0 to div_width-1) of std_logic_vector(div_width-1 downto 0);
    signal A_i : signal_bus;
    signal B_i : signal_bus;
    signal R_i : signal_bus;
--    signal S_i : signal_bus;
    signal Zeros_int :  integer range 0 to 65535 := 0;
    signal Zeros : std_logic_vector(div_width-1 downto 0);

begin
--    process(Clk)
   Zeros <= std_logic_vector(conv_unsigned (Zeros_int, div_width));
--    begin
   DIVIDER: for i in (div_width - 1) downto 0 generate
--        S_i(i) <= std_logic_vector(conv_unsigned (i, div_width));
        --first in line
        FIRST: if i = div_width - 1 generate
            UX : divide_block generic map(n => div_width, stage => i) port map (
                Ain  =>         A, 
                Ainitial  =>    A, 
                Bin  =>         B, 
                Rin  =>         Zeros, 
--                Stage  =>       S_i(i), 
                Q  =>           Q(i), 
                Aout  =>        A_i(i), 
                Bout  =>        B_i(i), 
                Rout  =>        R_i(i)
                );
        end generate FIRST;
        --all the middle stages
        REST: if i < div_width - 1 generate
            U0 : divide_block generic map(div_width, i) port map (
                Ain  =>         A_i(i+1), 
                Ainitial  =>    A, 
                Bin  =>         B, 
                Rin  =>         R_i(i+1), 
--                Stage  =>       S_i(i), 
                Q  =>           Q(i), 
                Aout  =>        A_i(i), 
                Bout  =>        B_i(i), 
                Rout  =>        R_i(i)
                );
        end generate REST;            
    end generate DIVIDER;	
		R <= R_i(0);
--    end process;
end Behavioral;




