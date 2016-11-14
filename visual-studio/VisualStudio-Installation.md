## Visual Studio Enterprise 2015 (무인)설치방법을 정리


## 준비
* Visual Studio Enterprise 2015 설치 .iso 파일 (``vs_<product>_<GUID>.exe`` 웹 인스톨러 파일은 안됨)

## adminFile 생성
* D: 드라이브로 Visual Studio Enterprise 2015 .ISO 파일 마운트
* ``/CreateAdminFile`` 옵션을 이용해서 무인설치 내용을 담고 있는 .xml 파일을 생성
``d:\vs_enterprise.exe /CreateAdminFile c:\temp\example.xml``

## adminFile 수정
* 생성된 example.xml 파일에서 다음과 같이 수정해 본다. 
* ``Visual C++, F#`` 을 기본 설치항목에 추가.
  * 배경: Visual Studio 2015 부터 C++이 기본 설치 항목에서 누락되었다. 자세한 내용은 [Visual C++ Team Blog 포스팅](https://blogs.msdn.microsoft.com/vcblog/2015/07/24/setup-changes-in-visual-studio-2015-affecting-c-developers/) 참고
  * 다음과 같이 **NativeLanguageSupport** 로 시작하는 항목 3개와 **FSharpV1**의 Selected 값을 **yes**로 수정
```xml
    <SelectableItemCustomization Id="FSharpV1" Hidden="no" Selected="yes" FriendlyName="Visual F#" />
    <SelectableItemCustomization Id="NativeLanguageSupport_VCV1" Hidden="no" Selected="yes" FriendlyName="Common Tools for Visual C++ 2015" />
    <SelectableItemCustomization Id="NativeLanguageSupport_MFCV1" Hidden="no" Selected="yes" FriendlyName="Microsoft Foundation Classes for C++" />
    <SelectableItemCustomization Id="NativeLanguageSupport_XPV1" Hidden="no" Selected="yes" FriendlyName="Windows XP Support for C++" />   
```
  * 그냥 값만 수정하면 설치가 안될 것이다. 해당 라인들을 다음과 같이 가장 아래쪽으로 위치 변경한다.
```xml
    <SelectableItemCustomization Id="Win10SDK_VisibleV1" Hidden="no" Selected="no" FriendlyName="Windows 10 SDK 10.0.10240" />
    <SelectableItemCustomization Id="UWPPatch_KB3073097_HiddenV3" Selected="no" FriendlyName="KB3073097" />
    <SelectableItemCustomization Id="AppInsightsToolsVSWinExpressHiddenVSU3RTMV1" Selected="no" FriendlyName="Developer Analytics Tools v7.0.2" />
    <SelectableItemCustomization Id="AppInsightsToolsVWDExpressHiddenVSU3RTMV1" Selected="no" FriendlyName="Developer Analytics Tools v7.0.2" />
    <SelectableItemCustomization Id="UWPStartPageV1" Selected="no" FriendlyName="Tools for Universal Windows Apps Getting Started Experience" />
    <SelectableItemCustomization Id="FSharpV1" Hidden="no" Selected="yes" FriendlyName="Visual F#" />
    <SelectableItemCustomization Id="NativeLanguageSupport_VCV1" Hidden="no" Selected="yes" FriendlyName="Common Tools for Visual C++ 2015" />
    <SelectableItemCustomization Id="NativeLanguageSupport_MFCV1" Hidden="no" Selected="yes" FriendlyName="Microsoft Foundation Classes for C++" />
    <SelectableItemCustomization Id="NativeLanguageSupport_XPV1" Hidden="no" Selected="yes" FriendlyName="Windows XP Support for C++" />   
  </SelectableItemCustomizations>
</AdminDeploymentCustomizations>
```
  * 관련되어 [MSDN 도움말](https://msdn.microsoft.com/en-us/library/ee225237.aspx#Anchor_1) 인용
```
Sometimes, items listed as selected in the AdminDeployment.xml file do not get installed. 
To resolve this issue, place the items marked “Selected="yes"” at the end of the AdminDeployment.xml file.

If you don’t want to install the optional dependencies of an item, then you must select the
parent first and then deselect the optional dependencies after the parent.Another way to do
 this is to simply omit the optional children of a parent—in other words, do not include 
any “Selected=”no”” items—but you still must place all the “Selected=”yes”” items at the 
end of the AdminDeployment.xml file.
```


## 무인설치
* ``/passive`` 옵션을 붙이면 진행상황을 구경(?)할 수 있다.
```
D:\vs_enterprise.exe /adminFile c:\temp\example.xml /passive
```
* 설치가 끝나면, cl.exe를 실행해서 잘 설치되었는지 검증한다.
```

C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC>cl
Microsoft (R) C/C++ Optimizing Compiler Version 19.00.24215.1 for x86
Copyright (C) Microsoft Corporation.  All rights reserved.

usage: cl [ option... ] filename... [ /link linkoption... ]

C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC>
```



## 참고자료

* [How to: Create and Run an Unattended Installation of Visual Studio](https://msdn.microsoft.com/en-us/library/ee225237.aspx)
* [Visual Studio Administrator Guide](https://msdn.microsoft.com/en-us/library/ee225238.aspx)
* [Using Command-Line Parameters to Install Visual Studio](https://msdn.microsoft.com/en-us/library/mt720584.aspx)
* [vs2015 adminFile 예제 - /createAdminfile 옵션으로 생성된 파일](https://github.com/giseongeom/TIL/blob/master/visual-studio/vs2015_install.xml)
* [vs2015 adminFile 예제 - VC++, F# 설치항목 추가된 파일](https://github.com/giseongeom/TIL/blob/master/visual-studio/example-vs2015_install_20161114.xml)