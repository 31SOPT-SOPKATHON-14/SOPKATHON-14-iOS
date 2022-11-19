# SOPKATHON-iOS

![image 10@3x](https://user-images.githubusercontent.com/65678579/202875746-d0bfe0ba-2c08-4dfc-8159-b073e4e8c4ed.png)
![Slide 16_9 - 19@3x](https://user-images.githubusercontent.com/65678579/202875781-3a7f6f6d-2a3d-400d-bfc1-b1dac73711c6.png)
![Slide 16_9 - 13@3x](https://user-images.githubusercontent.com/65678579/202875784-a4484710-170b-4576-98cb-a7e0b24c9e83.png)

<br>

### ✨ 서비스 이름과 소개 

| 서비스명   | 서비스 소개
| -------- | :-----: | 
| 캐미 (Campus-mission: Cammi) | 지루하고 반복되는 학교생활, 특별한 미션들과 함께 변화를 만들어보세요. |


</br>

### 🔫 개발 담당 부분

|  담당 뷰  |  담당자  | 구현 기능 | 구현 기능 설명 |
| ---- | :---------: | ----- | -------------- |
| 상세 페이지 뷰 | `강윤서` | 프로젝트 세팅, 상세 페이지 뷰, 네트워크 세팅 및 연결 | 미션에 대한 상세 정보를 보여줌 |
| 마이 페이지 뷰 | `장석우` | 마이페이지 뷰, 네트워크 연결 | 사용자가 완료한 미션들과 이를 기반으로 한  사용자 등급을 보여줌 |
| 랭킹 뷰  | `배성호` | 랭킹 뷰, 네트워크 연결 | 사용자 등급과 사용자 친구들의 랭킹을 보여줌 |
| 초기화면 뷰, 선물상자 뷰 | `최효원` | 초기화면 뷰, 네트워크 연결 | 초기 앱 실행 시, 사용자의 학교 선택과 미션  화면 보여줌 |

</br>

### 🪧 Library

라이브러리 | 사용 목적 | Version | Management Tool
:---------:|:----------:|:---------: |:---------:
 SnapKit | UI Layout | 5.6.0 | SPM
 Then | UI 선언 | 3.0.0 | SPM
 Moya | 서버 통신 | 15.0.3 | SPM
 
 
 <br>

## 🎈 Convention
<details>
 <summary> ✨ Git Branch Convention </summary>
 <div markdown="1">       

 ---
 
 - **Branch Naming Rule**
    - Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch 이름 결정
    - `feature/<#IssueNumber>`
- **Commit Message Rule**
    - `[Prefix] #이슈번호 - <Description>`
   
 <br>

 </div>
 </details>

 <details>
 <summary> ✨ Git Flow </summary>
 <div markdown="1">       

 ---
 
 ```
1. 작업 단위별 Issue 생성

2. develop 브랜치에서 작업 브랜치 생성
  > 예시) feature/#3

3. Branch 생성 : git switch -c Prefix/#IssueNumber-description 
   > 예시) chore/#3-Project-Setting

4. 로컬 환경에서 작업 후 Add -> Commit -> Push -> Pull Request의 과정을 거친다.
   
   Prefix의 의미
   > [Feat] : 새로운 기능 구현
   > [Chore] : 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경 등
   > [Add] : 코드 변경 없는 단순 파일 추가, 에셋 및 라이브러리 추가
   > [Fix] : 버그, 오류 해결, 코드 수정
   > [Docs] : README나 WIKI 등의 문서 개정
   > [Refactor] : 전면 수정
   > [Setting] : 프로젝트 세팅


5. Pull Request 작성 

6. develop Branch로 merge하기
```
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Naming & Code Convention </summary>
 <div markdown="1">       

 ---
 
- 클래스/구조체 이름은 UpperCamelCase를 사용합니다.
- 함수와 변수에는 lowerCamelCase를 사용합니다.
- 파일, 메서드, 클래스 명 약어 사용 지양한다.
    - 예시) ViewController → `VC (❌)`
    - 예시) CollectionViewCell → `CVC (❌)`
    - 예시) loginButtonDidTap: UIButton  -> `loginBtnTapped (❌)`
- 이외 기본 명명규칙은 [Swift Style Guide](https://google.github.io/swift/), [API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) , [Swift Style Guide](https://github.com/StyleShare/swift-style-guide)를 참고한다.
   
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Project Foldering </summary>
 <div markdown="1">       

 ---
 ```
.
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Network
│   ├── API
│   ├── Base
│   │   ├── Encodable+.swift
│   │   ├── Enviroment.swift
│   │   ├── GeneralResponse.swift
│   │   ├── NetworkConstant.swift
│   │   ├── NetworkResult.swift
│   │   └── URLConstant.swift
│   ├── DataModel
│   │   └── ScreenModel
│   ├── Plugin
│   │   └── NetworkLoggerPlugin.swift
│   └── Service
├── Presentation
│   └── Scene
│       ├── Cells
│       └── ViewController
├── Resource
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── Color.xcassets
│   ├── Font
│   ├── Image.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   └── Info.plist
└── Utils
    ├── Constant
    └── Extension
```

</details>


 <br>

## 🎨 UI Sketch

<details>
<summary>접기/펼치기</summary>

https://sulfuric-alphabet-33a.notion.site/iOS-1-d5a179be349642798efa425aaca8ead5


</details>



<br>
 
## 📸 우리 사진><

<details>
<summary>접기/펼치기</summary>

<!-- summary 아래 한칸 공백 두어야함 -->

<img src="https://user-images.githubusercontent.com/65678579/202865584-7ac59c5a-0b95-4ecf-8673-40f30faf824f.png">

</details>



<br>

## 😂 개발 시 어려웠던 점 

<details>
<summary>윤서☃️</summary>
<div markdown="1">       

- 어려웠던 점 : 버튼에 addTarget이 되지 않았다.
 
- 해결 방법 : 버튼의 superview의 너비를 정해주지 않아서 하위뷰인 버튼의 영역도 잡히지 않아서였다. . 

</div>
</details>

<details>
<summary>효원🐰</summary>
<div markdown="1">       

- 어려웠던 점 : viewType을 나눠서 미션을 성공했을 때의 화면과 달성했을 때의 Home 화면을 다르게 구성해줘야 했다...     
             열심히 type 나눠서 해보았지만 적용이 되지 않았따...
- 해결 방법 : 그냥.... View 2개 만들어서 present 해줬따..
  

</div>
</details>

<details>
<summary>석우🙈</summary>
<div markdown="1">       

- 어려웠던 점 : tableView와 CollectionView가 유사하면서도 달라 혼란스러웠다.
 
- 해결 방법 : 애플 공식문서를 정독하며 두 메소드 간의 차이점을 분석하여 사용하였다.

</div>
</details>

<details>
<summary>성호🦥</summary>
<div markdown="1">       

- 어려웠던 점 : 똑같이 생긴 뷰를 구현하더라도, 어떤식으로 만들지에 대해 우선적으로 협의하지 않아 구현 방식이 서로 달랐다. 
나중에 develop에 push하여 헤더뷰를 합치는 과정에서, AutoLayout을 잡는 것이 번거로웠다. 

- 해결 방법 : 다른 화면을 구현할 시에는 어떠한 UIView를 사용할 지를 미리 정해 충돌을 방지했다. 

</div>
</details>


<br>

## 🎥 시연영상

![Simulator Screen Recording - iPhone 14 Pro - 2022-11-20 at 08 13 16](https://user-images.githubusercontent.com/81157265/202875227-1bbde269-5f4d-4729-baaf-8c7afdc2724f.gif)



