on run {input, parameters}
  set completedItems to {}
  repeat with f in input
    set f to (f as text)
    tell application "Terminal" to do script "ansible-vault edit " & quoted form of POSIX path of f
    set completedItems to (completedItems & f) --mark off items that are already completed
  end repeat
  activate application "Terminal"
end run