void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("glfw");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE.md");

	properties.include_directories({
		"glfw",
		"spdlog",
		"Vulkan-Headers"
	});

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./src/gif_io"
	});

	properties.files({
		"./include/**.h",
		"./src/**.c",
		"./src/**.m"
	});

	{
		MultiBuild::ScopedFilter _(workspace, "config.platform:Windows");

		properties.defines({
			"_GLFW_WIN32", 
			"_CRT_SECURE_NO_WARNINGS"
		});

		properties.excluded_files({
			"./src/wl_init.c",
			"./src/x11_init.c",
			"./src/wl_window.c",
			"./src/posix_poll.c",
			"./src/x11_window.c",
			"./src/wl_monitor.c",
			"./src/cocoa_time.c",
			"./src/posix_time.c",
			"./src/xkb_unicode.c",
			"./src/x11_monitor.c",
			"./src/glx_context.c",
			"./src/posix_module.c",
			"./src/posix_thread.c",
			"./src/linux_joystick.c",

			"./**.m"
		});
	}
}