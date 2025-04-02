-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Wed, 02 Apr 2025 08:07:08 GMT
-- Request id : cfwk-fed377c2-67ecf02c43c26

library ieee;
use ieee.std_logic_1164.all;

entity tb_Timer_v1 is
end tb_Timer_v1;

architecture tb of tb_Timer_v1 is

    component Timer_v1
        port (Clk     : in std_logic;
              nRst    : in std_logic;
              Seconds : inout integer;
              Minutes : inout integer;
              Hours   : inout integer);
    end component;

    signal Clk     : std_logic;
    signal nRst    : std_logic;
    signal Seconds : integer;
    signal Minutes : integer;
    signal Hours   : integer;

    constant TbPeriod : time := 1000 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Timer_v1
    port map (Clk     => Clk,
              nRst    => nRst,
              Seconds => Seconds,
              Minutes => Minutes,
              Hours   => Hours);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that Clk is really your main clock signal
    Clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed

        -- Reset generation
        -- ***EDIT*** Check that nRst is really your reset signal
        nRst <= '1';
        wait for 100 ns;
        nRst <= '0';
        wait for 100 ns;

        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Timer_v1 of tb_Timer_v1 is
    for tb
    end for;
end cfg_tb_Timer_v1;