extends State

func enter() -> void:
	super()
	player.anim_sprite.play("death_parry")
	print($'../..'.name + " " + self.name)
