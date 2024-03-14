component {

	private string function default( event, rc, prc, args={} ){
		if ( Len( Trim( args.data ?: "" ) ) ) {
			return IsJSON( args.data ) ? _processData( content=args.data ) : renderContent( "richeditor", args.data );
		}

		return "";
	}

	private string function _processData( required string content ) {
		var processed  = "";
		var savedItems = DeserializeJSON( arguments.content );
		var blocks     = IsArray( savedItems.blocks ?: "" ) ? savedItems.blocks : [];

		for ( var block in blocks ) {
			var viewlet = "editorJs.tools.#block.type#.renderData";

			if ( getController().viewletExists( viewlet ) ) {
				processed &= renderViewlet( event=viewlet, args=block.data );
			} else {
				processed &= '<div class="alert alert-warning">#translateResource( uri="editorJs:editor.block.renderer.missing", data=[ block.type ] )#</div>';
			}
		}

		return processed;
	}
}