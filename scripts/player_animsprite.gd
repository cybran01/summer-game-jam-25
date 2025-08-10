extends AnimatedSprite2D

signal play_hit
signal play_sword_woosh
signal play_sword_hit

func _on_frame_changed() -> void:
	match animation:
		'attack':
			match frame:
				2:
					play_sword_woosh.emit()
		'success_parry':
			match frame:
				2:
					play_sword_woosh.emit()
		'death_parry', 'fail_parry':
			match frame:
				2:
					play_hit.emit()

func _on_animation_changed() -> void:
	match animation:
		'fail', 'death':
			play_hit.emit()
		'parry':
			play_sword_woosh.emit()
		'success_parry', 'victory_parry':
			play_sword_hit.emit()
