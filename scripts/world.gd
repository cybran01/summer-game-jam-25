extends Node2D

@onready
var player1: Player = $Player1
@onready
var player2: Player = $Player2
@export
var game_running = false

func _ready() -> void:
	player1.attacked.connect(attack_p1)
	player2.attacked.connect(attack_p2)
	player1.anim_sprite.play_sword_woosh.connect(play_swoosh)
	player1.anim_sprite.play_hit.connect(play_hit)

func play_swoosh():
	$WooshSound.play()
	
func play_hit():
		var number = RandomNumberGenerator.new().randi_range(0, 2)
		print('playing sound ' + str(number))
			
		match number:
			0:
				$HitSound_01.play()
			1:
				$HitSound_02.play()
			2:
				$HitSound_03.play()
	
func start_game():
	game_running = true
	
func reset_game():
	game_running = false
	player1._ready()
	player2._ready()

func handle_score(success_player: Player, fail_player: Player):
	print(game_running)
	success_player.score += 1
	if success_player.score >= 3:
		success_player.state_machine.change_state_by_name("victory")
		fail_player.state_machine.change_state_by_name("death")
		if game_running:
			game_running = false
			$UI.show_game_over()
	else:
		success_player.state_machine.change_state_by_name("success")
		fail_player.state_machine.change_state_by_name("fail")

func attack_p1() -> void:
	if player2.is_parrying():
		handle_score(player2, player1)
		$UI.update_player2_score(player2.score)
	else:
		handle_score(player1, player2)
		$UI.update_player1_score(player1.score)

func attack_p2() -> void:
	if player1.is_parrying():
		handle_score(player1, player2)
		$UI.update_player1_score(player2.score)
	else:
		handle_score(player2, player1)
		$UI.update_player2_score(player2.score)

func _on_ui_start_game() -> void:
	game_running = true
	
func _on_ui_reset_game() -> void:
	reset_game()
