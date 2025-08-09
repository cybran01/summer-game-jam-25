
# Title: ???

### Konzept:

Zwei Kämpfer duellieren sich, während sie auf Pfählen balancieren. Jeder Spieler hat 3
mögliche Aktionen: Angreifen, Parieren, Antäuschen.
(Keymapping: W,A,D bzw. Arrow-left, Arrow-up, Arrow-right)

Wer zuerst 3 Schläge landen kann, bring den anderen aus der Balance und stößt ihn
vom Pfahl.

### Controls:

**P1**
| Key      | Aktion  |
| -------- | ------- |
| W        | Attack  |
| A        | Parry   |
| D        | Feint   |


**P2**
| Key      | Aktion  |
| -------- | ------- |
| ↑        | Attack  |
| ←        | Parry   |
| →        | Feint   |


Angriffsversuch, trifft Gegner, wenn dieser nichts unternimmt oder einen Misinput
macht. Parieren, pariert Angriff bei richtigem Timing, wenn der Gegner antäuscht, geht
die Parade ins Nichts und der Spieler hat einen Cooldown. Antäuschen, provoziert
Parade, leichter Delay bevor der nächste Input gemacht werden kann, damit es nicht
abusable ist.

**Interaktionen**
| Action   | Result |
| -------- | ------- |
| Attack vs Nothing | Hit |
| Attack vs Parry | Parry + Followup Hit |
| Attack vs Feint | Hit by attacker |
| Feint vs Parry | Parry whiff, leads to cooldown and opening for other players hit |
| Feint vs Nothing | Nothing, short feint CD |
| Parry vs Nothing | Nothing, Long parry CD |

**Input Timings** *(temporary values)*
Attack: 1000ms
Feint: Attack but stops 400ms before impact
	- ??? ms animations lock
Parry: 300-100ms before impact
on whiff, 1300ms animation lock

### Asset List:

**Audio**
- Parry (Holzschwert clash)
- Hit (Bonk sound) 
- Miss (Woosh sound) ✅
- BG music (tense aber lowkey damit nicht ablenkt) ✅
- Vocals (Schreie, Stöhnen, Grunts)
- Loose (Wasser platsch Geräusch) ✅
- Ambient sounds (Seagulls, waves etc.)
- Announcer
	- Ready? Fight?
	- next round
	- Player X, wins!
- menu click / confirm sfx ✅
- win music jingle*
- title screen soundtrack*

**Graphics**
- 2 characters
- animations
	- idle
	- attack anim (Feint anim)
	- parry anim (followup anim)
	- got hit anim
	- death anim
- background
- foreground
- UI
	- Healthbars
	- player name placeholder
	- timer
	- replay
	- start countdown*
	- pause screen*
	- title screen*
	- keybindings*
	- win / loss screen

**Loop**
1. open title screen*
1. name player characters
1. fight scene opens, announcer VO
1. gameplay
1. one player gets hit, break
1. reset
1. announcer VO*
1. 3-5x (best of 5)
1. 3rd hit on a character, character falls
1. announcer VO*
1. Replay or title screen
