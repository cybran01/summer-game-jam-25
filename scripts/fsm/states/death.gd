extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("death")
	print("player1 death")
