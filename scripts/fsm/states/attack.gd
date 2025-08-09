extends State

func enter() -> void:
	super()
	player.anim_sprite.play("attack")
	player.anim_sprite.frame_changed.connect(attack_executed)
	print($'../..'.name + " " + self.name)
	
func exit() -> void:
	player.anim_sprite.frame_changed.disconnect(attack_executed)

func attack_executed() -> void:
	if player.anim_sprite.animation == 'attack':
		if player.anim_sprite.frame == 2:
			player.attacked.emit()
