# 洛琪希・形狀練習

以 SwiftUI 內建幾何形狀和自訂 Shape，透過 ZStack 疊出《無職轉生》的洛琪希。藍髮、法師帽、披風和水晶法杖取自角色設定；畫面本身由程式繪製，沒有放入角色圖片。

## 作業內容

- 使用 Circle、Ellipse、Capsule、RoundedRectangle、UnevenRoundedRectangle 與 Path。
- 用 ZStack 排列頭髮、臉部、法袍、披風、法師帽和法杖；各主要部位都有程式註解。
- 背景延伸至全螢幕，色彩的 RGB 數值放在 Assets.xcassets 的 Color Set。
- 依畫面可用空間縮放插畫。

## 開啟專案

使用 Xcode 開啟 RoxyShapeStudy.xcodeproj，選擇 RoxyShapes scheme 與 iPhone 模擬器後執行。

如需重新產生 Xcode 專案檔，可在此資料夾執行 xcodegen generate。

## 參考資料

- [#206 參考 Apple 的 Build with Stacks and Shapes](https://medium.com/彼得潘的試煉-勇者的-100-道-swift-ios-app-謎題/206-參考-apple-的-build-with-stacks-and-shapes-用形狀創作自畫像-self-portrait-b4d4a8eef55e)：作業需求與形狀範例。
- [用形狀創作圖案 — 珍奶小攤](https://medium.com/@tumelodymelody/用形狀創作圖案-珍奶小攤-b48c1db25927)：優先參考的作品呈現方式。
- [#02 用形狀創作圖案 — 耀西](https://medium.com/台大-cs-x-ios-app-程式設計/02-用形狀創作圖案-807df61ddeaa)：參考圖拆解與圖層安排。
- [#2 用形狀創作圖案](https://medium.com/台大-cs-x-ios-app-程式設計/2-用形狀創作圖案-3f40956911ce)：幾何形狀組合的作品範例。
- [無職轉生動畫官方角色頁](https://mushokutensei.jp/character/?chara=17&series=3rd_02)：洛琪希的角色設定。
