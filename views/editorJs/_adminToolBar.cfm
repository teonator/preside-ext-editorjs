<cfif event.isAdminUser() and !getModel( "loginService" ).twoFactorAuthenticationRequired( ipAddress=event.getClientIp(), userAgent=event.getUserAgent() )>
	<cfscript>
		prc.hasCmsPageEditPermissions = prc.hasCmsPageEditPermissions ?: hasCmsPermission( permissionKey="sitetree.edit", context="page", contextKeys=event.getPagePermissionContext() );

		event.include( "/js/admin/presidecore/" );

		if ( prc.hasCmsPageEditPermissions ) {
			event.include( "/js/admin/frontend/" );
			event.includeData({
				  ajaxEndpoint = event.buildAdminLink( linkTo="ajaxProxy.index" )
				, adminBaseUrl = event.getAdminPath()
			});
		}

		event.include( "i18n-resource-bundle" );
		event.include( "/css/admin/core/" );
		event.include( "/css/admin/frontend/" );

		toolbarUrl = event.buildAdminLink(
			  linkTo      = 'general.adminToolbar'
			, querystring = 'pageId=#event.getCurrentPageId()#&template=#event.getCurrentTemplate()#'
		);

		if ( hasCmsPermission( "devtools.console" ) ) {
			event.include( "/js/admin/devtools/" )
			     .include( "/css/admin/devtools/" )
			     .includeData( { devConsoleToggleKeyCode=getSetting( "devConsoleToggleKeyCode" ) } );
		}

		userMenu          = renderView( "/admin/layout/userMenu" );
		notificationsMenu = renderViewlet( "admin.notifications.notificationNavPromo" );
		systemAlertsMenu  = renderViewlet( "admin.systemAlerts.systemAlertsMenuItem" );

		toggleLiveContentLink = event.buildAdminLink( linkTo="general.toggleNonLiveContent" );
		editPageLink          = event.getEditPageLink();
	</cfscript>

	<cfoutput>
		<div class="presidecms preside-admin-toolbar">
			<div class="preside-theme">
				<div class="navbar navbar-default" id="preside-admin-toolbar">
					<a href="#event.buildAdminLink()#"><h1>#translateResource( "cms:admintoolbar.title" )#</h1></a>

					<cfif prc.hasCmsPageEditPermissions>
						<div class="navbar-header pull-left">
							<ul class="nav ace-nav">
								<li>
									<a class="edit-mode-toggle-container">
										<label>
											#translateResource( "cms:admintoolbar.editmode" )#
											<input id="editorjs-edit-mode" class="ace ace-switch ace-switch-6" type="checkbox" />
											<span class="lbl"></span>
										</label>
									</a>

									<a href="#editPageLink#">
										<i class="fa fa-pencil fa-lg fa-fw"></i> #translateResource( 'cms:admintoolbar.edit.page' )#
									</a>
								</li>
								<li class="no-border-left">
									<a data-toggle="preside-dropdown" href="##" class="dropdown-toggle">
										<i class="fa fa-eye-slash fa-lg fa-fw"></i>
										#translateResource( 'cms:admintoolbar.show.hide' )#
										<i class="fa fa-caret-down"></i>
									</a>

									<ul class="user-menu dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
										<li>
											<a href="#toggleLiveContentLink#">
												<cfif event.showNonLiveContent()>
													<i class="fa fa-fw smaller-80"></i>
												<cfelse>
													<i class="fa fa-check fa-fw grey smaller-80"></i>
												</cfif>
												#translateResource( 'cms:admintoolbar.show.live.only' )#
											</a>
										</li>
										<li>
											<a href="#toggleLiveContentLink#">
												<cfif event.showNonLiveContent()>
													<i class="fa fa-check fa-fw grey smaller-80"></i>
												<cfelse>
													<i class="fa fa-fw smaller-80"></i>
												</cfif>
												#translateResource( 'cms:admintoolbar.show.non.live' )#
											</a>
										</li>
									</ul>

								</li>
							</ul>
						</div>
					</cfif>
					<div class="navbar-header pull-right">
						<ul class="nav ace-nav">
							<cfif event.isWebUserImpersonated()>
								<li>
									&nbsp;
									<a class="pr-0 orange" href="#event.buildAdminLink( objectName="website_user", operation="viewRecord", recordId=getLoggedinUserId() )#">
										<i class="fa fa-fw fa-lg fa-mask orange"></i>
										#translateResource( uri="cms:admintoolbar.impersonating.web.user", data=[ getLoggedInUserDetails().email_address ] )#
									</a>
									<a class="p-0" href="#event.buildLink( linkto="login.logout" )#">
										<i class="fa fa-fw fa-lg fa-times"></i>
									</a>
									&nbsp;
								</li>
							</cfif>
							#systemAlertsMenu#
							<li>#notificationsMenu#</li>
							<li>#userMenu#</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="presidecms preside-admin-toolbar preside-editorjs-toolbar preside-editorjs-footbar" id="editorjs-footbar">
			<div class="preside-editorjs-container">
				<button type="button" name="_saveAction" value="savedraft" class="btn btn-info editor-btn-save" tabindex="#getNextTabIndex()#">
					<i class="fa fa-save bigger-110"></i> #translateResource( "cms:frontendeditor.editor.save.btn" )#
				</button>

				<button type="button" name="_saveAction" value="publish" class="btn btn-warning editor-btn-publish" tabindex="#getNextTabIndex()#">
					<i class="fa fa-globe bigger-110"></i> #translateResource( "cms:frontendeditor.editor.publish.btn" )#
				</button>

				<button class="btn editor-btn-cancel">
					<i class="fa fa-reply"></i>
					#translateResource( "cms:frontendeditor.editor.cancel.btn" )#
				</button>
			</div>
		</div>
	</cfoutput>
</cfif>
