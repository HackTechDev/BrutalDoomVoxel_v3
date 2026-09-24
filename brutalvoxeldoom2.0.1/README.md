# NashGore NEXT
Version: 1.0<br/>
Requires: GZDoom 4.11.3 or higher<br/>

### Load Order

Please load nashgore.pk3 last (or fairly late) in your load order, to ensure
that no other mod overrides NGM's content.

### Options

Most of the effects in NashGore NEXT can be customized. Please visit
the Options menu for more details.

### Special Lump: BLUDTYPE

NashGore NEXT introduces a new special lump called BLUDTYPE. You can simply
create a BLUDTYPE.txt and load it after NGM; the lumps will stack.

For example: gzdoom.exe -file nashgore.pk3 bludtype.txt

The BLUDTYPE lump is used to list blood actor classes to override. For
example, Smooth Doom changes the Cacodemon blood type to "Blueblood", which
causes NGM's blood to never appear. To fix that, simply add "BlueBlood"
on a new line into BLUDTYPE.txt.

USAGE: Simply list down blood Actor classes you wish to override, each on a
new line.

A sample BLUDTYPE.txt for Smooth Doom:

```
XBlood
BlueBlood
GreenBlood
```

### BLUDTYPE Community Project

If you don't feel like making your own BLUDTYPE lump, check out the [BLUDTYPE Community Project](https://forum.zdoom.org/viewtopic.php?f=46&t=69485).

### Credits

NashGore NEXT<br/>
© 2006 - 2024 Nash Muhandes

All graphics, sprites and code by Nash Muhandes<br/>
Contains some code backported from DISDAIN written by Robert "Boondorl" Skutt<br/>
Sounds by various FreeSound contributors (see below)<br/>
Audio mixed and mastered by Nash Muhandes

Special thanks (in alphabetical order):

Ben "Zombie" Moir<br/>
Boondorl<br/>
Caligari87<br/>
Dark-Assassin<br/>
Graf Zahl<br/>
Gutawer<br/>
Marisa Heit<br/>
Namsan<br/>
Rachael<br/>
RicardoLuis0<br/>
ZZYZX<br/>
arookas<br/>
dpJudas<br/>
kodi<br/>
m8f<br/>
phantombeta<br/>

Sound sources:

https://freesound.org/people/LittleRobotSoundFactory/sounds/270481/<br/>
https://freesound.org/people/altfuture/sounds/174634/<br/>
https://freesound.org/people/cliftonmcarlson/sounds/345985/<br/>
https://freesound.org/people/deoking/sounds/411671/<br/>
https://freesound.org/people/Rock%20Savage/sounds/81042/<br/>
https://freesound.org/people/altfuture/sounds/174637/<br/>
https://freesound.org/people/mattiagreyfox/sounds/202400/<br/>
https://freesound.org/people/Hitrison/sounds/251411/<br/>
https://freesound.org/people/Hitrison/sounds/251410/<br/>
https://freesound.org/people/nicktermer/sounds/259542/<br/>
https://freesound.org/people/saturdaysoundguy/sounds/388033/<br/>
https://freesound.org/people/LittleRobotSoundFactory/sounds/316534/<br/>
https://freesound.org/people/MWLANDI/sounds/85863/<br/>
https://freesound.org/people/jvitorml/sounds/393736/<br/>
https://freesound.org/people/janbezouska/sounds/399183/<br/>

### License

[VIEW FULL LICENSE HERE](https://github.com/nashmuhandes/nashgore/blob/master/LICENSE)

You MAY:
- Use this mod in your play session, as long as all licenses and headers remain intact
- Embed this mod into your mods or projects that are FREELY downloadable without any kind of monetary transaction involved, as long as all licenses and headers remain intact

You MAY NOT:
- Use or embed this mod into your project (either partially or fully) if you are making money off your mod/project, including commercially-sold games, or via crowdfunding platforms like Kickstarter, Patreon, Ko-fi and other similar platforms
