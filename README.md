# 앱스토어 
- StoryBoard없이 SnapKit 으로 만든 앱스토어 스타일의 UI를 가진 앱입니다.

## 주요 기능 및 목표
- TabBar를 이용해서 각 화면을 구성합니다.
- CollectionView로 앱스토어와 같이 가능한 다양하게 UI를 구현합니다.
- UIActivityViewController를 이용해 앱에 대한 정보를 Email등으로 공유합니다.

## 사용기술
- CollectionView를 이용한 앱 리스트.
- 여러개의 CollectionView를 배치하기 위해 ScrollView를 사용.
- AutoLayout을 만들기 위해 SnapKit 라이브러리 사용.
- 앱 정보를 Email 및 다른 앱으로 공유하기 위한 UIActivityViewController 사용.

### 입력
- 앱스토어 앱 정보를 plist 파일로 만들어 사용.

### 출력
- plist의 정보들을 CollectionView에 출력.

## 아키텍처
- MVC
