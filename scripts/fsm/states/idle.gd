extends State

@export
var attack_name: String
@export
var feint_name: String
@export
var parry_name: String

func enter() -> void:
	super()
	player.anim_sprite.play("idle")
	print("player1 idle")

func update(delta: float) -> State:
	if Input.is_action_pressed(attack_name):
		return attack_state
	elif Input.is_action_pressed(feint_name):
		return feint_state
	elif Input.is_action_pressed(parry_name):
		return parry_state
	else:
		return null
