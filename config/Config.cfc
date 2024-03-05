component {

	public void function configure( required struct config ) {
		var conf     = arguments.config;
		var settings = conf.settings ?: {};

		settings.editorJs.tools = [
			  "header"
			, "nestedlist"
			, "image"
			, "quote"
			, "table"
			, "linkTool"
			, "checklist"
		];
	}
}
