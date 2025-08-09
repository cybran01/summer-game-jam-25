class_name Player
extends Node2D

@onready
var state_machine: StateMachine = $state_machine

func _ready() -> void:
	state_machine.init(self)

func _input(event: InputEvent) -> void:
	state_machine.handle_input(event)

func _process(delta: float) -> void:
	state_machine.update(delta)
