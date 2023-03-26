<cfscript>
	event
		.include( "/css/admin/core/" )
		.include( "/css/admin/frontend/" )
	;
</cfscript>

<cfoutput>
	<div class="presidecms preside-admin-toolbar">
		<div class="preside-theme">
			<div class="navbar navbar-default" id="preside-admin-toolbar">
				<a href="#event.buildAdminLink()#"><h1>#translateResource( "cms:admintoolbar.title" )#</h1></a>

				<div class="navbar-header pull-left">
					<ul class="nav ace-nav">
						<li>
							<a class="edit-mode-toggle-container">
								<label>
									Edit
									<input id="edit-mode-options" class="ace ace-switch ace-switch-6" type="checkbox" />
									<span class="lbl"></span>
								</label>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</cfoutput>