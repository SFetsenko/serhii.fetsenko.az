Connect-AzAccount
#Set-Location -Path .\VirtualMachine

$resourceGropName = "SKILLUP-RG"
$temlateFile = "vm.json"
$parametersFiles =  `
"OctopusServer.vm.parameters.json", `
"WebServer01.vm.parameters.json", `
"WebServer02.vm.parameters.json", `
"SqlServer02.vm.parameters.json"
foreach ($parametersFile in $parametersFiles) {
    New-AzResourceGroupDeployment -Name $parametersFile -ResourceGroupName $resourceGropName -TemplateFile $temlateFile -TemplateParameterFile $parametersFile
}