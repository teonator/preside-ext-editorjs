( function() {

	var editorJsTools = cfrequest.editorJsTools || {};

	for ( var tool in editorJsTools ) {
		editorJsTools[ tool ].class = window[ editorJsTools[ tool ].class ];
	}

	var editor = new EditorJS( {
		  holder      : 'editorjs'
		, placeholder : 'Start'
		, readOnly    : true
		, tools       : editorJsTools
		, data        : {
			blocks: [
				  {
					  type : 'header'
					, data : {
						  text  : 'Untitled'
						, level : 1
					}
				 }
				, {
					  type : 'paragraph'
					, data : {
						text : 'Lorem ipsum dolor sit amet, quas euismod similique pri ex, ex nostrum ullamcorper suscipiantur per, ei eum error electram necessitatibus. Ex sea dolorem rationibus philosophia, nam putant deleniti imperdiet ex.'
					}
				  }
			]
		  }
		, onReady     : function() {

		  }
		, onChange    : function( api, event ) {

		  }
	} );

	$( function() {
		$( '#editorjs-edit-mode' ).on( 'click', async function() {
			const isReadOnlyState = await editor.readOnly.toggle();

			$( '#editorjs-footbar' ).toggle( !isReadOnlyState );
		} );
	} );

} () );