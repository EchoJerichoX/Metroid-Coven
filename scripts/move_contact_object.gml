/// move_contact_object(speed,direction,object)
// Returns collision.
var i,ix,iy,collide;
i=0;
collide=false;
ix=lengthdir_x(1,argument1);
iy=lengthdir_y(1,argument1);

for(i=0;i<argument0;i+=1)
{
    if collision_line(x,y,ix*i,iy*i,argument2,true,true)
    {
        collide=true;
        x=x+(ix*i)
        y=y+(iy*i)
        break;
    }
}
// Unknown source.
