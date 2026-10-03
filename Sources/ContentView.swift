import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("RoxyStage")
                .ignoresSafeArea()

            GeometryReader { geometry in
                let availableHeight = max(geometry.size.height - 154, 340)
                let widthScale = (geometry.size.width - 36) / 360
                let heightScale = availableHeight / 560
                let portraitScale = min(min(widthScale, heightScale), 1.04)

                VStack(spacing: 0) {
                    header
                        .padding(.top, 9)

                    Spacer(minLength: 4)

                    RoxyPortrait()
                        .scaleEffect(portraitScale)
                        .frame(width: 360 * portraitScale, height: 560 * portraitScale)

                    Spacer(minLength: 4)

                    footer
                        .padding(.bottom, 4)
                }
                .padding(.horizontal, 22)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("SHAPES  /  02")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .tracking(2.8)
                    .foregroundStyle(Color("RoxyCrystal"))

                Text("洛琪希・米格路迪亞")
                    .font(.system(size: 25, weight: .semibold, design: .serif))
                    .foregroundStyle(Color("RoxyPaper"))
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
            }

            Spacer(minLength: 0)

            VStack(spacing: 3) {
                Image(systemName: "drop.fill")
                    .font(.system(size: 14, weight: .semibold))
                Text("WATER")
                    .font(.system(size: 8, weight: .bold, design: .monospaced))
                    .tracking(1.2)
            }
            .foregroundStyle(Color("RoxyCrystal"))
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .background(Color("RoxyHalo").opacity(0.65), in: Capsule())
            .overlay(Capsule().stroke(Color("RoxyCrystal").opacity(0.35), lineWidth: 1))
        }
    }

    private var footer: some View {
        HStack(spacing: 8) {
            Image(systemName: "sparkles")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color("RoxyAccent"))

            Text("以 ZStack 與幾何形狀層疊繪製")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .tracking(0.5)
                .foregroundStyle(Color("RoxyPaper").opacity(0.76))

            Spacer()

            Text("水聖級魔術師")
                .font(.system(size: 10, weight: .medium, design: .serif))
                .foregroundStyle(Color("RoxyCrystal"))
        }
        .padding(.top, 12)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color("RoxyCrystal").opacity(0.2))
                .frame(height: 1)
        }
    }
}

private struct RoxyPortrait: View {
    var body: some View {
        ZStack {
            // 背景光圈
            Circle()
                .fill(Color("RoxyHalo").opacity(0.58))
                .frame(width: 300, height: 300)
                .offset(y: -4)

            Circle()
                .stroke(Color("RoxyCrystal").opacity(0.21), lineWidth: 1)
                .frame(width: 326, height: 326)
                .offset(y: -4)

            Circle()
                .stroke(Color("RoxyCrystal").opacity(0.11), lineWidth: 1)
                .frame(width: 350, height: 350)
                .offset(y: -4)

            // 法杖：水晶、金屬環與木柄
            Capsule()
                .fill(Color("RoxyCloakShade"))
                .frame(width: 13, height: 390)
                .rotationEffect(.degrees(-4))
                .offset(x: -151, y: 27)

            Capsule()
                .fill(Color("RoxyAccent"))
                .frame(width: 18, height: 8)
                .rotationEffect(.degrees(-4))
                .offset(x: -151, y: -146)

            Capsule()
                .fill(Color("RoxyAccent"))
                .frame(width: 18, height: 8)
                .rotationEffect(.degrees(-4))
                .offset(x: -151, y: -128)

            CrystalShape()
                .fill(Color("RoxyCrystal"))
                .frame(width: 39, height: 57)
                .overlay(CrystalShape().stroke(Color("RoxyPaper").opacity(0.75), lineWidth: 1.2))
                .shadow(color: Color("RoxyCrystal").opacity(0.6), radius: 12)
                .offset(x: -151, y: -188)

            CrystalShape()
                .fill(Color("RoxyPaper").opacity(0.6))
                .frame(width: 12, height: 35)
                .offset(x: -158, y: -191)

            // 披風與白色法袍
            CloakShape()
                .fill(Color("RoxyCloak"))
                .frame(width: 294, height: 300)
                .overlay(CloakShape().stroke(Color("RoxyInk").opacity(0.7), lineWidth: 3))
                .shadow(color: .black.opacity(0.22), radius: 10, y: 8)
                .offset(y: 126)

            UnevenRoundedRectangle(
                cornerRadii: RectangleCornerRadii(
                    topLeading: 43,
                    bottomLeading: 20,
                    bottomTrailing: 20,
                    topTrailing: 43
                )
            )
            .fill(Color("RoxyPaper"))
            .frame(width: 155, height: 242)
            .overlay {
                UnevenRoundedRectangle(
                    cornerRadii: RectangleCornerRadii(
                        topLeading: 43,
                        bottomLeading: 20,
                        bottomTrailing: 20,
                        topTrailing: 43
                    )
                )
                .stroke(Color("RoxyInk").opacity(0.65), lineWidth: 2.5)
            }
            .offset(y: 139)

            Capsule()
                .fill(Color("RoxySkin"))
                .frame(width: 53, height: 61)
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 2))
                .offset(y: 8)

