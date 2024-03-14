component {

	public struct function getConfig( event, rc, prc ) {
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

}