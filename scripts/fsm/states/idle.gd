extends State

@export
var attack_name: String
@export
var feint_name: String
@export
var parry_name: String

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")
@onready
var attack_state: State = $attack
@onready
var feint_state: State = $feint
@onready
var parry_state: State = $parry

func enter() -> void:
	_animatedSprite.play("idle")
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
