<cfscript>
	public string function renderEditorJs() {
		return runEvent( 
			  event          = "EditorJs.Core.renderEditor"
			, private        = true
			, prePostExempt  = true
			, eventArguments = { args=arguments } 
		);
	}
</cfscript>