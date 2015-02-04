## DECRYPT - Automator will pass the selected finder items to this shell script
## with the preferred password from the user. It will encrypt all files
## with the same password.

#Include bin files so ansible-vault is accessible
export PATH=/usr/local/bin:$PATH

#For each selected file, decrypt it with the user's password
for file in "${@:2}";
do
  expect -c "
  set timeout -1
  spawn ansible-vault decrypt \"$file\"
  expect \"Vault password:\"
  # Send password aka $1
  send -- \"$1\r\"
  expect eof
  "
done