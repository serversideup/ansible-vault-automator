on run {input, parameters}
	
	set x to the text returned of (display dialog "Enter password to encrypt file(s):" default answer "" buttons {"OK"} default button 1)
	
	return x
end run