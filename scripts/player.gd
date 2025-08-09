class_name Player
extends Node2D

signal attacked

var score: int

@onready
var state_machine: StateMachine = $state_machine

@onready
var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	score = 0
	state_machine.init(self)

func _process(delta: float) -> void:
	state_machine.update(delta)

func is_parrying() -> bool:
	return state_machine.is_parrying()
