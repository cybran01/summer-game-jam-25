extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("idle")
	print("player1 idle")

func handle_input(event: InputEvent) -> State:
	# handle input for attack, parry, feint
	return null
