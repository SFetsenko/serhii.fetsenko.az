$group = "Admins" #Developers, Guests
New-AzureADGroup -DisplayName $group -MailEnabled $false -MailNickName $group -SecurityEnabled $true