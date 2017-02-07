# VisualStudio Code - Tip

## feedback 버튼 감추기

* 다음의 파일 수정
`%ProgramFiles(x86)%\Microsoft VS Code\resources\app\out\vs\workbench\electron-browser\workbench.main.css`
* `dropdown.send-feedback{display:inline-block}` 검색
* **`dropdown.send-feedback{display:none}`** 으로 변경




## 참고자료

* [tweet feedback button - make it hideable](https://github.com/Microsoft/vscode/issues/7893)