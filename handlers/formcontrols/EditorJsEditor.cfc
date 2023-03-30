component {

	public string function index( event, rc, prc, args={} ) {
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

		event
			.include( "jquery" )
			.include( "editorjs" )
			.include( "/js/editorJs/" )
		;

		return renderView( view="/formcontrols/editorJsEditor/index", args=args );
	}

}