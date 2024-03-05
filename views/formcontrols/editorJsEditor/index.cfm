<cfscript>
	inputName    = args.name         ?: "";
	inputId      = args.id           ?: "";
	inputClass   = args.class        ?: "";
	placeholder  = args.placeholder  ?: "";
	defaultValue = args.defaultValue ?: ( args.savedValue ?: "" );
	readOnly     = args.readOnly     ?: false;

	value = event.getValue( name=inputName, defaultValue=defaultValue );
	if ( !IsSimpleValue( value ) ) {
		value = "";
	}
</cfscript>

<cfoutput>
	<div id="#inputId#-wrapper" class="editorjs-editor #inputClass#"
		data-editorjs-placeholder="#placeholder#"
		data-editorjs-readonly="#readOnly#"
	>
		<input type="hidden" id="#inputId#" name="#inputName#" value="#EncodeForHTML( value )#" />
	</div>
</cfoutput>