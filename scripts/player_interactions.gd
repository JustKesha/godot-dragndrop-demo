extends Node

func _on_raycast_started_dragging(object: Node3D) -> void:
	var animation_player: AnimationPlayer = object.get_node("Animator")
	
	if not animation_player:
		return
	
	animation_player.play("PICKUP")

func _on_raycast_stopped_dragging(object: Node3D) -> void:
	var animation_player: AnimationPlayer = object.get_node("Animator")
	
	if not animation_player:
		return
	
	animation_player.play("DROP")
