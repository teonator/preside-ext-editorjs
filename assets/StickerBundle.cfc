component output=false {

	public void function configure( bundle ) {

		bundle.addAssets(
			  directory   = "/js"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

		bundle.addAssets(
			  directory   = "/css"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.css$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

		bundle.addAsset( id="editorjs", url="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest", type="js" );
		bundle.asset( "/js/editorJs/" ).dependsOn( "editorjs" );

		var editorJsTools = {
			  "header"     = "https://cdn.jsdelivr.net/npm/@editorjs/header@latest"
			, "image"      = "https://cdn.jsdelivr.net/npm/@editorjs/image@latest"
			, "list"       = "https://cdn.jsdelivr.net/npm/@editorjs/link@latest"
			, "quote"      = "https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"
			, "table"      = "https://cdn.jsdelivr.net/npm/@editorjs/table@latest"
			, "linkTool"   = "https://cdn.jsdelivr.net/npm/@editorjs/link@latest"
			, "checklist"  = "https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"
			, "nestedlist" = "https://cdn.jsdelivr.net/npm/@editorjs/nested-list@latest"
		};

		for ( var key in editorJsTools ) {
			bundle.addAsset( id="editorjs#key#", url=editorJsTools[ key ], type="js" );
			bundle.asset( "editorjs#key#" ).dependsOn( "editorjs" );
			bundle.asset( "/js/editorJs/" ).dependsOn( "editorjs#key#" );
		}
	}

}
