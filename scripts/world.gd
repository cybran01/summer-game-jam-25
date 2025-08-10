extends Node2D

@onready
var player1: Player = $Player1
@onready
var player2: Player = $Player2
@onready
var ui = $UI

var start_pos: Vector2 = Vector2()
var velocity: Vector2 = Vector2()
var looserPlayer: Player

func _process(delta: float) -> void:
	if !looserPlayer:
		return
	
	looserPlayer.move_local_x(velocity.x * delta)
	looserPlayer.move_local_y(velocity.y * delta)
	
	velocity.y += 2000.0 * delta
	
	if looserPlayer.position.y >= 1500 && !$ToiletSound.playing:
		$ToiletSound.play()
	
func _ready() -> void:
	player1.attacked.connect(attack_p1)
	player2.attacked.connect(attack_p2)
	
	player1.anim_sprite.play_sword_woosh.connect(play_swoosh)
	player1.anim_sprite.play_hit.connect(play_hit)
	player1.anim_sprite.play_sword_hit.connect(play_sword_hit)
	
	player2.anim_sprite.play_sword_woosh.connect(play_swoosh)
	player2.anim_sprite.play_hit.connect(play_hit)
	player2.anim_sprite.play_sword_hit.connect(play_sword_hit)

func play_sword_hit():
	$ParrySound.play()

func play_swoosh():
	$SwordSound.play()

func play_hit():
		var number = RandomNumberGenerator.new().randi_range(0, 2)
		
		print('playing sound ' + str(number))
		
		$BonkSound.play()
		
		await get_tree().create_timer(0.1).timeout
			
		match number:
			0:
				$HitSound_01.play()
			1:
				$HitSound_02.play()
			2:
				$HitSound_03.play()

func reset_game():
	player1._ready()
	player2._ready()

func handle_score(success_player: Player, fail_player: Player, parry: bool):
	var state_suffix: String = ""
	if parry:
		state_suffix = "_parry"
	success_player.score += 1
	if success_player.score >= 3:
		success_player.state_machine.change_state_by_name("victory"+state_suffix)
		fail_player.state_machine.change_state_by_name("death"+state_suffix)
		if GameStatus.started:
			GameStatus.stop_game()
			if fail_player.name.to_lower() == 'player1':
				looserPlayer = player1
				velocity = Vector2(-1000.0, -1000.0)
			else:
				looserPlayer = player2
				velocity = Vector2(1000.0, -1000.0)
				
			start_pos = looserPlayer.position
			ui.show_game_over(success_player.name.to_lower())
	else:
		success_player.state_machine.change_state_by_name("success"+state_suffix)
		fail_player.state_machine.change_state_by_name("fail"+state_suffix)

func attack_p1() -> void:
	if player2.is_parrying():
		handle_score(player2, player1, true)
		ui.update_player2_score(player2.score)
	else:
		handle_score(player1, player2, false)
		ui.update_player1_score(player1.score)

func attack_p2() -> void:
	if player1.is_parrying():
		handle_score(player1, player2, true)
		ui.update_player1_score(player1.score)
	else:
		handle_score(player2, player1, false)
		ui.update_player2_score(player2.score)

func _on_ui_start_game() -> void:
	GameStatus.start_game()
	
func _on_ui_reset_game() -> void:
	looserPlayer.position = start_pos
	looserPlayer = null
	reset_game()
