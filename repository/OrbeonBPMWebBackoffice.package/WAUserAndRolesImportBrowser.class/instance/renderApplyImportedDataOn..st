other
renderApplyImportedDataOn: html

	importedConfigurationBatchList items notEmpty
	ifTrue: [
		html submitButton 
				callback: [self applyImportedConfiguration]; 
				with: ('3. Apply Configuration' translateFor: self session user).
	].