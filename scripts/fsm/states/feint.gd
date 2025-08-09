extends State

func enter() -> void:
	super()
	player.anim_sprite.play("feint")
	print("player1 feint")

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null
