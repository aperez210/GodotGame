extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play("metarigAction")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_animation != "metarigAction":
		play("metarigAction",-1,2,false)
	pass
