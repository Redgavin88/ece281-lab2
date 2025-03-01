----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 08:35:41 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - test_bench
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

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is 
        Port ( 
        i_hex : in STD_LOGIC_VECTOR (3 downto 0);
        o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
        
    end component;
    
    signal w_sw : std_logic_vector (3 downto 0):= (others=> '0');
    signal w_Y : std_logic_vector (6 downto 0);
begin 
    sevenseg_decoder_inst : sevenseg_decoder port map(
        i_hex => w_sw,
            o_seg_n => w_Y
    );
    
        
        test_process : process
        begin
              w_sw <= x"0"; wait for 10 ns;
                   assert w_Y = "1000000" report "error on x0" severity failure;
              w_sw <= x"A"; wait for 10 ns;
                   assert w_Y = "0001000" report "error on xA" severity failure;
              w_sw <= x"E"; wait for 10 ns;
                   assert w_Y = "0000110" report "error on xE" severity failure;
              wait;
        end process;

end test_bench;