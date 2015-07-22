_return = [];
_id = 0;
{
	_class = typeOf _x;
	_pos = getPosASL _x;
	_dir = getDir _x;
		
	_return pushBack [_class,_pos,_dir,str(_id)];
	_id = _id + 1; 
} forEach var_be_objHistory;
	
_return