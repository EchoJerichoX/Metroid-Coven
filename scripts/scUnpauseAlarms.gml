//var len = ds_list_size(argument0);
for (var i = 0; i < ds_list_size(argument0); i += 1;)
{
       alarm[i] = ds_list_find_value(argument0,i);
}
ds_list_destroy(argument0);
