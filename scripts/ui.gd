extends Control

signal start_game

func show_message(text):
	$MainLabel.text = text
	$MainLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	
	await $MessageTimer.timeout

	$Message.text = "Pool Noodle Sim"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
	show_message("Get Ready")

func _on_message_timer_timeout() -> void:
	$MainLabel.hide()
