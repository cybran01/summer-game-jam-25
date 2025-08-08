extends Node2D

func _input(event: InputEvent):
	var msg = "Animation playing: "
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_W:
			msg+= "parry"
		elif event.keycode == KEY_S:
			msg+= "feign"
		elif event.keycode == KEY_D:
			msg+= "attack"
		else:
			msg+= "idle"
	else:
		msg+= "idle"
	
	print(msg)
