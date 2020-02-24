// This draws one block. Arguments:
// 0 - x
// 1 - y
// 2 - wallU (string)
// 3 - wallR (string)
// 4 - wallD (string)
// 5 - wallL (string)
// 6 - color (string)
// 7 - special (string)
// 8 - Discovered? (draw or not)

if argument8=1 {
draw_set_alpha(1)
//fondo (bg)
if argument6="B" draw_set_color(c_blue)
if argument6="G" draw_set_color(c_teal)
if argument6="R" draw_set_color(c_green)
draw_rectangle(argument0,argument1,argument0+7,argument1+7,0)

//walls (despues del fondo!)
draw_set_color(c_white)
if argument2="1" draw_line(argument0,argument1,argument0+8,argument1)
if argument4="1" draw_line(argument0,argument1+7,argument0+8,argument1+7)
if argument5="1" draw_line(argument0,argument1,argument0,argument1+8)
if argument3="1" draw_line(argument0+7,argument1,argument0+7,argument1+8)
if argument2="2" {draw_line(argument0,argument1,argument0+2,argument1);draw_line(argument0+6,argument1,argument0+8,argument1)}
if argument4="2" {draw_line(argument0,argument1+7,argument0+2,argument1+7);draw_line(argument0+6,argument1+7,argument0+8,argument1+7)}
if argument5="2" {draw_line(argument0,argument1,argument0,argument1+2);draw_line(argument0,argument1+6,argument0,argument1+8)}
if argument3="2" {draw_line(argument0+7,argument1,argument0+7,argument1+2);draw_line(argument0+7,argument1+6,argument0+7,argument1+8)}

if argument7="1" draw_sprite(sMapSP,0,argument0,argument1)
if argument7="2" draw_sprite(sMapSP,1,argument0,argument1)
if argument7="3" draw_sprite(sMapSP,2,argument0,argument1)
if argument7="4" draw_sprite(sMapSP,3,argument0,argument1)
if argument7="5" draw_sprite(sMapSP,4,argument0,argument1)
}
