----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2026 12:04:44 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is --notice entity is empty.  The testbench has no external connections.
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end component sevenseg_decoder;

  signal w_sw : std_logic_vector (3 downto 0):= (others=> '0');
  signal w_Y : std_logic_vector (6 downto 0) := (others=> '0');

begin

    sevenseg_decoder_inst : sevenseg_decoder port map (
			i_Hex => w_sw,
			o_seg_n => w_Y
			
		------ do I need to swap the port maping here?	
		--	o_seg_n(0) => w_Y(6),
		--	o_seg_n(1) => w_Y(5),
		--	o_seg_n(2) => w_Y(4),
		--	o_seg_n(3) => w_Y(3),
		--	o_seg_n(4) => w_Y(2),
		--	o_seg_n(5) => w_Y(1),
		--	o_seg_n(6) => w_Y(0)
		------
		
        );

	test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
		w_sw <= x"0"; wait for 10 ns;
            assert w_Y = "1111110" report "error on 0000" severity failure;
        w_sw <= x"1"; wait for 10 ns;
            assert w_Y = "0110000" report "error on 0001" severity failure;   
        w_sw <= x"2"; wait for 10 ns;
            assert w_Y = "1101101" report "error on 0010" severity failure;   
        w_sw <= x"3"; wait for 10 ns;
            assert w_Y = "1111001" report "error on 0011" severity failure;   
        w_sw <= x"4"; wait for 10 ns;
            assert w_Y = "0110011" report "error on 0100" severity failure;   
        w_sw <= x"5"; wait for 10 ns;
            assert w_Y = "1011011" report "error on 0101" severity failure;   
        w_sw <= x"6"; wait for 10 ns;
            assert w_Y = "1011111" report "error on 0110" severity failure;   
        w_sw <= x"7"; wait for 10 ns;
            assert w_Y = "1110000" report "error on 0111" severity failure;   
        w_sw <= x"8"; wait for 10 ns;
            assert w_Y = "1111111" report "error on 1000" severity failure;   
        w_sw <= x"9"; wait for 10 ns;
            assert w_Y = "1110011" report "error on 1001" severity failure;   
        w_sw <= x"A"; wait for 10 ns;
            assert w_Y = "1110111" report "error on 1010" severity failure;   
        w_sw <= x"B"; wait for 10 ns;
            assert w_Y = "0011111" report "error on 1011" severity failure;   
        w_sw <= x"C"; wait for 10 ns;
            assert w_Y = "0001101" report "error on 1100" severity failure;   
        w_sw <= x"D"; wait for 10 ns;
            assert w_Y = "0111101" report "error on 1101" severity failure;   
        w_sw <= x"E"; wait for 10 ns;
            assert w_Y = "1001111" report "error on 1110" severity failure;   
        w_sw <= x"F"; wait for 10 ns;
            assert w_Y = "1000111" report "error on 1111" severity failure;   
            
        wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end Behavioral;
