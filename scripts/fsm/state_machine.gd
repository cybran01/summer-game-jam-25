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

func change_state(new_state: State) -> void:
	current_state = new_state
	current_state.enter()

func handle_input(event: InputEvent) -> void:
	var new_state = current_state.handle_input(event)
	if new_state:
		change_state(new_state)

func update(delta: float) -> void:
	var new_state = current_state.update(delta)
	if new_state:
		change_state(new_state)
