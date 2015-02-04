on run {input, parameters}
	
	set password to the text returned of (display dialog "Enter password to decrypt file(s):" default answer "" buttons {"OK"} default button 1)
	
	return password
end run