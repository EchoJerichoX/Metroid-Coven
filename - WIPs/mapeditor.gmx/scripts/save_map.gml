//This saves the variables to a file, so you can paste it into your project
fname = get_save_filename('Metroid Map|*.txt','');
if not string_length(fname) = 0 then
  {
  if string_count(".map",fname) = 0 then fname = string_insert(".map",fname,string_length(fname)+1)
  fid=file_text_open_write(fname); 
  with(oMapBlock) {
   file_text_write_string(oControl.fid,"global.map["+string(myposx)+","+string(myposy)+"]='"+wallU+wallR+wallD+wallL+color+special+"'")
   file_text_writeln(oControl.fid)
  }
  file_text_write_string(oControl.fid,"//Now we set all those squares to NOT DISCOVERED YET")
  file_text_writeln(oControl.fid)
  with(oMapBlock) {
   file_text_write_string(oControl.fid,"global.dmap["+string(myposx)+","+string(myposy)+"]=0")
   file_text_writeln(oControl.fid)
  }
  file_text_close(fid)
}
