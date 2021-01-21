LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY wpointer IS
   PORT (--
         wclk                : IN std_logic;
         rstb                : IN std_logic;
         --
         wpointer_enable     : IN std_logic;
         wpointer_load       : IN std_logic;
         --
         wpointer_addr       : OUT std_logic_vector (4 DOWNTO 0)
   );
END wpointer;
ARCHITECTURE behav OF wpointer IS
-- declare components here
--
-- declare signals here
SIGNAL counter_load    : std_logic;
SIGNAL counter_enable  : std_logic;
SIGNAL count_i         : unsigned (4 DOWNTO 0); 
--
-- declare constants here
--
BEGIN
   wpointer_addr <= std_logic_vector(count_i);
   sequential:
   PROCESS (rstb, wclk)
      BEGIN
         IF(rstb /= '1') THEN
            count_i <= (OTHERS => '0');
         ELSIF (wclk'EVENT AND wclk = '0') THEN
            IF (counter_load = '1') THEN
               count_i <= (OTHERS => '0');
            ELSIF (counter_enable = '1') THEN
               count_i <= count_i + 1;
            ELSE
               count_i <= count_i;
            END IF;
         END IF;
   END PROCESS sequential;
   combinational:
   PROCESS (count_i, wpointer_load, wpointer_enable)
   BEGIN
      IF(wpointer_load = '1' OR count_i > "11111") THEN
         counter_load <= '1';
      ELSE 
         counter_load <= '0';
      END IF;

      IF(wpointer_enable = '1') THEN
         counter_enable <= '1';
      ELSE 
         counter_enable <= '0';
      END IF;
   END PROCESS combinational;
END behav; 
