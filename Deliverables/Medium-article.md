# 02 用形狀創作圖案 洛琪希

這次的作業是利用 SwiftUI 的形狀與堆疊來創作圖案，我選擇《無職轉生》的洛琪希作為主題。她的藍紫色頭髮、長辮子、寬簷法師帽和棕色外袍都有很明顯的特徵，適合練習把角色拆成不同部位，再用程式組合起來。

構圖採用接近海報的方式：深藍色背景、淡淡的光圈，中央放上洛琪希和法杖，下方加上中英文名字。下面是完成的畫面。

![洛琪希 SwiftUI 形狀繪圖成果](roxy-v2.png)

*iPhone 17 Pro 模擬器中的實際畫面。人物、法杖和背景圖案皆由 SwiftUI 繪製。*

## 參考圖片與造型

開始製作前，先對照[動畫官方角色頁](https://mushokutensei.jp/character/?chara=17&series=3rd_02)與[角色設定圖的轉載](https://twitter.com/ftloic/status/1409500684899209223)，觀察她的髮色、帽子和衣服結構。

這次主要保留藍紫色雙辮子、半垂的藍眼睛、彎折的帽尖，以及白色滾邊和金色織帶。衣服則加入米棕色披肩、白色立領、胸前雙排扣、交叉束帶和腰部金色飾帶。這些細節加在一起，才比較能讓人認出是洛琪希。

參考圖片用來觀察造型，app 的人物輪廓與上色都由程式畫出。

## 用 ZStack 決定圖層順序

這次最重要的結構是 `ZStack`。先放背景、法杖和後髮，再放外袍與內搭，接著補上辮子、臉、瀏海與帽子，最後畫握住法杖的手。下面節錄人物的圖層排列：

```swift
struct RoxyIllustration: View {
    var body: some View {
        ZStack {
            RoxyBackdrop()
            RoxyStaff()
            RoxyBackHair()
            RoxyCoat()
            RoxyUniform()
            RoxySleeves()
            RoxyCollar()
            RoxyBraids()
            RoxyFace()
            RoxyFringe()
            RoxyHat()
            RoxyHands()
        }
        .frame(width: 540, height: 800)
    }
}
```

`ZStack` 裡越後面的視圖會蓋在越前面的視圖上。例如帽子放在瀏海後面，就能讓帽簷遮住頭髮上緣；手放在法杖後面，就能遮住部分木柄，呈現握住法杖的樣子。

把部位拆成不同的 View，也比較方便修改。調整帽子時可以專心處理帽冠和帽簷，修改眼睛時則不用在整個人物的程式碼裡找座標。

## 基本形狀與曲線

比較規則的細節使用 `Circle`、`Ellipse`、`Capsule`、`Rectangle` 和 `RoundedRectangle`。例如背景光圈是圓形，虹膜和高光使用橢圓，衣服上的鈕扣則是小圓形。

臉型、瀏海、披風和手指的輪廓比較不規則，因此另外使用自訂 `Shape` 與 `Path`。專案中的 `IllustrationPath` 會把座標指令轉成 SwiftUI 路徑：

| 指令 | 用途 |
| --- | --- |
| M | 移動到新的起點 |
| L | 畫直線 |
| Q | 畫二次貝茲曲線 |
| C | 畫三次貝茲曲線 |
| Z | 閉合輪廓 |

例如法杖水晶的外形，就是把幾個角連接起來。以下是專案中的程式片段：

```swift
PaintedPath(
    "M 96 172 L 118 208 L 111 247 L 94 262 L 75 244 L 75 205 Z",
    Color("RoxyCrystal"),
    lineWidth: 1.8,
    outline: Color("RoxyCrystalLight")
)
```

`PaintedPath` 會替輪廓填色，再疊上一層描邊。水晶裡面另外放上較亮和較暗的形狀，形成不同切面，外圍則加上淡淡的光暈。

## 眼睛與辮子的細節

第一版的眼睛只有簡單的橢圓和圓形，人物看起來比較呆，也不太像動畫裡的洛琪希。新版把眼白、虹膜、瞳孔、睫毛和高光分開處理。

虹膜上方使用較深的藍色，下方逐漸變亮，再加上細長的瞳孔和白色反光。下面節錄虹膜的底色：

```swift
Ellipse()
    .fill(LinearGradient(
        colors: [
            Color("RoxyEyeDeep"),
            Color("RoxyEye"),
            Color("RoxyCrystal")
        ],
        startPoint: .top,
        endPoint: .bottom
    ))
    .frame(width: 27, height: 33)
    .overlay(
        Ellipse().stroke(Color("RoxyEyeDeep"), lineWidth: 1.2)
    )
```

眼睛的外形也使用曲線，而不是直接放兩顆圓形。虹膜會依照眼白輪廓遮罩裁切，上眼線則畫得比較厚，讓眼皮呈現稍微半垂的表情。

辮子是另一個需要修改的地方。第一版把圓形堆成一串，雖然看得出有辮子，卻缺少編髮的交錯感。新版改成兩塊葉片形的髮束，一深一淺交疊，再用 `ForEach` 重複排列，每一節逐漸變窄，最後補上深藍色髮帶和散開的髮尾。

## 在 Assets 設定 RGB 顏色

為了方便統一調整配色，這次在 `Assets.xcassets` 建立 Color Set，再透過名稱取用。下面是幾個主要顏色：

| 部位 | Color Set | RGB |
| --- | --- | --- |
| 頭髮 | RoxyHair | 105, 118, 181 |
| 法師帽 | RoxyHat | 48, 50, 56 |
| 外袍 | RoxyCloak | 182, 149, 104 |
| 膚色 | RoxySkin | 250, 227, 213 |
| 金色飾帶 | RoxyAccent | 199, 162, 94 |

例如頭髮使用 `Color("RoxyHair")`。如果覺得髮色不夠接近參考圖，就可以在 Assets 修改 RGB 數值，使用這個顏色的部位會一起更新。

背景則使用兩個色彩資產做漸層，並加上 `.ignoresSafeArea()`，讓背景延伸到整個螢幕。

```swift
LinearGradient(
    colors: [Color("RoxyStage"), Color("RoxyHalo")],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)
.ignoresSafeArea()
```

## 製作過程與心得

這次使用 Codex 協助撰寫程式碼，先做出第一版，再對照參考圖與模擬器畫面修改。第一版雖然有帽子、藍髮和披風，但髮色偏綠、臉型太長，服裝也省略了太多細節，所以看起來更像一般的法師。

重畫時先修正髮色和五官比例，再補上雙辮子、帽帶、立領與胸前扣子。這次比較明顯的體會是：選對顏色還不夠，形狀的比例和重疊順序也會影響角色的辨識度。像是帽簷遮住頭髮多少、瀏海落在哪裡，以及眼皮的曲線，只要稍微改動，表情就會不一樣。

目前完成的是一張靜態人物圖。透過這次練習，可以看到基本幾何形狀、曲線、描邊和漸層如何組合成更完整的畫面，也練習了用不同 View 管理人物部位的方法。

## 完整程式碼與參考資料

完整 Xcode 專案：[alanlu01/iOS_class_2](https://github.com/alanlu01/iOS_class_2)

- [作業題目 Build with Stacks and Shapes](https://medium.com/彼得潘的試煉-勇者的-100-道-swift-ios-app-謎題/206-參考-apple-的-build-with-stacks-and-shapes-用形狀創作自畫像-self-portrait-b4d4a8eef55e)
- [用形狀創作圖案 珍奶小攤](https://medium.com/@tumelodymelody/用形狀創作圖案-珍奶小攤-b48c1db25927)
- [用形狀創作圖案 耀西](https://medium.com/台大-cs-x-ios-app-程式設計/02-用形狀創作圖案-807df61ddeaa)
- [用形狀創作圖案 木木梟](https://medium.com/台大-cs-x-ios-app-程式設計/2-用形狀創作圖案-3f40956911ce)
