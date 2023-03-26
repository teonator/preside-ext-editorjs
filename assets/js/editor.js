( function() {

	var editorJsTools = cfrequest.editorJsTools || {};

	for ( var tool in editorJsTools ) {
		editorJsTools[ tool ].class = window[ editorJsTools[ tool ].class ];
	}

	var editor = new EditorJS( {
		  holder     : 'editorjs'
		, placeholder: 'Start'
		, tools      : editorJsTools
		, onReady    : function() {

		}
		, onChange   : function( api, event ) {

		}
	} );

} () );