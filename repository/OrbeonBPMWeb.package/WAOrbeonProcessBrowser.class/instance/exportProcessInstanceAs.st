process
exportProcessInstanceAs
	| selectedOption stream converter |

	selectedOption := (self componentValueAt: 'exportProcess') "the jqdialog set this value"ifNil: [^self] ifNotNil: [:value | value].

	(selectedOption = #xpdl) ifTrue: [^self downloadProcessMap].

	(selectedOption = #svg) ifFalse: [^self].

	stream := PrintStream on: String new.
	converter := BizagiSvgConverter convert: (selectedLateralItem process generateProcessMapFor: self session user) prettyPrinted.

	stream nextPutAll: self xmlHeader, String lf;
		nextPutAll: (converter generateSVGFor: self session user assignment: selectedLateralItem).

	self requestContext respond: [:response | 
        response document: ((stream contents asByteArray seasideMimeDocument) 
                                        mimeType: 'image/svg+xml'; 
                                        fileName: (selectedLateralItem processName, '.svg'); 
                                        yourself)].