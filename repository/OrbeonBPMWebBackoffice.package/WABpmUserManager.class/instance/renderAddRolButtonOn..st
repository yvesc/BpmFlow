other
renderAddRolButtonOn: html

	html anchor callback: [self switchAddingUser];
					with: [html image url: (SEWAFFileLibrary / #useradd24iconPng); 
											altText: ('Add Role to User' translateFor: self session user); 
											title: ('Add Role to User' translateFor: self session user)].