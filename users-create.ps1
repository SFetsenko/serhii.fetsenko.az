$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "<password>"
$user = "admin" #dev1, dev2, deploy, guest
New-AzureADUser -DisplayName $user -PasswordProfile $PasswordProfile -UserPrincipalName "$user@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName "admin"