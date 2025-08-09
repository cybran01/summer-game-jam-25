extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("attack")
	print("player1 attack")

func update(delta: float) -> State:
	# calcualte windup, send attack signal
	return null
