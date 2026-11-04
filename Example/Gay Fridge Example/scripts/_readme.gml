/*
SANDBERT WITH CUSTOM AI
----------------------------------------------------------------------------------------------

This character has been designed to make advanced AI more accessible to Workshop for implementation on 
existing characters as well as being a template that can be used to create new characters with advanced AI.

If you're reading this you probably downloaded this character for one of two reasons.

1. You want to reuse the AI for your own character.
2. You want to make a character in a template where the AI is already in there.


1. REUSING AI FOR YOUR OWN CHARACTER
----------------------------------------------------------------------------------------------

If you are here for reason 1, just copy ai_init.gml and ai_update.gml and put them in your own character.
The AI was written by Pejota and eskews the normal AI logic for entirely custom logic.
This AI technique has been previously used on characters like Wally, Bhadra, Knuckles, Madeline,
Smash Mario, Kumaki and more!

IMPORTANT!
Just copying and pasting this AI onto your character will not make it work properly. You need to go into
ai_init.gml and look for the array (ai_attacks).

Each entry of the array is structured like this:

//[ATTACK INDEX, OVERWRITE[X,Y,WIDTH,HEIGHT], [HITBOXES INDEXES]]

ATTACK INDEX is the attack name, 
OVERWRITE increases the range of attack detection
HITBOX_INDEXES is a list of the hitboxes the move has. 

There is also some things you can add to ai_update.gml

Put AI logic related to cancelling your attacks and actions during attacks in AttackUpdate()

Put AI logic related to recovering in "try_recover()"

Rivals has default logic that you will need to disable for custom AI to work.
Clear the default inputs for Rivals by using "clear_ai_inputs"

To make your character press specific buttons call the functions "press_attack()", "press_special()"" etc

These functions will set variables like attack_pressed, special_pressed, jump_pressed to true or false
depending on the function.

Everything else, such as gimmick activation, goes in main();


2. MAKING A CHARACTER WITH THIS TEMPLATE
---------------------------------------------------------------------------

This template is one of many options in the Workshop, it won't tell you how to code advanced stuff and has
extremely basic moves. If you want a template with many advanced coding methods and how to code certain moves, 
check out Tester the Template Man by Bar-Kun

*https://steamcommunity.com/sharedfiles/filedetails/?id=2859046287&searchtext=Tester

This template uses a few quality of life features straight from that template but is overall designed to
be a middle point between the empty version and the full version of Tester, as a modernised
version of the original Sandbert.

Sandbert has been rebalanced to be within base cast status and given a new USpecial. Commonly used scripts 
that are used in other characters have been added here with some basic content in them, some of which is 
optional. Each attack script for normals has general frame data guides to help you balance around base cast.

In post_draw.gml you can find the Playtest Changelog, developed by Hyuponia. This allows you to enter your
patch notes in the character itself and you can then just copy and paste it onto Steam.

I have added a bunch of compatibilities to init.gml and update.gml. These are optional and can be deleted 
if you so wish. I have also restored the "gold shimmer" that was lost in a previous update.

You will still need to follow section 1 after making your character for the AI to work correctly.

Credit to Pejota, SupersonicNK, Hyuponia, Muno and Bar-Kun for their efforts in originally creating the 
content that has been assembled together in this template.

Lastly a big shoutout to the ExW community in general. You are full of very talented people who have
helped this game become the game it is today.

Happy Modding :)
*/

