component {

	private struct function getConfig( event, rc, prc, args={} ) {
		var linkProcessor = args.linkProcessor ?: "";

		if ( Len( Trim( linkProcessor ) ) ) {
			return {
				linkTool = {
					  class  = "LinkTool"
					, config = { endpoints=event.buildLink( linkto=linkProcessor ) }
				}
			};
		}
		return {};
	}

	private string function renderData( event, rc, prc, args={} ) {
		return '<p><a href="#args.link#" target="_blank">#args.link#</a></p>';
	}
}