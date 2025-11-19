@tool
extends EditorPlugin

var import_plugin

func _enter_tree():
	import_plugin = preload("importer_plugin.gd").new()
	add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_FILESYSTEM,import_plugin)


func _exit_tree():
	remove_context_menu_plugin(import_plugin)
	import_plugin = null
