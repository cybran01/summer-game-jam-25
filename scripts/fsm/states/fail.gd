extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("fail")
	print("player1 fail")

func update(delta: float) -> State:
	# return to idle after fail timout
	return null
