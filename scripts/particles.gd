extends Node

func spawn(name: String, parent: Node2D, set_color = true) -> CPUParticles2D:
	var particle = load("res://prefabs/particles/%s.tscn" % name).instantiate() as CPUParticles2D
	if set_color: particle.modulate = parent.modulate
	particle.finished.connect(particle.queue_free)
	particle.position = parent.position
	particle.rotation = parent.rotation
	get_tree().current_scene.add_child(particle)
	return particle
