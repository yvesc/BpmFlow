*orbeonBizagiSvgConverter
drawOn: aJasvgiBpmCanvas
	| transition |

	transition := 
		aJasvgiBpmCanvas 
			connectWith: coordinates
			color: 'gray'
			widthPx: '1px'.

	transition setMarkerEnd: 'arrow'