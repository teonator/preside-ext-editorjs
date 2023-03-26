component {

	public void function preHandler( event, action, eventArguments ) {
		event.setLayout( "editorJs" );
	}

	public function index( event, rc, prc, args={} ) {
		return renderView(
			  view = "page-types/editorJs/index"
			, args = args
		);
	}

}