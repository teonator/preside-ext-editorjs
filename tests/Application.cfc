component {
	this.name = "EditorJs Test Suite";

	this.mappings[ '/tests'   ] = ExpandPath( "/" );
	this.mappings[ '/testbox' ] = ExpandPath( "/testbox" );
	this.mappings[ '/editorjs'  ] = ExpandPath( "../" );

	setting requesttimeout=60000;
}
