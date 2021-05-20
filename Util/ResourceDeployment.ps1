#New-AzResourceGroupDeployment -Name "new-vnet" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\vnet.json
#New-AzResourceGroupDeployment -Name "new-nsg" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\nsg.json
Connect-AzAccount
New-AzResourceGroupDeployment -Name "new-vm" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\VirtualMachine\vm.json -TemplateParameterFile .\VirtualMachine\vm.parameters.json