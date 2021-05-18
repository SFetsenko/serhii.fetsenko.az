$rgName = "SKILLUP-RG"
$accountName = "saserhiifetsenko"
$blobs = "logs","scropts","files"

$getsa = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName

#Disable Blob Public Access 
$getsa | Set-AzStorageAccount -AllowBlobPublicAccess $false

#Create containers
ForEach ($blob in $blobs)
{
    $getsa | New-AzStorageContainer -Name $blob
}

#Upload file
$storcontext=$getsa.Context
Set-AzStorageBlobContent -Container "files" -File "D:\projects\ChromeSetup.exe" -Context $storcontext
