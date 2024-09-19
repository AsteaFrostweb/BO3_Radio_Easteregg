#using scripts\zm\_util;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_utility;


#namespace zm_radio_easteregg;


function init()
{
    //Get radio triggers
    radios = GetEntArray("radio","targetname");
    count = 0;
    foreach(radio in radios)
    {
        count++;
        if(radio.script_string == undefined)
        {
            IPrintLnBold("Radio with unspecified soundname");
            continue;
        }else
        {		
            radio thread setup_radio(radio.script_string);
        }        
    } 
}
function private setup_radio(sound_name)
{    
	level endon( "end_game" );
    self endon( "disconnect" );

    self SetHintString("Hold ^3[{+activate}]");
    self UseTriggerRequireLookAt(); 
	self setcandamage(true);	

	if(self.script_string == undefined)
	{
		return; //return if the sound anme to play hasnt been specified
	}

	while(1)
	{
		//Wait for damage on the model
		self waittill("damage", damage, player, dir, point, str_type, model, tag, part, w_weapon, flags, inflictor, chargeLevel);

		//Check if the melee only kvp is  specified
		if(self.script_int != undefined)
		{
			if(self.script_int == 1)
			{
				if(( ( isDefined(str_type) && str_type == "MOD_MELEE" ) || ( isDefined(w_weapon) && zm_utility::is_melee_weapon(w_weapon) ) ))
				{						
					PlaySoundAtPosition(sound_name, self.origin);		//(melee only)	
					break;				
				}
			}			
			else
			{				
				PlaySoundAtPosition(sound_name, self.origin);		//(not melee only)	
				break;	
			}
		}else
		{
			PlaySoundAtPosition(sound_name, self.origin);		//(not melee only)	
			break;	
		}
	}        
}