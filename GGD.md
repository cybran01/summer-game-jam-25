
# Title: Pool Noodle Sim

### Konzept:

Zwei Kämpfer duellieren sich, während sie auf Plattformen balancieren. Jeder Spieler hat 3
mögliche Aktionen: Angreifen, Parieren, Antäuschen.

Wer zuerst drei Schläge landen kann, bring den anderen aus der Balance und stößt ihn
von der Plattform.

### Controls:

**P1**
---
| Key      | Aktion  |
| -------- | ------- |
| D        | Attack  |
| A        | Parry   |
| W        | Feint   |


**P2**
---
| Key      | Aktion  |
| -------- | ------- |
| ←        | Attack  |
| →        | Parry   |
| ↑        | Feint   |


Angriffsversuch, trifft Gegner, wenn dieser nichts unternimmt oder einen Misinput
macht. Parieren, pariert Angriff bei richtigem Timing, wenn der Gegner antäuscht, geht
die Parade ins Nichts und der Spieler hat einen Cooldown. Antäuschen, provoziert
Parade, leichter Delay bevor der nächste Input gemacht werden kann, damit es nicht
abusable ist.

**Interaktionen**
| Action   | Result |
| -------- | ------- |
| Attack vs Nothing | Attack Success |
| Attack vs Parry | Parry Success |
| Attack vs Feint | Attack Success |
| Feint vs Parry | Parry Fail (long cooldown) |
| Feint vs Nothing | Nothing |
| Parry vs Nothing | Parry Fail (long cooldown) |

### Asset List:

**Audio**
- Parry (Holzschwert clash)
- Hit (Bonk sound) ✅
- Miss (Woosh sound) ✅
- BG music (tense aber lowkey damit nicht ablenkt) ✅
- Vocals (Schreie, Stöhnen, Grunts)
- Loose (Wasser platsch Geräusch) ✅
- Ambient sounds (Seagulls, waves etc.) ✅
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
