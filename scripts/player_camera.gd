extends Node

const SENSETIVITY    := 75.0 / 100000
const MIN_X_ROTATION := deg_to_rad(-75.0)
const MAX_X_ROTATION := deg_to_rad(85.0)

const CURSOR_MODE = Input.MOUSE_MODE_CAPTURED

@onready var body:Node3D     = $".."
@onready var camera:Camera3D = $"."

func apply_rotation(
		event:InputEventMouseMotion,
		
		x_sensetivity:float = SENSETIVITY,
		y_sensetivity:float = SENSETIVITY,
		x_min:float = MIN_X_ROTATION,
		x_max:float = MAX_X_ROTATION,
		
		cam:Camera3D = camera,
		parent:Node3D = body,
	):
	var x_rot = - event.relative.y * y_sensetivity
	var y_rot = - event.relative.x * x_sensetivity
	
	cam.rotate_x(x_rot)
	parent.rotate_y(y_rot)
	
	cam.rotation.x = clamp(cam.rotation.x, x_min, x_max)

func _ready():
	Input.set_mouse_mode(CURSOR_MODE)

func _input(event):
	if not event is InputEventMouseMotion:
		return
	
	apply_rotation(event)
