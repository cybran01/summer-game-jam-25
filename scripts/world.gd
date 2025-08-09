extends Node2D

@onready
var player1: Player = $Player1
@onready
var player2: Player = $Player2

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

func handle_score(success_player: Player, fail_player: Player):
	success_player.score += 1
	if success_player.score >= 3:
		success_player.state_machine.change_state_by_name("victory")
		fail_player.state_machine.change_state_by_name("death")
	else:
		success_player.state_machine.change_state_by_name("success")
		fail_player.state_machine.change_state_by_name("fail")

func attack_p1() -> void:
	if player2.is_parrying():
		handle_score(player2, player1)
	else:
		handle_score(player1, player2)

func attack_p2() -> void:
	if player1.is_parrying():
		handle_score(player1, player2)
	else:
		handle_score(player2, player1)
