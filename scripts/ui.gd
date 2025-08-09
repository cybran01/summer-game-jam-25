extends Control

signal start_game

func show_message(texture):
	$MainLabel.set_texture(load("ui/"+texture+".png"))
	$MainLabel.show()

func show_game_over():
	await $StartTimer.timeout
	$MainLabel.set_texture("ready")
	$MainLabel.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	show_message("ready")
	$StartTimer.start()

func _on_start_timer_timeout() -> void:
	show_message("fight")
	$ReadyTimer.start()

func _on_ready_timer_timeout() -> void:
	$MainLabel.hide()
	start_game.emit()
