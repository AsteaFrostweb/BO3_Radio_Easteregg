# Black Ops III Radio Easter Egg
Adds "Radio's" to your map much like the ones found on Der Reise.

## How to install
###  Download (only one)
* Enter `git clone https://github.com/AsteaFrostweb/BO3_Radio_Easteregg.git` into your Git Bash terminal in the direcory you want to clone the folder into.
* [Google Drive Link](https://drive.google.com/file/d/1zrS4KP0zDVkjUtPdQ7s1fP4X5gN_U1i5/view?usp=sharing) Alternativley download .rar from google drive and extract to folder.

### File Additions
* Move the "_zm_radio_easteregg.gsc" file from the downloaded folder into the "Call of Duty Black Ops III\share\raw\scripts\zm" folder.
  
### Code/Config Additions
1. Add `#using scripts\zm\_zm_radio_easteregg;` to the top of your zm_[mapname].gsc with the other using statements.
2. Add `zm_radio_easteregg::init();` to your main function within the zm_[mapname].gsc file.
3. Add `scriptparsetree,scripts/zm/_zm_radio_easteregg.gsc` to your zm_[mapname].zone file

### Radiant Setup
1. Add the models you wish to use to play the sound and make sure to remap the classes to "script_model" if they aren't already.
2. Add a KVP with Key: "targetname" if it doesnt already exist and ensure it has the value "radio". 
3. Add a KVP with Key: "script_string". The value of this KVP will be the name of the sound alias you want to play eg. "radio1sound"
4. Optional - Add KVP with Key: "script_int". This value  denotes if the radio is melee only `1 = true` `0 = false`.
   
### Considerations
* Sound aliases that you want to get quieter over distance should have template "AMB_AMBIENCE_3D_MOD".
* Sound aliases that you want to be as non range dependant should have template "UIN_MOD".
