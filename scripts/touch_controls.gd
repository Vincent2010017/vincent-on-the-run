extends CanvasLayer

@export var margin := Vector2(24, 24)
@export var spacing := 16.0

@onready var left: TouchScreenButton = $Left
@onready var right: TouchScreenButton = $Right
@onready var jump: TouchScreenButton = $Jump

func _ready() -> void:
	get_viewport().size_changed.connect(_layout)
	_layout()

func _btn_size(b: TouchScreenButton) -> Vector2:
	return b.texture_normal.get_size() * b.scale

func _layout() -> void:
	var vp := get_viewport().get_visible_rect().size
	# D-pad bottom-left
	var s := _btn_size(left)
	left.position  = Vector2(margin.x, vp.y - margin.y - s.y)
	right.position = left.position + Vector2(s.x + spacing, 0)
	# action buttons bottom-right, jump slightly raised (natural thumb arc)
	var j := _btn_size(jump)
	jump.position   = Vector2(vp.x - margin.x - j.x, vp.y - margin.y - j.y - 24)
