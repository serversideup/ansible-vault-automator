## ENCRYPT - Automator will pass the selected finder items to this shell script
## with the preferred password from the user. It will encrypt all files
## with the same password.

#Include bin files so ansible-vault is accessible
export PATH=/usr/local/bin:$PATH

#For each selected file, encrypt it with the user's password
for file in "${@:2}";
do
  expect -c "
  set timeout -1
  spawn ansible-vault encrypt \"$file\"
  expect \"Vault password:\"
  # Send password aka $1
  send -- \"$1\r\"
  expect \"Confirm Vault password:\"
  send -- \"$1\r\"
  expect eof
  "
done