extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")

func enter() -> void:
	_animatedSprite.play("parry")
	print("player1 parry")

func update(delta: float) -> State:
	# return to idle after parry time
	return null

func is_parrying() -> bool:
	# add correct parry logic
	return false
