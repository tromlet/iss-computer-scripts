# Adds the INSS-Admin local administrator to the computer
net user "INSS-Admin" "" /add

# Adds the INSS-Admin user to the local administrators group
net localgroup "Administrators" "INSS-Admin" /add

# Removes password expiration from the INSS-Admin user
wmic UserAccount where Name="INSS-Admin" set PasswordExpires=false