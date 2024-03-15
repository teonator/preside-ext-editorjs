component {

	private struct function getConfig( event, rc, prc, args={} ) {
		return {
			nestedlist = {
				  class         = "NestedList"
				, inlineToolbar = true
			}
		};
	}

	private string function renderData( event, rc, prc, args={} ) {
		var listTag     = ( args.style == "unordered" ) ? "ul" : "ol";
		var listContent = "";

		var renderListItem = function( required struct listItem ) {
			var thisItemContent       = listItem.content;
			var thisNestedItemContent = "";

			for ( var subitem in listItem.items ) {
				thisNestedItemContent &= renderListItem( listItem=subitem );
			}

			if ( Len( Trim( thisNestedItemContent ) ) ) {
				thisItemContent &= "<#listTag#>#thisNestedItemContent#</#listTag#>";
			}

			return "<li>#thisItemContent#</li>";
		};

		for ( var item in args.items ) {
			listContent &= renderListItem( listItem=item );
		}

		return "<#listTag#>#listContent#</#listTag#>";
	}
}