--------------------------------------------------------------------------------
--
-- Title       : 	Registro de desplazamiento
-- Author      :	Ignacio Aznarez Ramos
-- Company     :	Universidad de Nebrija
--------------------------------------------------------------------------------
-- File        : shift_register.vhd
-- Generated   : February 2024
--------------------------------------------------------------------------------
-- Description : 
	
--------------------------------------------------------------------------------
-- Revision History :
-- -----------------------------------------------------------------------------

--   Ver  :| Author            :| Mod. Date :|    Changes Made:

--   v1.0  | Ignacio Aznarez   :| Feb/24    :| First version

-- -----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;


entity shift_register is
	generic(
		g_N	: integer := 16         -- Size of the register
	);
	port (
		rst_n		: in std_logic; -- asynchronous reset, low active
		clk 		: in std_logic; -- system clk
		s0          : in std_logic;
		s1          : in std_logic;
		din   		: in std_logic; -- Serial IN. One bit serial input
		D  	      	: in std_logic_vector(g_N-1 downto 0);-- Paralel IN. Vector of generic g_n bits.
		Q         	: out std_logic_vector(g_N-1 downto 0);-- Paralel OUT. 
		dout     	: out std_logic -- Serial OUT.
	);
end shift_register;

architecture behavioural of shift_register is

    --- Define la se?al interna para el registro
    signal temporal: std_logic_vector(g_N-1 downto 0);
    signal s_o: std_logic;

    begin
    
    process (rst_n, clk)
    begin
        if rst_n = '0' then

            --- Reset asincrono del registro
            temporal <= (others => '0');
        elsif rising_edge(clk) then
            ------------------------
            -- Completar la l?gica combinacional de acuerdo a los valores de entrada s0 y s1
            -----------------------
            if s0 = '0' and s1 = '1' then
                s_o <= temporal(g_N-1);
                temporal <= temporal(g_N-2 downto 0) & din;
            elsif s0 = '1' and s1 = '0' then
                s_o <= temporal(0);
                temporal <= din & temporal(g_N-1 downto 1);
            elsif s0 = '1' and s1 = '1' then
                temporal <= D;
            end if;
        end if;       
    end process;
    
    ------------------------
    -- Completar con la asignaci?n final a Q y dout con los valores correspondientes del registro
    ------------------------
    Q <= temporal;
    dout <= s_o;
end behavioural;



