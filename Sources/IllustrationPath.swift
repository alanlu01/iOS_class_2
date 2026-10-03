import SwiftUI

/// 將座標描成可縮放的 SwiftUI Shape。
/// M：起點；L：直線；Q：二次曲線；C：三次曲線；Z：閉合。
/// 所有部位共用 540 × 800 的畫布，ZStack 的先後順序就是圖層順序。
struct IllustrationPath: Shape {
    let instructions: String
    var canvas: CGSize = CGSize(width: 540, height: 800)

    func path(in rect: CGRect) -> Path {
        let tokens = instructions.split(whereSeparator: { $0.isWhitespace || $0 == "," })
        var cursor = 0
        var result = Path()

        func number() -> CGFloat {
            defer { cursor += 1 }
            return CGFloat(Double(tokens[cursor]) ?? 0)
        }

        func point() -> CGPoint {
            let x = number()
            let y = number()
            return CGPoint(x: x, y: y)
        }

        while cursor < tokens.count {
            let command = tokens[cursor]
            cursor += 1
            switch command {
            case "M": result.move(to: point())
            case "L": result.addLine(to: point())
            case "Q":
                let control = point()
                result.addQuadCurve(to: point(), control: control)
            case "C":
                let first = point()
                let second = point()
                result.addCurve(to: point(), control1: first, control2: second)
            case "Z": result.closeSubpath()
            default: break
            }
        }

        return result.applying(CGAffineTransform(
            scaleX: rect.width / canvas.width,
            y: rect.height / canvas.height
        ))
    }
}

/// 一塊上色的自訂形狀，使用細描邊保留動畫插畫的線條。
struct PaintedPath: View {
    let path: String
    let color: Color
    var lineWidth: CGFloat = 1.7
    var outline: Color = Color("RoxyInk")

    init(_ path: String, _ color: Color, lineWidth: CGFloat = 1.7,
         outline: Color = Color("RoxyInk")) {
        self.path = path
        self.color = color
        self.lineWidth = lineWidth
        self.outline = outline
    }

    var body: some View {
        IllustrationPath(instructions: path)
            .fill(color)
            .overlay {
                IllustrationPath(instructions: path)
                    .stroke(outline, style: StrokeStyle(
                        lineWidth: lineWidth, lineCap: .round, lineJoin: .round
                    ))
            }
    }
}

/// 不填色的曲線，用在髮絲、衣摺、睫毛和手指細節。
struct DrawnLine: View {
    let path: String
    var color: Color = Color("RoxyInk")
    var width: CGFloat = 1.3

    var body: some View {
        IllustrationPath(instructions: path)
            .stroke(color, style: StrokeStyle(
                lineWidth: width, lineCap: .round, lineJoin: .round
            ))
    }
}
