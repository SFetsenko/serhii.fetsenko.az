$servername = "octopus-server"
$size = "Standard_D1"
$username = "octopusmadmin"
$vnetname = "vnet-01"
$subnetname = "octopus-subnet"
$prip = "10.0.1.10"
$pipname = "jenkins-master"
$PsswdGenerate = [System.Web.Security.Membership]::GeneratePassword(12,2)
$keyvault = "kv-serhii-fetsenko"
$rgName = "SKILLUP-RG"
$location = "westus"


#create NIC with static private IP
$vnet = Get-AzVirtualNetwork -Name $vnetname
$subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnetname -VirtualNetwork $vnet
$nsg = Get-AzNetworkSecurityGroup -Name "vnet-01-nsg" -ResourceGroupName $rgName
$IpConfigName = "$servername-ipconfig"
$pip = New-AzPublicIpAddress -Name $pipname -ResourceGroupName $rgName -Location $location -AllocationMethod Static 
$IpConfig = New-AzNetworkInterfaceIpConfig -Name $IpConfigName -Subnet $subnet -PrivateIpAddress $prip -Primary -PublicIpAddress $pip
$NIC = New-AzNetworkInterface -Name "$servername-nic" -ResourceGroupName $rgName -Location $location -IpConfiguration $IpConfig -NetworkSecurityGroup $nsg

#Credential create and upload to KeyVault
$VMLocalAdminSecurePassword = ConvertTo-SecureString $PsswdGenerate -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($username, $VMLocalAdminSecurePassword);

#Create Data Disk
$diskConfig = New-AzDiskConfig -SkuName Standard_LRS -Location $location -CreateOption Empty -DiskSizeGB 64
$dataDisk = New-AzDisk -DiskName "$servername-DataDisk" -Disk $diskConfig -ResourceGroupName $rgName

#VM config and create
$VirtualMachine = New-AzVMConfig -VMName $servername -VMSize $size
$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $servername -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate
$VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
$VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -PublisherName 'MicrosoftWindowsServer' -Offer 'WindowsServer' -Skus '2016-Datacenter' -Version latest
$VirtualMachine = Add-AzVMDataDisk -VM $VirtualMachine -Name "$servername-DataDisk" -CreateOption Attach -ManagedDiskId $dataDisk.Id -Lun 1


New-AzVM -ResourceGroupName $rgName -Location $location -VM $VirtualMachine -Verbose
Set-AzKeyVaultSecret -VaultName $keyvault -Name $servername -SecretValue $VMLocalAdminSecurePassword -Tag @{username = $username; PrivateIP = $prip}