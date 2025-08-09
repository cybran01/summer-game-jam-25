extends CanvasLayer

signal start_game
signal reset_game

func show_message(texture):
	$MainLabel.set_texture(load("ui/"+texture+".png"))
	$MainLabel.show()

func show_game_over():
	print("GAME OVER")
	show_message("ready")
	$MainLabel.show()
	$GameOverTimer.start()

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
	
func update_player1_score(score):
	$Player1Score.text = str(score)
	
func update_player2_score(score):
	$Player2Score.text = str(score)

func reset_scores():
	$Player1Score.text = "0"
	$Player2Score.text = "0"

func _on_game_over_timer_timeout() -> void:
	$MainLabel.hide()
	$StartButton.show()
	reset_scores()
	reset_game.emit()
