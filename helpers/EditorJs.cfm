<cfscript>
	public string function renderEditorJs() {
		return runEvent( 
			  event          = "EditorJs.renderEditor"
			, private        = true
			, prePostExempt  = true
			, eventArguments = { args=arguments } 
		);
	}
</cfscript>