extends EditorContextMenuPlugin

func _popup_menu(paths: PackedStringArray) -> void:
	if paths.size() == 1:
		var path:String = paths.get(0).get_extension()
		match path:
			"png","jpg","svg","bmp","dds","ktx","exr","hdr","jpeg","tga","webp":
				add_context_menu_item("Convert to palette",convert_to_palette)


func convert_to_palette(itex:Array):
	var path:String = itex.get(0)

	if FileAccess.file_exists(path):
		var colors:PackedColorArray;
		var texture:Texture = ResourceLoader.load(path)
		var image:Image = texture.get_image()
		for y in image.get_height():
			for x in image.get_width():
				var new_color = image.get_pixel(x,y)
				if not colors.has(new_color) and new_color.a > 0.1:
					colors.append(new_color)
		var new_file = ColorPalette.new()
		new_file.colors = colors
		ResourceSaver.save(new_file,path.get_base_dir()+"/palette.tres")
		#EditorInterface.get_editor_settings().set_project_metadata("color_picker", "presets", colors)
		#EditorInterface.restart_editor()
