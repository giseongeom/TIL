# AWS CLI example #

## ec2  ##

### describe-images ###

* custom AMI의 `ImageID`, `CreationDate` 정보를 출력, sort 명령으로 `CreationDate` 기준 정렬
```
$ aws ec2 describe-images
  --query 'Images[].[ImageId,CreationDate]'  
  --owners self --output text | sort -k 2

ami-3d263b53    2016-04-14T02:10:01.000Z
ami-8b5648e5    2016-04-21T06:58:02.000Z
ami-4d514f23    2016-04-21T10:06:55.000Z
ami-9c4957f2    2016-04-21T12:49:06.000Z
ami-eb283685    2016-04-22T10:15:32.000Z
ami-bfd039de    2016-06-08T04:00:49.000Z
```
* customAMI의 Tags 정보도 포함해서 출력 `Tags[?Key=='OS_Version'].Value | [0]` 구문에 유의
```
$ aws ec2 describe-images 
  --query "Images[].[ImageId,CreationDate,Tags[?Key=='OS_Version'].Value | [0], Tags[?Key=='Env'].Value | [0] ]" 
  --owners self --output text

ami-3d263b53    2016-04-14T02:10:01.000Z        WS2012R2-Core 2016.03.09        prod
ami-4d514f23    2016-04-21T10:06:55.000Z        WS2012R2-Core 2016.03.09        prod
ami-8b5648e5    2016-04-21T06:58:02.000Z        WS2012R2-Core 2016.03.09        prod
ami-9c4957f2    2016-04-21T12:49:06.000Z        WS2012R2-Core 2016.03.09        prod
ami-bfd039de    2016-06-08T04:00:49.000Z        2012R2-Core 2016.05.11  prod
ami-eb283685    2016-04-22T10:15:32.000Z        WS2012R2-Core 2016.03.09        prod
```
* `sort_by` function 이용해서 creationDate 기준 정렬
```bash
$ aws ec2 describe-images 
  --query "sort_by(Images, &CreationDate)[*].[ImageId,CreationDate]"
  --owners self --output text

ami-3d263b53    2016-04-14T02:10:01.000Z
ami-8b5648e5    2016-04-21T06:58:02.000Z
ami-4d514f23    2016-04-21T10:06:55.000Z
ami-9c4957f2    2016-04-21T12:49:06.000Z
ami-eb283685    2016-04-22T10:15:32.000Z
ami-bfd039de    2016-06-08T04:00:49.000Z
```
  - `reverse` fucntion 이용해서 내림차순 정렬
```
$ aws ec2 describe-images 
    --query "reverse(sort_by(Images, &CreationDate)[*].[ImageId,CreationDate])"
    --owners self --output text

ami-bfd039de    2016-06-08T04:00:49.000Z
ami-eb283685    2016-04-22T10:15:32.000Z
ami-9c4957f2    2016-04-21T12:49:06.000Z
ami-4d514f23    2016-04-21T10:06:55.000Z
ami-8b5648e5    2016-04-21T06:58:02.000Z
ami-3d263b53    2016-04-14T02:10:01.000Z
```

## 참고자료 ##

* [Controlling Command Output from the AWS Command Line Interface](http://docs.aws.amazon.com/cli/latest/userguide/controlling-output.html)
* [Advanced AWS CLI JMESPath Query Tricks](http://opensourceconnections.com/blog/2015/07/27/advanced-aws-cli-jmespath-query)
* [JMESPath Specification - Sort_by](http://jmespath.org/specification.html#sort-by)
* [Sorting contents of S3 bucket via AWS CLI since AWS console doesn't allow sort today](http://cloudofnines.blogspot.kr/2015/03/sorting-contents-of-s3-bucket-via-aws.html)