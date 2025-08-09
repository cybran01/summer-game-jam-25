extends State

func enter() -> void:
	super()
	player.anim_sprite.play("attack")
	print($'../..'.name + " " + self.name)

func update(delta: float) -> State:
	# calcualte windup, send attack signal
	return null
