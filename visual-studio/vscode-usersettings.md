## VS Code의 User Settings


* Windows 버전은 `ctrl+,` 실행하면 호출 가능
* 내가 사용하는 설정
```json
// Place your settings in this file to overwrite the default settings
{
    // Controls the font family.
    "editor.fontFamily": "D2Coding, 'Courier New', monospace",

    // Controls the font size.
    "editor.fontSize": 16,
    "editor.cursorStyle": "block",

    // Controls if the minimap is shown
    "editor.minimap.enabled": true,

    // When enabled, will open files in a new window instead of reusing an existing instance.
    "window.openFilesInNewWindow": "off",


    // Controls how folders are being reopened after a restart. Select 'none' to never reopen a folder, 'one' to reopen the last folder you worked on or 'all' to reopen all folders of your last session.
    "window.reopenFolders": "all",

    // Controls the window title based on the active editor. Variables are substituted based on the context:
    // ${activeEditorShort}: e.g. myFile.txt
    // ${activeEditorMedium}: e.g. myFolder/myFile.txt
    // ${activeEditorLong}: e.g. /Users/Development/myProject/myFolder/myFile.txt
    // ${rootName}: e.g. myProject
    // ${rootPath}: e.g. /Users/Development/myProject
    // ${appName}: e.g. VS Code
    // ${dirty}: a dirty indicator if the active editor is dirty
    // ${separator}: a conditional separator (" - ") that only shows when surrounded by variables with values
    "window.title": "${dirty}${activeEditorLong}${separator}${rootName}${separator}${appName}",

    // Run `terraform fmt` on save for .tf files.
    "terraform.formatOnSave": true,
  
    // Path to the `terraform` executable
    "terraform.path": "c:\\ProgramData\\chocolatey\\bin\\terraform.exe"
}
```

## 참고자료

* [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)