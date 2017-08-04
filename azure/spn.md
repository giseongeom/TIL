# ServicePrincipal 

## Create

* AzureRM Powershell 설치되어 있다고 가정
```
$sp = New-AzureRmADServicePrincipal -DisplayName tech_support-giseong.eom -Password '패스워드'
Sleep 20
New-AzureRmRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $sp.ApplicationId
```

