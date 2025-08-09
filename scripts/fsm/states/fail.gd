extends State

func enter() -> void:
	super()
	player.anim_sprite.play("fail")
	print("player1 fail")

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null
