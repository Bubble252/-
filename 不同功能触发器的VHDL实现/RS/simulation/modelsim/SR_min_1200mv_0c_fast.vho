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

-- DATE "06/24/2024 13:02:25"

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

ENTITY 	SR IS
    PORT (
	S : IN std_logic;
	R : IN std_logic;
	CLK : IN std_logic;
	Q : BUFFER std_logic
	);
END SR;

-- Design Ports Information
-- Q	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SR IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_R : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \S~input_o\ : std_logic;
SIGNAL \R~input_o\ : std_logic;
SIGNAL \Q_TEMP~0_combout\ : std_logic;
SIGNAL \Q_TEMP~q\ : std_logic;

BEGIN

ww_S <= S;
ww_R <= R;
ww_CLK <= CLK;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y4_N16
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

-- Location: IOIBUF_X0_Y4_N22
\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X0_Y5_N22
\S~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S,
	o => \S~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\R~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R,
	o => \R~input_o\);

-- Location: LCCOMB_X1_Y4_N16
\Q_TEMP~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q_TEMP~0_combout\ = (\S~input_o\ & ((\Q_TEMP~q\) # (!\R~input_o\))) # (!\S~input_o\ & (\Q_TEMP~q\ & !\R~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S~input_o\,
	datac => \Q_TEMP~q\,
	datad => \R~input_o\,
	combout => \Q_TEMP~0_combout\);

-- Location: FF_X1_Y4_N17
Q_TEMP : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q_TEMP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q_TEMP~q\);

ww_Q <= \Q~output_o\;
END structure;


