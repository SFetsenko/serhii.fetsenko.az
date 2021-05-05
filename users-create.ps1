$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "<password>"
New-AzureADUser -DisplayName "Admin" -PasswordProfile $PasswordProfile -UserPrincipalName "admin@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "admin"
New-AzureADUser -DisplayName "dev1" -PasswordProfile $PasswordProfile -UserPrincipalName "dev1@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "dev1"
New-AzureADUser -DisplayName "dev2" -PasswordProfile $PasswordProfile -UserPrincipalName "dev2@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "dev2"
New-AzureADUser -DisplayName "deploy" -PasswordProfile $PasswordProfile -UserPrincipalName "deploy@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "deploy"
New-AzureADUser -DisplayName "guest" -PasswordProfile $PasswordProfile -UserPrincipalName "guest@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "guest"