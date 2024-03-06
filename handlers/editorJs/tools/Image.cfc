component {

	public struct function getConfig( event, rc, prc ) {
		return {
			image = {
				  class  = "ImageTool"
				, config = {
					endpoints = {
						byUrl = ""
					}
				  }
			}
		};
	}

}