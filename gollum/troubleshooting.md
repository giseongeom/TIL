# ***anonymous*** 사용자 표시

## workaround
* ``jruby\lib\ruby\gems\shared\gems\gollum-lib-4.2.1-java\lib\gollum-lib\wiki.rb`` 파일 수정
```rb
     def default_committer_name
        @default_committer_name || 'GiSeong Eom'
     end

     def default_committer_email
         @default_committer_email || 'jurist@kldp.org'
     end
```

