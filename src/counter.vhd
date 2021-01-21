entity counter is
    port(count: std_logic_vector(8 downto 1); --the msb is buffer(8)
      
      clk: in std_logic	;
      reset: in std_logic);
      
  end;
  
  architecture only of counter is 
    constant tpd_reset_to_count:time:=10ns;
    constant tpd_clk_to_count : time:= 5ns;
    
    function increment(val: bit_vector) return bit_vector
    is
      
      -- normalize indexing
      
      alias input: bit_vector(val'length downto 1) is val;
      variable result: bit_vector(input'range) := input;
      variable carry:bit :='1';
      
      begin
        for i in input'low to input'high loop
          result(i):=input(i) xor carry;
          carry := input(i) and carry;
        end loop;
        return result;
      end increment;
      
    begin
      ctr:
      process(clk, reset)
        begin
          if (reset='1') then
            if reset'event then
              count<=(others=>'0') after tpd_reset_to_count;
            end if;
          elsif clk'event and (clk='1') then
            count<=increment(count) after tpd_clk_to_count;
          end if;
        end process;
      end only;
