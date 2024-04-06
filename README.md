# TsuzuKit
オレオレSwiftUIライブラリ

<img src="https://1.bp.blogspot.com/-PYOsJAMddQI/WdyDTQ-OjQI/AAAAAAABHbU/wg8mS8AFANYaZOKreTrdJhPPUochYCkDQCLcBGAs/s800/character_program_shutdown.png" width=320>

### 部分角丸 
- PartlyRoundedCornerView

Useage 
```.swift
  .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
```
### HapticFeedback

```.swift
  HapticFeedback.notice(type: .success)
  HapticFeedback.impact(style: .medium)
  HapticFeedback.selection()
```
