extends State

func enter() -> void:
	super()
	player.anim_sprite.play("parry")
	print($'../..'.name + " " + self.name)

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null

func is_parrying() -> bool:
	# add correct parry logic
	return false
