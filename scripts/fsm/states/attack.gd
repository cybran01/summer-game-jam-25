extends State

func enter() -> void:
	super()
	player.anim_sprite.play("attack")
	print("player1 attack")

func update(delta: float) -> State:
	# calcualte windup, send attack signal
	return null
