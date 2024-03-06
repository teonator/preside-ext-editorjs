component {

	private struct function getConfig( event, rc, prc, args={} ) {
		return {
			table = {
				  class         = "Table"
				, inlineToolbar = true
			}
		};
	}

	private string function renderData( event, rc, prc, args={} ) {
		var content = "<table class='table'>";
		var items   = args.content;
		var hasHead = isTrue( args.withHeadings ?: "" );
		var heading = hasHead ? ArrayFirst( items ) : [];

		if ( hasHead ) {
			ArrayDeleteAt( items, 1 );
		}

		if ( ArrayLen( heading ) ) {
			content &= "<thead><tr>";

			for ( var head in heading ) {
				content &= "<th>#head#</th>";
			}

			content &= "</tr></thead>";
		}

		content &= "<tbody>";

		for ( var row in items ) {
			content &= "<tr>";

			for ( var col in row ) {
				content &= "<td>#col#</td>";
			}

			content &= "</tr>";
		}

		content &= "</tbody>";
		content &= "</table>";
		return content;
	}
}