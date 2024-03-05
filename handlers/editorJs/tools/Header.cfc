component {

	private struct function getConfig( event, rc, prc, args={} ) {
		return { header={ class="Header" } };
	}

	private string function renderData( event, rc, prc, args={} ) {
		var headingTag = "h#args.level ?: 1#"

		return "<#headingTag#>#args.text#</#headingTag#>";
	}
}