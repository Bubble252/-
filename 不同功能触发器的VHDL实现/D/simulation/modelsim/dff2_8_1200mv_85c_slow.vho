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

-- DATE "06/24/2024 12:59:36"

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

ENTITY 	dff2 IS
    PORT (
	CLK : IN std_logic;
	RST : IN std_logic;
	EN : IN std_logic;
	D : IN std_logic;
	Q : OUT std_logic
	);
END dff2;

-- Design Ports Information
-- Q	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- EN	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF dff2 IS
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
SIGNAL ww_RST : std_logic;
SIGNAL ww_EN : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL \EN~input_o\ : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \Q1~0_combout\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \Q1~q\ : std_logic;
SIGNAL \ALT_INV_RST~input_o\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
ww_EN <= EN;
ww_D <= D;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_RST~input_o\ <= NOT \RST~input_o\;

-- Location: IOIBUF_X0_Y21_N8
\EN~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EN,
	o => \EN~input_o\);

-- Location: IOOBUF_X0_Y23_N9
\Q~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q1~q\,
	devoe => ww_devoe,
	o => \Q~output_o\);

-- Location: IOIBUF_X0_Y22_N1
\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X0_Y22_N15
\D~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

-- Location: LCCOMB_X1_Y22_N0
\Q1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q1~0_combout\ = (\EN~input_o\ & ((\D~input_o\))) # (!\EN~input_o\ & (\Q1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \EN~input_o\,
	datac => \Q1~q\,
	datad => \D~input_o\,
	combout => \Q1~0_combout\);

-- Location: IOIBUF_X0_Y23_N1
\RST~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: FF_X1_Y22_N1
Q1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q1~0_combout\,
	clrn => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q1~q\);

ww_Q <= \Q~output_o\;
END structure;


