extends Node

const SPEED       := 250.0
const GRAVITY     := -9.8
const GRAVITY_DIR := Vector3.DOWN

# Values from Project -> Project settings -> Input map
const CONTROLS := {
	"LEFT":      "go_left",
	"RIGHT":     "go_right",
	"FORWARD":   "go_forward",
	"BACKWARDS": "go_backwards",
}

@onready var body:CharacterBody3D = $"."

func move(delta:float, speed:float = SPEED):
	var input_dir = Input.get_vector(
		CONTROLS.LEFT,
		CONTROLS.RIGHT ,
		CONTROLS.FORWARD,
		CONTROLS.BACKWARDS,
	)
	var dir = (body.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if dir:
		body.velocity.x = dir.x * speed * delta
		body.velocity.z = dir.z * speed * delta
	else:
		body.velocity.x = 0
		body.velocity.z = 0
	
	body.move_and_slide()

func fall(delta:float, gravity:Vector3 = GRAVITY * GRAVITY_DIR):
	if body.is_on_floor():
		return
	
	body.velocity -= gravity * delta

func _physics_process(delta:float):
	move(delta)
	fall(delta)
