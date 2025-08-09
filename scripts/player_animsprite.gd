extends AnimatedSprite2D

func _on_frame_changed() -> void:
	match animation:
		'attack':
			match frame:
				2:
					$WooshSound.play()
		'parry':
			match frame:
				var x when x > 2:
					print($'..'.name, " in parry animation aframe ", frame)
					$'../state_machine/parry'.is_in_parry_window = false

func _on_animation_changed() -> void:
	match animation:
		'fail', 'death':
			var number = RandomNumberGenerator.new().randi_range(0, 2)
			print('playing sound ' + str(number))
			match number:
				0:
					$HitSound_01.play()
				1:
					$HitSound_02.play()
				2:
					$HitSound_03.play()
		'parry':
			$'../state_machine/parry'.is_in_parry_window = true
