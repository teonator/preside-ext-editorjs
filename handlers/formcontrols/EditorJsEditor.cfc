component {

	public string function index( event, rc, prc, args={} ) {
		var editorJsTools = [:];
		for ( var tool in getSetting( name="editorJs.tools", defaultValue=[] ) ) {
			event.include( "editorjs#tool#" );

			var toolConfig = runEvent(
				  event          = "EditorJs.tools.#tool#.getConfig"
				, private        = true
				, prePostExempt  = true
				, eventArguments = { args=args }
			);

			if ( !StructIsEmpty( toolConfig ) ) {
				StructAppend( editorJsTools, toolConfig );
			}
		}

		event.include( "/css/editorJs/" )
			 .include( "/js/editorJs/"  )
			 .includeData( { editorJsTools=editorJsTools } );

		return renderView( view="/formcontrols/editorJsEditor/index", args=args );
	}

}