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

		bundle.addAsset( id="jquery", url="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" );

		bundle.asset( "jquery" ).before( "editorjsinit" );

		bundle.addAsset( id="editorjs", url="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@2.26.5/dist/editor.js" );
		bundle.addAsset( id="editorjsinit", path="/js/editor.js" );

		bundle.asset( "editorjsinit" ).dependsOn( "editorjs" );

		var editorJsTools = {
			  "header" = "https://cdn.jsdelivr.net/npm/@editorjs/header@2.7.0/dist/bundle.min.js"
			, "image"  = "https://cdn.jsdelivr.net/npm/@editorjs/image@2.8.1/dist/bundle.min.js"
			, "list"   = "https://cdn.jsdelivr.net/npm/@editorjs/list@1.8.0/dist/bundle.min.js"
		};

		for ( var key in editorJsTools ) {
			bundle.addAsset( id="editorjs#key#", url=editorJsTools[ key ] );
			bundle.asset( "editorjs#key#" ).before( "editorjs" );
		}
	}

}
