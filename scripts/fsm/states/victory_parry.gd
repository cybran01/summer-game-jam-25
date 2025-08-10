extends State

func enter() -> void:
	super()
	player.anim_sprite.play("victory_parry")
	print($'../..'.name + " " + self.name)
