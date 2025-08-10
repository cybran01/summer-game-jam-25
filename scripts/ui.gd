extends CanvasLayer

signal start_game
signal reset_game

func show_message(texture):
	$MainLabel.set_texture(load("ui/"+texture+".png"))
	$MainLabel.show()
	
func show_player_score(player: int, score: int):
	var score_label: TextureRect
	
	if player == 1:
		score_label = $Player1Score
	else:
		score_label = $Player2Score
	if score == 3:
		score_label = $WinnerScore
		
	score_label.set_texture(load("ui/player"+ str(player)+"_score"+ str(score)+".png"))
	score_label.show()

func show_game_over(winner_name: String):
	print("GAME OVER")
	show_message(winner_name)
	$MainLabel.show()
	$GameOverTimer.start()

func _on_start_button_pressed() -> void:
	start_game_ui()
	
func start_game_ui():
	$StartButton.hide()
	show_message("ready")
	$StartTimer.start()

func _on_start_timer_timeout() -> void:
	show_message("fight")
	$ReadyTimer.start()
	$Player1keys.hide()
	$Player2keys.hide()

func _on_ready_timer_timeout() -> void:
	$MainLabel.hide()
	start_game.emit()
	
func update_player1_score(score):
	show_player_score(1, score)
	
func update_player2_score(score):
	show_player_score(2, score)

func reset_scores():
	$WinnerScore.set_texture(load("ui/score0.png"))
	update_player1_score(0)
	update_player2_score(0)

func _on_game_over_timer_timeout() -> void:
	$MainLabel.hide()
	$StartButton.show()
	reset_scores()
	$Player1keys.show()
	$Player2keys.show()
	reset_game.emit()
