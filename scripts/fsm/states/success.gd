extends State

func enter() -> void:
	super()

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null
