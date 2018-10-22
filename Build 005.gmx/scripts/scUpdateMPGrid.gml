if (eId.aigrid = -1) exit;
mp_grid_clear_all(eId.aigrid);
mp_grid_add_instances(eId.aigrid,oBlockParent,1);
if (instance_exists(oHazardParent)) mp_grid_add_instances(eId.aigrid,oHazardParent,1);
