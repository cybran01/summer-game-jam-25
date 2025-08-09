class_name StateMachine
extends Node

@export
var starting_state: State

var current_state: State

func init(player: Player) -> void:
	for child in get_children():
		if child is State:
			child.player = player
	change_state(starting_state)

func chage_state_by_name(state_name: String) -> void:
	var next_state: State
	match state_name:
		"fail":
			next_state = $fail
		"success":
			next_state = $success
		"death":
			next_state = $death
		"victory": 
			next_state = $victory
		_:
			next_state = null
	change_state(next_state)

func change_state(new_state: State) -> void:
	current_state = new_state
	current_state.enter()

func update(delta: float) -> void:
	var new_state = current_state.update(delta)
	if new_state:
		change_state(new_state)

func is_parrying() -> bool:
	return current_state.is_parrying()

func _on_animated_sprite_2d_animation_finished() -> void:
	current_state.anim_fin = true
