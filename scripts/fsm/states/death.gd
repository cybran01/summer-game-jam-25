extends State

func enter() -> void:
	super()
	player.anim_sprite.play("death")
	print("player1 death")
