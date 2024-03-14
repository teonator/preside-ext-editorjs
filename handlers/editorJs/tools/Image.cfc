component {

	private struct function getConfig( event, rc, prc, args={} ) {
		var imageFileProcessor = args.imageFileProcessor ?: "";
		var imageUrlProcessor  = args.imageUrlProcessor  ?: "";
		var imageProcessorKeys = args.imageProcessorKeys ?: "";

		if ( Len( Trim( imageFileProcessor ) ) && Len( Trim( imageUrlProcessor ) ) ) {
			var linkQs = [];

			for ( var key in imageProcessorKeys ) {
				if ( Len( Trim( rc[ key ] ?: "" ) ) ) {
					ArrayAppend( linkQs, "#key#=#rc[ key ]#" )
				}
			}

			return {
				image = {
					  class  = "ImageTool"
					, config = {
						endpoints = {
							  byFile = event.buildLink( linkto=imageFileProcessor, queryString=ArrayToList( linkQs, "&" ) )
							, byUrl  = event.buildLink( linkto=imageUrlProcessor , queryString=ArrayToList( linkQs, "&" ) )
						}
					}
				}
			};
		}
		return {};
	}

	private string function renderData( event, rc, prc, args={} ) {
		if ( Len( Trim( args.file.url ?: "" ) ) ) {
			return '<div class="text-center"><img src="#args.file.url#" width="80%" alt="#args.caption ?: ""#" /></div>'
		}
		return "";
	}
}