extends CanvasItem

func _on_raycast_draggable_hovered(_object:Node3D):
	self.visible = true

func _on_raycast_draggable_unhovered(_object:Node3D):
	self.visible = false

func _on_raycast_started_dragging(_object:Node3D):
	self.visible = false
