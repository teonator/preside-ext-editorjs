<cfscript>
	event
		.include( "/css/admin/core/" )
		.include( "/css/admin/frontend/" )
	;
</cfscript>

<cfoutput>
	<div class="presidecms preside-admin-toolbar preside-admin-toolbar-editorjs">
		<div class="preside-theme">
			<div class="navbar navbar-default" id="preside-admin-toolbar">
				<a href="#event.buildAdminLink()#"><h1>#translateResource( "cms:admintoolbar.title" )#</h1></a>

				<div class="navbar-header">
					<label>
						Edit
						<input id="edit-mode-checkbox" class="ace ace-switch ace-switch-6" type="checkbox" />
						<span class="lbl"></span>
					</label>

					<button class="btn btn-mini btn-info btn-editorjs" id="save-button">
						<i class="fa fa-save"></i>
						Save
					</button>

					<button class="btn btn-mini btn-warning btn-editorjs" id="publish-button">
						<i class="fa fa-globe"></i>
						Publish
					</button>
				</div>
			</div>
		</div>
	</div>
</cfoutput>