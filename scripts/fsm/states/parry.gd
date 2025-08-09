extends State

var is_in_parry_window: bool

func enter() -> void:
	super()
	is_in_parry_window = true
	player.anim_sprite.play("parry")
	player.anim_sprite.frame_changed.connect(parry_over)
	print($'../..'.name + " " + self.name)

func exit() -> void:
	is_in_parry_window = false
	player.anim_sprite.frame_changed.disconnect(parry_over)

func update(delta: float) -> State:
	if anim_fin:
		return idle_state
	return null

func parry_over() -> void:
	if player.anim_sprite.animation == 'parry':
		if player.anim_sprite.frame == 2:
			is_in_parry_window = false

func is_parrying() -> bool:
	return is_in_parry_window
