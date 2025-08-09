class_name State
extends Node

var player: Player

var anim_fin: bool

@onready
var idle_state: State = $'../idle'
@onready
var attack_state: State = $'../attack'
@onready
var feint_state: State = $'../feint'
@onready
var parry_state: State = $'../parry'

func enter() -> void:
	anim_fin = false
	
func exit() -> void:
	pass

func update(delta: float) -> State:
	return null

func is_parrying() -> bool:
	return false
