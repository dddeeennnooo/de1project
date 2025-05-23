library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric.std.all;

entity Timer_v1 is 
generic(ClockFrequency : integer);
port (
    Clk : in std_logic;
    nRst : in std_logic;
    Seconds : out integer;
    Minutes : out integer;
    Hours  : out integer);

end entity;    

architecture rtl of Timer_v1 is


   
    signal Ticks : integer;

    begin

        process(Clk) is
            begin
                if rising_edge(Clk) then

                    --If the negative reset signal is active
                    if nRst = '0' then
                        Ticks <= 0;
                        Seconds <= 0;
                        Minutes <= 0;
                        Hours <= 0;

                        
                    else
                      
                        if Ticks = ClockFrequency - 1 then 
                            Ticks <= 0; 
                            
                           
                            if Seconds = 59 then
                                Seconds <= 0;
                                
                                if Minutes = 59 then
                                    Minutes = 0;
                                    
                                    if Hours = 23 then
                                        Hours <= 0;
                                    else 
                                        Hours <= Hours + 1;
                                    end if;            

                                else
                                    Minutes <= Minutes + 1;    
                                end if;    
                            else 
                                Seconds <= Seconds + 1;
                            end if;    

                    else
                        Ticks <= Ticks + 1;
                    end if;                        

                    end if;
                end if;
        end process;
end architecture;                                                                              
