class_name BossManager
extends Node


static var instance: BossManager


var active_bosses: Array[Boss] = []
var cumulative_health: float:
	get():
		var total: float = 0
		for boss: Boss in active_bosses:
			total += boss.health_component.health
		return total


func _process(delta: float) -> void:
	print_debug(cumulative_health)


func _enter_tree() -> void:
	instance = self


func register_boss(boss: Boss) -> void:
	active_bosses.append(boss)


func remove_boss(boss: Boss) -> void:
	active_bosses.erase(boss)