            // 袖口與衣襟細節
            Capsule()
                .fill(Color("RoxyPaper"))
                .frame(width: 90, height: 34)
                .rotationEffect(.degrees(-29))
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.65), lineWidth: 2))
                .offset(x: -95, y: 80)

            Capsule()
                .fill(Color("RoxyPaper"))
                .frame(width: 90, height: 34)
                .rotationEffect(.degrees(29))
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.65), lineWidth: 2))
                .offset(x: 95, y: 80)

            RoundedRectangle(cornerRadius: 6)
                .fill(Color("RoxyHat"))
                .frame(width: 49, height: 14)
                .rotationEffect(.degrees(-29))
                .offset(x: -129, y: 116)

            RoundedRectangle(cornerRadius: 6)
                .fill(Color("RoxyHat"))
                .frame(width: 49, height: 14)
                .rotationEffect(.degrees(29))
                .offset(x: 129, y: 116)

            LapelShape(isLeft: true)
            .fill(Color("RoxyCloakShade"))
            .frame(width: 70, height: 86)
            .overlay {
                LapelShape(isLeft: true)
                    .stroke(Color("RoxyAccent"), style: StrokeStyle(lineWidth: 2, lineCap: .round))
            }
            .offset(x: -46, y: 47)

            LapelShape(isLeft: false)
            .fill(Color("RoxyCloakShade"))
            .frame(width: 70, height: 86)
            .overlay(LapelShape(isLeft: false).stroke(Color("RoxyAccent"), lineWidth: 2))
            .offset(x: 46, y: 47)

            Capsule()
                .fill(Color("RoxyAccent"))
                .frame(width: 124, height: 18)
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 1.5))
                .offset(y: 194)

            RoundedRectangle(cornerRadius: 5)
                .fill(Color("RoxyHat"))
                .frame(width: 26, height: 27)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("RoxyPaper"), lineWidth: 2))
                .offset(y: 194)

            // 後髮與右側辮子
            Ellipse()
                .fill(Color("RoxyHairShadow"))
                .frame(width: 190, height: 190)
                .overlay(Ellipse().stroke(Color("RoxyInk").opacity(0.62), lineWidth: 2.5))
                .offset(y: -78)

            Capsule()
                .fill(Color("RoxyHairShadow"))
                .frame(width: 34, height: 121)
                .rotationEffect(.degrees(-8))
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 2))
                .offset(x: -75, y: -57)

            Capsule()
                .fill(Color("RoxyHair"))
                .frame(width: 31, height: 120)
                .rotationEffect(.degrees(10))
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 2))
                .offset(x: 76, y: -57)

            // 臉部輪廓與耳朵
            Ellipse()
                .fill(Color("RoxySkin"))
                .frame(width: 25, height: 40)
                .overlay(Ellipse().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 2))
                .offset(x: -68, y: -77)

            Ellipse()
                .fill(Color("RoxySkin"))
                .frame(width: 25, height: 40)
                .overlay(Ellipse().stroke(Color("RoxyInk").opacity(0.55), lineWidth: 2))
                .offset(x: 68, y: -77)

            FaceShape()
                .fill(Color("RoxySkin"))
                .frame(width: 139, height: 160)
                .overlay(FaceShape().stroke(Color("RoxyInk").opacity(0.78), lineWidth: 2.5))
                .offset(y: -79)

            Ellipse()
                .fill(Color("RoxySkinShade").opacity(0.52))
                .frame(width: 17, height: 9)
                .offset(x: -42, y: -51)

            Ellipse()
                .fill(Color("RoxySkinShade").opacity(0.52))
                .frame(width: 17, height: 9)
                .offset(x: 42, y: -51)

            // 睏睏的藍眼睛與表情
            Capsule()
                .fill(Color("RoxyPaper"))
                .frame(width: 34, height: 17)
                .overlay(Capsule().stroke(Color("RoxyInk"), lineWidth: 1.5))
                .offset(x: -33, y: -93)

            Capsule()
                .fill(Color("RoxyPaper"))
                .frame(width: 34, height: 17)
                .overlay(Capsule().stroke(Color("RoxyInk"), lineWidth: 1.5))
                .offset(x: 33, y: -93)

            Circle()
                .fill(Color("RoxyEye"))
                .frame(width: 13, height: 13)
                .offset(x: -30, y: -91)

            Circle()
                .fill(Color("RoxyEye"))
                .frame(width: 13, height: 13)
                .offset(x: 30, y: -91)

            Circle()
                .fill(Color("RoxyEyeDeep"))
                .frame(width: 6, height: 9)
                .offset(x: -29, y: -90)

            Circle()
                .fill(Color("RoxyEyeDeep"))
                .frame(width: 6, height: 9)
                .offset(x: 31, y: -90)

            Capsule()
                .fill(Color("RoxyHairShadow"))
                .frame(width: 35, height: 5)
                .rotationEffect(.degrees(-4))
                .offset(x: -33, y: -104)

            Capsule()
                .fill(Color("RoxyHairShadow"))
                .frame(width: 35, height: 5)
                .rotationEffect(.degrees(4))
                .offset(x: 33, y: -104)

            Capsule()
                .fill(Color("RoxySkinShade"))
                .frame(width: 4, height: 11)
                .offset(x: 0, y: -73)

            Capsule()
                .fill(Color("RoxyCloakShade"))
                .frame(width: 16, height: 3)
                .offset(y: -56)

            // 垂在右肩的水藍色編髮
            braid
                .offset(x: 101, y: 55)

            // 前額瀏海
            HairFringeShape()
                .fill(Color("RoxyHair"))
                .frame(width: 151, height: 67)
                .overlay(HairFringeShape().stroke(Color("RoxyInk").opacity(0.72), lineWidth: 2.2))
                .offset(x: 0, y: -143)

            // 法師帽帽冠、帽簷與金色裝飾
            HatCrownShape()
                .fill(Color("RoxyHat"))
                .frame(width: 202, height: 137)
                .overlay(HatCrownShape().stroke(Color("RoxyInk"), lineWidth: 3))
                .rotationEffect(.degrees(-4))
                .offset(x: -2, y: -211)

            Ellipse()
                .fill(Color("RoxyHat"))
                .frame(width: 286, height: 43)
                .overlay(Ellipse().stroke(Color("RoxyInk"), lineWidth: 3))
                .rotationEffect(.degrees(-3))
                .offset(x: 0, y: -157)

            Capsule()
                .fill(Color("RoxyAccent"))
                .frame(width: 178, height: 11)
                .rotationEffect(.degrees(-3))
                .offset(x: -1, y: -164)

            SparkleShape()
                .fill(Color("RoxyAccent"))
                .frame(width: 25, height: 28)
                .rotationEffect(.degrees(10))
                .offset(x: 43, y: -207)

            Circle()
                .fill(Color("RoxyCrystal"))
                .frame(width: 8, height: 8)
                .shadow(color: Color("RoxyCrystal").opacity(0.8), radius: 6)
                .offset(x: -98, y: -224)
        }
        .frame(width: 360, height: 560)
    }

    private var braid: some View {
        ZStack {
            Capsule()
                .fill(Color("RoxyHairShadow"))
                .frame(width: 24, height: 122)
                .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.65), lineWidth: 2))

            ForEach(0..<7, id: \.self) { index in
                Capsule()
                    .fill(index.isMultiple(of: 2) ? Color("RoxyHair") : Color("RoxyHairShadow"))
                    .frame(width: 22, height: 25)
                    .overlay(Capsule().stroke(Color("RoxyInk").opacity(0.42), lineWidth: 1))
                    .rotationEffect(.degrees(index.isMultiple(of: 2) ? -18 : 18))
                    .offset(x: index.isMultiple(of: 2) ? -4 : 4, y: CGFloat(index) * 15 - 45)
            }

            Capsule()
                .fill(Color("RoxyAccent"))
                .frame(width: 23, height: 7)
                .offset(y: -61)
        }
        .frame(width: 30, height: 132)
        .rotationEffect(.degrees(-5))
    }
}

