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

    component pipeline_divide is
    port(   A: in std_logic_vector(1 downto 0);
            B: in std_logic_vector(1 downto 0);
            En: in std_logic;
            Q: out std_logic_vector(1 downto 0);
            R: out std_logic_vector(1 downto 0)
    ); 
    end component;
    
    signal A, B:    std_logic_vector(1 downto 0);
    signal En:      std_logic;
    signal Q, R:    std_logic_vector(1 downto 0);   
    
    begin
    
    u_pipeline_divide: pipeline_divide port map(A, B, EN, Q, R);
    
    process
    
        variable err_cnt: integer :=0;
    
        begin
        
            -- case 1
        A <= "00";                            
        B <= "00";
        En <= '1';
        wait for 10 ns;
            
         -- case 2         
        A <= "11";
        B <= "11";
        En <= '1';
        wait for 10 ns;
            
        -- case 3
        A <= "01";
        B <= "10";
        En <= '1';
        wait for 10 ns;
            
        -- case 4
        A <= "10";
        B <= "01";
        En <= '1';
        wait for 10 ns;
            
        -- case 5
        A <= "01";
        B <= "01";
        En <= '1';
        wait for 10 ns;
        
        -- wait;
    
    end process;  
    

end Behavioral;