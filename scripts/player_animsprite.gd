extends AnimatedSprite2D

signal play_hit
signal play_sword_woosh

func _on_frame_changed() -> void:
	match animation:
		'attack':
			match frame:
				2:
					play_sword_woosh.emit()
		'parry':
			match frame:
				var x when x > 2:
					print($'..'.name, " in parry animation aframe ", frame)
					$'../state_machine/parry'.is_in_parry_window = false

func _on_animation_changed() -> void:
	match animation:
		'fail', 'death':
			play_hit.emit()
		'parry':
			$'../state_machine/parry'.is_in_parry_window = true
