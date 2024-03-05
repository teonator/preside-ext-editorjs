component {

	private struct function getConfig( event, rc, prc, args={} ) {
		return {
			checklist = {
				  class         = "Checklist"
				, inlineToolbar = true
			}
		};
	}

	private string function renderData( event, rc, prc, args={} ) {
		var listContent = "";

		for ( var item in args.items ) {
			var itemIcon = "fa-square";
			if ( isTrue( item.checked ?: "" ) ) {
				itemIcon = "fa-check-square";
			}

			listContent &= '<li><i class="fa fa-fw #itemIcon#"></i>&nbsp;#item.text#</li>';
		}

		return "<ul class='list-unstyled'>#listContent#</ul>";
	}
}