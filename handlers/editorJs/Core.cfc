component {

	public string function renderEditor( event, rc, prc ) {
		event
			.include( "jquery" )
			.include( "editorjs" )
			.include( "editorjsinit" )
			.include( "/css/editorJs/" )
		;

		var editorJsTools = [:];
		for ( var tool in getSetting( name="editorJs.tools", defaultValue=[] ) ) {
			event.include( "editorjs#tool#" );

			StructAppend( editorJsTools, runEvent(
			  event          = "EditorJs.tools.#tool#.getConfig"
				, private        = true
				, prePostExempt  = true
				, eventArguments = {}
			) );
		}

		event.includeData( { editorJsTools=editorJsTools } );

		return '<div id="editorjs"></div>';
	}

	public string function renderContent( event, rc, prc ) {


	}

}