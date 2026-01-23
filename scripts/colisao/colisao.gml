function scr_colisao(_obj = obj_colisor){
    if (place_meeting(x + movex, y, _obj))
    {
        while (!place_meeting(x + sign(movex), y, _obj))
        {
            x += sign(movex);    
        }
        
        movex = 0;
		
    }
    
	x += movex;
	
    if (place_meeting(x, y + movey, _obj))
    {
        while(!place_meeting(x, y + sign(movey), _obj))
        {
            y += sign(movey);
        }
        
       movey = 0; 
    }
	
	y += movey;
}