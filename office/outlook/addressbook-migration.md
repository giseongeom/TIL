
# 주소록(Addressbook) Migration

## Outlook 주소록 --> icloud 주소록으로 이전

* vCard (.vcf) 이용
* Outlook 에서 적당히 정보를 수정한 다음 `Save as` 이용해서 .vcf 파일로 저장
* 이후의 작업은 notepad 이용한다고 가정
  * .vcf 파일에서 VERSION 필드의 내용을 3.0 으로 지정한다.
  * UTF-8 형식으로 .vcf 파일을 저장한다.
  * icloud 에 import 한 다음에 메모쪽 내용을 한 번 더 수정해 준다.

* .vcf 샘플
```
BEGIN:VCARD
VERSION:3.0
N;LANGUAGE=en-us;CHARSET=ks_c_5601-1987:김철수
FN;CHARSET=ks_c_5601-1987:김철수
ORG;CHARSET=ks_c_5601-1987:Bluehole Studio;운영팀
TITLE;CHARSET=ks_c_5601-1987:팀원
TEL;WORK;VOICE:070-4688-1234
TEL;HOME;VOICE: 
TEL;CELL;VOICE:010-2601-1234
TEL;PAGER;VOICE: 
ADR;WORK;CHARSET=ks_c_5601-1987:;Y동
X-MS-OL-DEFAULT-POSTAL-ADDRESS:0
EMAIL;PREF;INTERNET:cjbaek@bluehole.net
PHOTO;TYPE=JPEG;ENCODING=BASE64:
... 이하 생략 ...
```


## 참고자료

* [How to fix VCF/vCards importing errors in iCloud](http://www.electronmedia.in/wp/fix-vcfvcards-importing-errors-icloud/)