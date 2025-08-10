extends Node

var started: bool = false
var preparing: bool = false

func start_game():
	started = true
	preparing = false
	
func prepare():
	preparing = true

func stop_game():
	started = false
	preparing = false
