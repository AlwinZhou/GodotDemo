extends Node2D

# Called when the node enters the scene tree for the first time.
var astar_grid = AStarGrid2D.new()
var grid_size
@export var cell_size = Vector2i(16, 16)
func _ready():
	initialize_grid()
	_draw123()	
func initialize_grid():
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	astar_grid.size = grid_size
	astar_grid.cell_size = cell_size
	astar_grid.offset = cell_size / 2
	astar_grid.update()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _draw123():
	for x in grid_size.x + 1:
		draw_line(Vector2(x * cell_size.x, 0),
			Vector2(x * cell_size.x, grid_size.y * cell_size.y),
			Color.DARK_GRAY, 2.0)
	for y in grid_size.y + 1:
		draw_line(Vector2(0, y * cell_size.y),
			Vector2(grid_size.x * cell_size.x, y * cell_size.y),
			Color.DARK_GRAY, 2.0)
	
func draw_grid():
	pass
func _process(delta):
	pass


