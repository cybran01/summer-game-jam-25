extends AnimatedSprite2D

signal play_hit
signal play_sword_woosh

func _on_frame_changed() -> void:
	match animation:
		'attack':
			match frame:
				2:
					play_sword_woosh.emit()

func _on_animation_changed() -> void:
	match animation:
		'fail', 'death':
			play_hit.emit()
