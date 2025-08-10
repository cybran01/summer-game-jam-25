extends State

func enter() -> void:
	super()
	player.anim_sprite.play("success_parry")
	print($'../..'.name + " " + self.name)

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null
