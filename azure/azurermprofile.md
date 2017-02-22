# Azure RM (Resource Manager) Profile 설정
* Powershell 5.1 에서 테스트
* AzureRM Powershell module 설치되어 있다고 가정

## interactive Login

### Login-AzureRmAccount

* 웹 브라우져 이용해서 interactive login

### `*-AzureRmSubscription` cmdlet

* Get-AzureRmSubscription
```PowerShell
PS> Get-AzureRmSubscription

SubscriptionName : Visual Studio Professional
SubscriptionId   : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
TenantId         : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
State            : Enabled

SubscriptionName : AzureLAB-01-Subscription-20160603
SubscriptionId   : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
TenantId         : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
State            : Enabled

SubscriptionName : Azure Pass
SubscriptionId   : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
TenantId         : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
State            : Enabled

SubscriptionName : Microsoft Azure Sponsorship 2
SubscriptionId   : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
TenantId         : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
State            : Enabled
```

* Select-AzureRmSubscription cmdlet으로 Subscription 지정
```PowerShell
Select-AzureRmSubscription -SubscriptionId 12345678-9101-43ee-AAAA-BBBBBBBBBBBB

Environment           : AzureCloud
Account               : giseong.eom@bluehole.net
SubscriptionId        : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
TenantId              : 12345678-9101-43ee-AAAA-BBBBBBBBBBBB
SubscriptionName      : Microsoft Azure Sponsorship 2
CurrentStorageAccount :
```


## 참고자료

* [Persisting Azure PowerShell logins](https://blogs.msdn.microsoft.com/stuartleeks/2015/12/11/persisting-azure-powershell-logins/)
* [Select-AzureRmProfile](https://docs.microsoft.com/en-us/powershell/resourcemanager/azurerm.profile/v2.4.0/select-azurermprofile)