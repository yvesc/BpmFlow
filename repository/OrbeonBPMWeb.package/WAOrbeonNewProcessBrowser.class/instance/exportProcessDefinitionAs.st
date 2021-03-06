other
exportProcessDefinitionAs
	| selectedOption stream |

	selectedOption := (self componentValueAt: 'exportProcess') "the jqdialog set this value"ifNil: [^self] ifNotNil: [:value | value].

	(selectedOption = #xpdl) ifTrue: [^self downloadProcessMap].

	(selectedOption = #svg) ifFalse: [^self].

	stream := PrintStream on: String new.

	stream nextPutAll: self xmlHeader, String lf,((BizagiSvgConverter convert: selectedLateralItem xmlString) generateSVGFor: selectedLateralItem).

	self requestContext respond: [:response | 
        response document: ((stream contents asByteArray seasideMimeDocument) 
                                        mimeType: 'image/svg+xml'; 
                                        fileName: (selectedLateralItem processName, '.svg'); 
                                        yourself)].