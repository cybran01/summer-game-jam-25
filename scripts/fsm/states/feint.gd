extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("feint")
	print("player1 feint")

func update(delta: float) -> State:
	# return to idle after feint time
	return null