// 以下自訂形狀只補足帽冠、臉部、瀏海、披風與法杖水晶的輪廓。
private struct CloakShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.06))
        path.addCurve(
            to: CGPoint(x: rect.width * 0.8, y: rect.height * 0.06),
            control1: CGPoint(x: rect.width * 0.35, y: -rect.height * 0.04),
            control2: CGPoint(x: rect.width * 0.65, y: -rect.height * 0.04)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.96, y: rect.height * 0.98),
            control1: CGPoint(x: rect.width * 0.94, y: rect.height * 0.24),
            control2: CGPoint(x: rect.width, y: rect.height * 0.65)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.04, y: rect.height * 0.98),
            control1: CGPoint(x: rect.width * 0.73, y: rect.height * 1.02),
            control2: CGPoint(x: rect.width * 0.27, y: rect.height * 1.02)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.06),
            control1: CGPoint(x: 0, y: rect.height * 0.65),
            control2: CGPoint(x: rect.width * 0.06, y: rect.height * 0.24)
        )
        path.closeSubpath()
        return path
    }
}

private struct FaceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width * 0.12, y: rect.height * 0.2))
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.88, y: rect.height * 0.2), control: CGPoint(x: rect.width * 0.5, y: -rect.height * 0.08))
        path.addCurve(
            to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.99),
            control1: CGPoint(x: rect.width * 0.94, y: rect.height * 0.58),
            control2: CGPoint(x: rect.width * 0.7, y: rect.height * 0.94)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.12, y: rect.height * 0.2),
            control1: CGPoint(x: rect.width * 0.3, y: rect.height * 0.94),
            control2: CGPoint(x: rect.width * 0.06, y: rect.height * 0.58)
        )
        path.closeSubpath()
        return path
    }
}

