extends PathFollow3D

var frames = 20 * 60.0
var dist = 0.0
var ret = false
var points = []
# Called when the node enters the scene tree for the first time.

func _ready():
	loop = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += .1
	pass

func getPoints()->Array:
	return points
	
func getReturn()->bool:
	return ret
