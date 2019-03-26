# ServicePrincipal 

## Create

* AzureRM Powershell
```
$sp = New-AzureRmADServicePrincipal -DisplayName tech_support-giseong.eom -Password '패스워드'
Sleep 20
New-AzureRmRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $sp.ApplicationId
```

* Azure CLI 2.0
  * 생성하면서 동시에 Subscription 수준으로 `Reader` role 할당
```bash
az ad sp create-for-rbac -n tech_support-prod --role reader
{
  "appId": "db390b74-b38a-4328-bd31-3b12772a0898",
  "displayName": "tech_support-prod",
  "name": "http://tech_support-prod",
  "password": "8ba8850a-8ae4-4cb3fe",
  "tenant": "1a27bdbf-e6cc-4e33-85d"
}
```
  * role 할당 없이 SP만 생성
```bash
az ad sp create-for-rbac -n tech_support-prod --skip-assignment
```


## Role Assignment

### 예제
examplerg 리소스 그룹 수준에서 `Virtual Machine Contributor` Role 할당
```bash
az role assignment create --assignee 12345678 --role 'Virtual Machine Contributor' -g examplerg
```

subscription 아래의 특정한 리소스 수준에서 `Contributor` Role 할당
```bash
az role assignment create --assignee 12345678 --role 'Contributor' \
--scope /subscriptions/1234/resourceGroups/exampleRg/providers/Microsoft
.ContainerRegistry/registries/trcsplatform
```
