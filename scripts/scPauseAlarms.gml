// Pause alarms in certain objects so they don't decay or perform actions
//   that they otherwise should not during pause events.
// argument0 = object in which the alarms should pause.
// argument1 = number of alarms used in that object.

argument0 = ds_list_create();
for(var i = 0; i < argument1; i += 1;)
{
      ds_list_add(argument0,alarm[i]);
      alarm[i] = -1;
}
