render
renderChartTypeComboOn: html withCharts: chartsNames
	| chartTypes |

	chartTypes := chartsNames collect: [:each | each translateFor: self session user]. 

	^self renderGenericActiveComboOn: html withList: chartTypes forVariable: 'chart-type' label: 'Chart Type'