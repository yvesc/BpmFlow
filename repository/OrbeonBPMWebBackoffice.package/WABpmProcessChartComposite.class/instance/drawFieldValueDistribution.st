other
drawFieldValueDistribution
	| definition text |

	definition := self getSelectedProcessDefinitions ifEmpty: [^self] ifNotEmpty: [:collection | collection last].
	report := definition reportValueDistributionFor: self getFieldName in: self getFormName from: self getStartDate to: self getEndDate satisfying: self queryBlock.
	self analyzeQueryBlockIfFail: [:analyzer | ^self queryBlockFailedWith: analyzer].
	report name: ('Processes Distribution by Field Value' translateFor: self session user);
		creator: self session user.

	canvas := self svgCanvasClass newWidth: '100%' height: '100%'.

	text := report name, (' | Total Process Instances: ' translateFor: self session user) , report getTotalValue printString.

	canvas drawText: text at: 10@30 textSizePx: '18px'.

	self isBarChart ifTrue: [canvas drawVerticalBarGraph: report rootDistribution at: 10@10 maxHeight: 270 width: 40 transform: 'translate(20,330)'].
	self isDonutChart ifTrue: [canvas drawDonutQuantity: report rootDistribution at: 10@20 radius: 120 width: 60 backcolor: '#BCBCBC' transform: 'translate(150,170)'.]. 

	report svgContents: canvas contents.