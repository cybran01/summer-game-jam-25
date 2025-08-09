extends AnimatedSprite2D

func _on_frame_changed() -> void:
	match animation:
		'attack':
			match frame:
				2:
					$WooshSound.play()
		'fail':
			match frame:
				0:
					var number = RandomNumberGenerator.new().randi_range(0, 3)
					match number:
						0:
							$HitSound_01.play()
						1:
							$HitSound_02.play()
						2:
							$HitSound_03.play()
					
