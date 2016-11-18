----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2016 03:37:31 PM
-- Design Name: 
-- Module Name: divide_tb - Behavioral
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

--entity declaration
entity divide_tb is
--  Port ( );
end divide_tb;


architecture Behavioral of divide_tb is

--    component pipeline_divide is
--    generic(div_width: natural
----            stages: natural
--            );
--    port(   A: in std_logic_vector(15 downto 0);
--            B: in std_logic_vector(15 downto 0);
--            En: in std_logic;
--            Q: out std_logic_vector(15 downto 0);
--            R: out std_logic_vector(15 downto 0)
--    ); 
--    end component;

    component loop_divide is
    generic(n: natural;
            stages: natural
            );
    port(   A: in std_logic_vector(15 downto 0);
            B: in std_logic_vector(15 downto 0);
            En: in std_logic;
            Clk: in std_logic;
            Q: out std_logic_vector(15 downto 0);
            R: out std_logic_vector(15 downto 0);
            DATA_RDY: out std_logic
    ); 
    end component;
    
    constant div_width: natural := 16;
    constant stages: natural := 2;
    
    signal A, B:    std_logic_vector(div_width-1 downto 0);
    signal En, clk, DATA_RDY:      std_logic;
    signal Q, R:    std_logic_vector(div_width-1 downto 0);   
    constant clk_period : time := 10 ns;
    
    begin
    
--    u_pipeline_divide: pipeline_divide generic map(div_width) port map(A, B, EN, Q, R);
--    u_pipeline_divide: pipeline_divide generic map(div_width) port map(A, B, EN, Q, R);
    u_pipeline_divide: loop_divide generic map(div_width, stages) port map(A, B, EN, clk, Q, R, DATA_RDY);
    
    -- generate a clock
    clk_process :process
    begin
         clk <= '0';
         wait for clk_period/2;  --for 0.5 ns signal is '0'.
         clk <= '1';
         wait for clk_period/2;  --for next 0.5 ns signal is '1'.
    end process;
    
    
    process
    
        variable err_cnt: integer :=0;
    
        begin
        
            -- case 1 1000/10
        A <= std_logic_vector(conv_unsigned ((2),div_width));                            
        B <= std_logic_vector(conv_unsigned ((2),div_width));   
        En <= '1';
        wait for 10 ns;
            
         -- case 2         
        A <= std_logic_vector(conv_unsigned ((3),div_width));                            
        B <= std_logic_vector(conv_unsigned ((2),div_width));  
        En <= '1';
        wait for 10 ns;
            
        -- case 3
        A <= std_logic_vector(conv_unsigned ((4),div_width));                            
        B <= std_logic_vector(conv_unsigned ((2),div_width));  
        En <= '1';
        wait for 10 ns;
            
        -- case 4
        A <= std_logic_vector(conv_unsigned ((5),div_width));                            
        B <= std_logic_vector(conv_unsigned ((2),div_width));  
        En <= '1';
        wait for 10 ns;
            
        -- case 5
        A <= std_logic_vector(conv_unsigned ((6),div_width));                            
        B <= std_logic_vector(conv_unsigned ((2),div_width));  
        En <= '1';
        wait for 10 ns;
        
        wait;
    
    end process;  
    

end Behavioral;
