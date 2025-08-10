extends State

func enter() -> void:
	super()
	player.anim_sprite.play("victory")
	print($'../..'.name + " " + self.name)
