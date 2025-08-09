class_name State
extends Node

var player: Player

func enter() -> void:
	pass

func update(delta: float) -> State:
	return null

func is_parrying() -> bool:
	return false
