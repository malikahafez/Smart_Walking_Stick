library ieee;
use IEEE.STD_LOGIC_1164.ALL;

entity walking_stick is
    Port (
	     
        touch_sensor1 : in  std_logic;
		  touch_sensor2 : in  std_logic;
		  touch_sensor3 : in  std_logic;
		  touch_sensor4 : in  std_logic;
		 
        ir_sensor    : in  std_logic;  
        buzzer       : out std_logic;   
        motor        : out std_logic ;   
		  button       : in std_logic 
    );
end walking_stick;

architecture Behavioral of walking_stick is
    signal buzzer_state : std_logic := '1'; 
    signal motor_state  : std_logic := '1'; 
	 signal sensor_state : std_logic; 
	  signal ir_state : std_logic; 
begin
	sensor_state <= touch_sensor1 OR touch_sensor2 OR touch_sensor3 OR touch_sensor4;
	ir_state <= ir_sensor;  
    process(ir_state,sensor_state,button)
    begin
        if button='1' then
            
            if sensor_state = '1' then
                buzzer_state <= '0'; 
            else
                buzzer_state <= '1'; 
            end if;

            -- 
            if ir_state = '1' then  
                motor_state <= '0';  
            else
                motor_state <= '1'; 
            end if;
				else  
				  motor_state <= '0';  
				  buzzer_state <= '0';
				  
        end if;
    end process;

    -- Assign outputs to internal signals
    buzzer <= buzzer_state;
    motor  <= motor_state;

end Behavioral;