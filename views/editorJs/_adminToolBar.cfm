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
							<label>
								Edit
								<input id="editModeButton" class="ace ace-switch ace-switch-6" type="checkbox" />
								<span class="lbl"></span>
							</label>
						</li>
						<li>
							<button class="btn btn-xs btn-info">
								<i class="fa fa-save"></i>
								Save draft
							</button>
						</li>
						<li>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-globe"></i>
								Publish changes
							</button>
						</li>
					</ul>
				</div>

				<div class="navbar-header pull-right">
				</div>
			</div>
		</div>
	</div>
</cfoutput>