## 상황
* 터미널 서비스로 Windows 박스에 로그인해서 sublime text2를 사용하다가 ``Ctrl+Alt+Up/Down`` 단축키가 동작하지 않는다는 사실을 발견하고 좌절.

## 사용자 정의 단축키 설정
* ``%APPDATA%\Sublime Text 2\Packages\User\Default (Windows).sublime-keymap`` 파일을 다음과 같이 수정
```json
[
    { "keys": ["shift+alt+up"], "command": "select_lines", "args": {"forward": false} },
    { "keys": ["shift+alt+down"], "command": "select_lines", "args": {"forward": true} }
] 
```
* ``Shift+Alt+Up/Down`` 키로 재정의하니까 잘 동작함


## 참고자료

* [단축키 - Sublime Text 2](https://opentutorials.org/module/406/3604)