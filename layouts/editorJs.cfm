<cfscript>
	body         = renderView();
	mainNav      = renderViewlet( "core.navigation.mainNavigation" );
	metaTags     = renderView( "/general/_pageMetaForHtmlHead" );
	adminToolBar = renderView( "/editorJs/_adminToolBar" );

	event
		.include( "css-bootstrap" )
		.include( "css-layout" )
	;
</cfscript>

<cfoutput><!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		#metaTags#
		#event.renderIncludes( "css" )#
	</head>
	<body>
		<div class="container">
			<div class="header">
				<ul class="nav nav-pills pull-right">
					#mainNav#
				</ul>
				<h3 class="text-muted"><a href="/">Preside CMS</a></h3>
			</div>

			#body#

			<div class="footer">
				<p>&copy; Pixl8 2013-#Year( Now() )#</p>
			</div>
		</div>

		#adminToolBar#

		#event.renderIncludes( "js" )#
	</body>
</html></cfoutput>