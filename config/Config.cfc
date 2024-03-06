component {

	public void function configure( required struct config ) {
		var conf     = arguments.config;
		var settings = conf.settings ?: {};

		settings.editorJs.tools = [
			  "header"
			, "list"
			, "image"
			, "quote"
			, "table"
		];
	}
}
