extends State

func enter() -> void:
	super()
	player.anim_sprite.play("death")
	print($'../..'.name + " " + self.name)
