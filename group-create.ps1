New-AzureADGroup -DisplayName Admins -MailEnabled $false -MailNickName Admins -SecurityEnabled $true
New-AzureADGroup -DisplayName Developers -MailEnabled $false -MailNickName Admins -SecurityEnabled $true
New-AzureADGroup -DisplayName Guests -MailEnabled $false -MailNickName Admins -SecurityEnabled $true