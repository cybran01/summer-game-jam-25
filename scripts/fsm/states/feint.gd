extends State

@onready
var _animatedSprite = get_node("../../AnimatedSprite2D")
@onready
var idle_state: State = $idle

func enter() -> void:
	_animatedSprite.play("feint")
	await _animatedSprite.animation_finished
	print("player1 feint")

func update(delta: float) -> State:
	# return to idle after feint time
	return idle_state
