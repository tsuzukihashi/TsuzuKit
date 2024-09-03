# TsuzuKit

オレオレ Swift ライブラリ

<img src="./Sources/TsuzuKit/Resources/Image/icon.jpeg" width=320>

### 部分角丸

- PartlyRoundedCornerView

Useage

```swift
  .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
```

### HapticFeedback

```swift
  HapticFeedback.notice(type: .success)
  HapticFeedback.impact(style: .medium)
  HapticFeedback.selection()
```

### Safe Access Collection

```swift
  import TsuzuKit

  ...
  let collection: [String] = ["1", "2"]
  print(collection[safe: 0]) // Optional("1")
```

### QRCodeGenerator

```swift
  import TsuzuKit
  
  Image(uiImage: QRCodeGenerator.generate(with: "https://tsuzukihashi.github.io/"))
```
