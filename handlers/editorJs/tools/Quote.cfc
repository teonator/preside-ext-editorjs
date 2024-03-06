component {

	private struct function getConfig( event, rc, prc, args={} ) {
		return {
			quote = {
				  class         = "Quote"
				, inlineToolbar = true
				, config        = {
					  quotePlaceholder   = "Quote"
					, captionPlaceholder = "Author"
				}
			}
		};
	}

	private string function renderData( event, rc, prc, args={} ) {
		var content = args.text ?: "";

		if ( Len( Trim( args.caption ?: "" ) ) ) {
			content &= "<footer>#args.caption#</footer>";
		}

		return "<blockquote>#content#</blockquote>";
	}
}