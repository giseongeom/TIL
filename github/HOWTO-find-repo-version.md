## Github 저장소의 Release 버전 정보를 추출하기

### ``latest`` TAG가 있는 경우
* ``hashicorp/terraform`` 저장소를 예제로 사용
* api.github.com에 다음과 같이 **latest** TAG 에 대해서 질의하면 정보를 받을 수 있다. (현재 0.7.12가 최신버전임)
```
$ curl https://api.github.com/repos/hashicorp/terraform/releases/latest
{
  "url": "https://api.github.com/repos/hashicorp/terraform/releases/4734647",
  "assets_url": "https://api.github.com/repos/hashicorp/terraform/releases/4734647/assets",
  "upload_url": "https://uploads.github.com/repos/hashicorp/terraform/releases/4734647/assets{?name,label}",
  "html_url": "https://github.com/hashicorp/terraform/releases/tag/v0.7.12",
  "id": 4734647,
  "tag_name": "v0.7.12",
  "target_commitish": "master",
  "name": "",
  "draft": false,
  "author": {
    "login": "catsby",
    "id": 61721,
    "avatar_url": "https://avatars.githubusercontent.com/u/61721?v=3",
    "gravatar_id": "",
    "url": "https://api.github.com/users/catsby",
    "html_url": "https://github.com/catsby",
    "followers_url": "https://api.github.com/users/catsby/followers",
    "following_url": "https://api.github.com/users/catsby/following{/other_user}",
    "gists_url": "https://api.github.com/users/catsby/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/catsby/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/catsby/subscriptions",
    "organizations_url": "https://api.github.com/users/catsby/orgs",
    "repos_url": "https://api.github.com/users/catsby/repos",
    "events_url": "https://api.github.com/users/catsby/events{/privacy}",
    "received_events_url": "https://api.github.com/users/catsby/received_events",
    "type": "User",
    "site_admin": false
  },
  "prerelease": false,
  "created_at": "2016-11-22T20:16:59Z",
  "published_at": "2016-11-22T21:02:38Z",
  "assets": [

  ],
  "tarball_url": "https://api.github.com/repos/hashicorp/terraform/tarball/v0.7.12",
  "zipball_url": "https://api.github.com/repos/hashicorp/terraform/zipball/v0.7.12",
  "body": "`v0.7.12`"
}
```
* jq 명령과 적당히 조합하면 원하는 버전 정보를 쉽게 추출할 수 있다.
```
$ curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | jq --raw-output ".tag_name" | tr -d v
0.7.12
```

### ``latest`` Tag가 없는 경우
* 개발자 취향에 따라 latest Tag를 안쓰는 저장소도 있다.
* ``mitchellh/vagrant`` 저장소를 예제로 사용한다.
* 일단 Tag 정보를 나열해보자.
```
curl https://api.github.com/repos/mitchellh/vagrant/tags

[                                                                                                                  
  {                                                                                                                
    "name": "v1.8.7",                                                                                              
    "zipball_url": "https://api.github.com/repos/mitchellh/vagrant/zipball/v1.8.7",                                
    "tarball_url": "https://api.github.com/repos/mitchellh/vagrant/tarball/v1.8.7",                                
    "commit": {                                                                                                    
      "sha": "2b4f743547de7f2fe4fb161dd2b7ceec65da422b",                                                           
      "url": "https://api.github.com/repos/mitchellh/vagrant/commits/2b4f743547de7f2fe4fb161dd2b7ceec65da422b"     
    }                                                                                                              
  },                                                                                                               
  {                                                                                                                
    "name": "v1.8.6",                                                                                              
    "zipball_url": "https://api.github.com/repos/mitchellh/vagrant/zipball/v1.8.6",                                
    "tarball_url": "https://api.github.com/repos/mitchellh/vagrant/tarball/v1.8.6",                                
    "commit": {                                                                                                    
      "sha": "70d3c1fa2c933e88c27c4777709e479fc87842d5",                                                           
      "url": "https://api.github.com/repos/mitchellh/vagrant/commits/70d3c1fa2c933e88c27c4777709e479fc87842d5"     
    }                                                                                                              
  },                                                                                                               
  {                                                                                                                
    "name": "v1.8.5",                                                                                              
    "zipball_url": "https://api.github.com/repos/mitchellh/vagrant/zipball/v1.8.5",                                
    "tarball_url": "https://api.github.com/repos/mitchellh/vagrant/tarball/v1.8.5",                                
    "commit": {                                                                                                    
      "sha": "93f9528687b9a737585d22bc4db5d2ab5d9852d3",                                                           
      "url": "https://api.github.com/repos/mitchellh/vagrant/commits/93f9528687b9a737585d22bc4db5d2ab5d9852d3"     
    }                                                                                                              
  },                                                                                                               
  {                                                                                                                
    "name": "v1.8.4",                                                                                              
.... 생략 ....
```
* 버전 Tag가 순서대로 출력되는 것이 힌트.
* 첫번째 record를 추출하면 최신 버전 정보를 가져올 수 있다.
```
$ curl -s https://api.github.com/repos/mitchellh/vagrant/tags | jq --raw-output ".[0].name" | tr -d v
1.8.7
```
