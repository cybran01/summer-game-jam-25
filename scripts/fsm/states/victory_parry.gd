extends State

func enter() -> void:
	super()
	player.anim_sprite.play("success_parry")
	print($'../..'.name + " " + self.name)
