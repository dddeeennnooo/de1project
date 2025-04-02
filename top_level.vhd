library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top_Level_Timer is
    generic (ClockFrequency : integer := 50_000_000); -- Example clock frequency (50MHz)
    port (
        Clk    : in std_logic;
        nRst   : in std_logic;
        SecOut : out integer;
        MinOut : out integer;
        HourOut : out integer
    );
end entity;

architecture struct of Top_Level_Timer is
    
    -- Signals to connect to Timer_v1
    signal Seconds : integer := 0;
    signal Minutes : integer := 0;
    signal Hours   : integer := 0;

begin
    
    -- Instantiation of Timer_v1
    Timer_Instance : entity work.Timer_v1
        generic map (ClockFrequency => ClockFrequency)
        port map (
            Clk     => Clk,
            nRst    => nRst,
            Seconds => Seconds,
            Minutes => Minutes,
            Hours   => Hours
        );
    
    -- Assign internal signals to output ports
    SecOut <= Seconds;
    MinOut <= Minutes;
    HourOut <= Hours;
    
end architecture;