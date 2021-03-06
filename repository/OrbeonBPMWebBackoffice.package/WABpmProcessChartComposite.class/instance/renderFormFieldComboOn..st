render
renderFormFieldComboOn: html
	|  fieldNames |

	fieldNames := self getProcessFieldList.
	html div class: 'top-search-div'; with: [
		html label 
			attributeAt: 'for' put: 'form-fields';
			with: ('Field' translateFor: self session user).

		html select "Field Definition List" 
			attributeAt: 'id' put: 'form-fields';
			class: 'width-200px';
			list: fieldNames;
			onChange: 'submit()';
			callback: [:value | self addSearchValue: value named: 'field-name'];
			selected: (self searchValueAt: 'field-name' ifAbsent: [fieldNames ifNotEmpty: [fieldNames first].]).
	].

	(self isDoubleDonutChart or: [self isDoubleBarChart]) ifTrue: [self renderFormFieldCombo2On: html]