private struct HairFringeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width * 0.02, y: rect.height * 0.13))
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.96, y: rect.height * 0.1), control: CGPoint(x: rect.width * 0.55, y: -rect.height * 0.12))
        path.addCurve(
            to: CGPoint(x: rect.width * 0.77, y: rect.height * 0.87),
            control1: CGPoint(x: rect.width, y: rect.height * 0.39),
            control2: CGPoint(x: rect.width * 0.9, y: rect.height * 0.68)
        )
        path.addLine(to: CGPoint(x: rect.width * 0.64, y: rect.height * 0.61))
        path.addLine(to: CGPoint(x: rect.width * 0.52, y: rect.height * 0.99))
        path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.61))
        path.addLine(to: CGPoint(x: rect.width * 0.22, y: rect.height * 0.85))
        path.addLine(to: CGPoint(x: rect.width * 0.18, y: rect.height * 0.56))
        path.addLine(to: CGPoint(x: rect.width * 0.04, y: rect.height * 0.71))
        path.closeSubpath()
        return path
    }
}

private struct HatCrownShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width * 0.08, y: rect.height * 0.82))
        path.addCurve(
            to: CGPoint(x: rect.width * 0.46, y: rect.height * 0.38),
            control1: CGPoint(x: rect.width * 0.16, y: rect.height * 0.6),
            control2: CGPoint(x: rect.width * 0.28, y: rect.height * 0.34)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.75, y: rect.height * 0.15),
            control1: CGPoint(x: rect.width * 0.54, y: rect.height * 0.35),
            control2: CGPoint(x: rect.width * 0.65, y: rect.height * 0.24)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.92, y: rect.height * 0.78),
            control1: CGPoint(x: rect.width * 0.88, y: rect.height * 0.18),
            control2: CGPoint(x: rect.width * 0.82, y: rect.height * 0.6)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.08, y: rect.height * 0.82),
            control1: CGPoint(x: rect.width * 0.7, y: rect.height * 0.9),
            control2: CGPoint(x: rect.width * 0.28, y: rect.height * 0.94)
        )
        path.closeSubpath()
        return path
    }
}

private struct LapelShape: Shape {
    var isLeft: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: isLeft ? rect.minX : rect.maxX, y: rect.height * 0.52))
        path.addLine(to: CGPoint(x: isLeft ? rect.width * 0.3 : rect.width * 0.7, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

private struct CrystalShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height * 0.35))
        path.addLine(to: CGPoint(x: rect.width * 0.7, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.height * 0.35))
        path.closeSubpath()
        return path
    }
}

private struct SparkleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.38))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.62))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.38, y: rect.height * 0.62))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width * 0.38, y: rect.height * 0.38))
        path.closeSubpath()
        return path
    }
}
