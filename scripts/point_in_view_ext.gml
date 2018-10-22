/// point_in_view_ext(view number,x,y,leeway);
// Leeway is the amount in pixels that the game checks outside the view.
// Setting leeway to 0 is the exact same as just using point_in_view.
if  (argument1>(view_xview[argument0]-argument3)) && (argument1<(view_xview[argument0]+view_wview[argument0]+argument3)) &&
    (argument2>(view_yview[argument0]-argument3)) && (argument2<(view_yview[argument0]+view_hview[argument0]+argument3))
    {return(1)}else{return(0)}
// Unknown source.
