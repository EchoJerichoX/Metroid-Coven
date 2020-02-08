if (fadealphagoal = 1) and (fadealpha < fadealphagoal) fadealpha += fadealpharate;
if (fadealphagoal = 0) and (fadealpha > fadealphagoal) fadealpha -= fadealpharate;
if (fadealpha > 0)
{
    draw_set_color(fadecolor);
    draw_set_alpha(fadealpha);
    draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
}
