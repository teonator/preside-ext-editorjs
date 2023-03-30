var editorJsJQuery = jQuery.noConflict();

( function( $ ) {

	var editorJsTools = cfrequest.editorJsTools || {};

	for ( var tool in editorJsTools ) {
		editorJsTools[ tool ].class = window[ editorJsTools[ tool ].class ];
	}

	$.fn.editorJsEditor = function() {
		return this.each( function() {
			var $this       = $( this )
			  , $hidden     = $( 'input[type="hidden"]' , this )
			  , placeholder = $this.data( 'editorjs-placeholder' )
			  , readOnly    = $this.data( 'editorjs-readonly' )
			;

			var editor = new EditorJS( {
				  holder      : this.id
				, placeholder : placeholder
				, readOnly    : readOnly
				, tools       : editorJsTools
				, onReady     : function() {
					editor.render( JSON.parse( $hidden.val() ) );
				  }
				, onChange    : function( api, event ) {
					editor.save()
						.then( ( data ) => {
							 $hidden.val( JSON.stringify( data ) );
						} )
						.catch( ( error ) => {

						} )
					;
				  }
			} );

		} );
	};

	$( function() {
		$( '.editorjs-editor' ).editorJsEditor();
	} );

} ( editorJsJQuery ) );