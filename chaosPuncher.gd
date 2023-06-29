extends AnimationPlayer

var animation = " chaosPunch"

# Called when the node enters the scene tree for the first time.
func _ready():
	playAnimation()
	play(animation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playAnimation()
	pass

func playAnimation():
	if current_animation != animation:
		play(animation,-1,1,false)
