-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "06/24/2024 13:04:53"

-- 
-- Device: Altera EP4CE10F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	JK IS
    PORT (
	CLK : IN std_logic;
	J : IN std_logic;
	K : IN std_logic;
	Q : OUT std_logic;
	NQ : OUT std_logic
	);
END JK;

-- Design Ports Information
-- Q	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NQ	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- J	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- K	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF JK IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_J : std_logic;
SIGNAL ww_K : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_NQ : std_logic;
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \NQ~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \K~input_o\ : std_logic;
SIGNAL \Q_TEMP~0_combout\ : std_logic;
SIGNAL \J~input_o\ : std_logic;
SIGNAL \Q_TEMP~1_combout\ : std_logic;
SIGNAL \Q_TEMP~q\ : std_logic;
SIGNAL \NQ_TEMP~0_combout\ : std_logic;
SIGNAL \NQ_TEMP~q\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_J <= J;
ww_K <= K;
Q <= ww_Q;
NQ <= ww_NQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);

-- Location: IOOBUF_X0_Y19_N23
\Q~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q_TEMP~q\,
	devoe => ww_devoe,
	o => \Q~output_o\);

-- Location: IOOBUF_X0_Y19_N16
\NQ~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NQ_TEMP~q\,
	devoe => ww_devoe,
	o => \NQ~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G2
\CLK~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y19_N1
\K~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_K,
	o => \K~input_o\);

-- Location: LCCOMB_X1_Y19_N16
\Q_TEMP~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q_TEMP~0_combout\ = (\J~input_o\ & ((!\K~input_o\) # (!\Q_TEMP~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \J~input_o\,
	datac => \Q_TEMP~q\,
	datad => \K~input_o\,
	combout => \Q_TEMP~0_combout\);

-- Location: IOIBUF_X0_Y18_N15
\J~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_J,
	o => \J~input_o\);

-- Location: LCCOMB_X1_Y19_N0
\Q_TEMP~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q_TEMP~1_combout\ = (\J~input_o\) # (\K~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \J~input_o\,
	datad => \K~input_o\,
	combout => \Q_TEMP~1_combout\);

-- Location: FF_X1_Y19_N17
Q_TEMP : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Q_TEMP~0_combout\,
	ena => \Q_TEMP~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q_TEMP~q\);

-- Location: LCCOMB_X1_Y19_N14
\NQ_TEMP~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \NQ_TEMP~0_combout\ = ((!\NQ_TEMP~q\ & \K~input_o\)) # (!\J~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \J~input_o\,
	datac => \NQ_TEMP~q\,
	datad => \K~input_o\,
	combout => \NQ_TEMP~0_combout\);

-- Location: FF_X1_Y19_N15
NQ_TEMP : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \NQ_TEMP~0_combout\,
	ena => \Q_TEMP~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NQ_TEMP~q\);

ww_Q <= \Q~output_o\;

ww_NQ <= \NQ~output_o\;
END structure;


