import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            let scale = min(proxy.size.width / 540, (proxy.size.height - 112) / 800)

            ZStack {
                LinearGradient(
                    colors: [Color("RoxyStage"), Color("RoxyHalo")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    HStack(spacing: 9) {
                        Rectangle()
                            .fill(Color("RoxyAccent"))
                            .frame(width: 21, height: 1)
                        Text("MUSHOKU TENSEI")
                            .font(.system(size: 9, weight: .medium, design: .monospaced))
                            .tracking(3.2)
                            .foregroundStyle(Color("RoxyPaper").opacity(0.72))
                        Spacer()
                        Text("02")
                            .font(.system(size: 11, weight: .medium, design: .monospaced))
                            .foregroundStyle(Color("RoxyAccent"))
                    }
                    .padding(.horizontal, 27)
                    .padding(.top, 13)

                    Spacer(minLength: 0)

                    RoxyIllustration()
                        .frame(width: 540, height: 800)
                        .scaleEffect(scale)
                        .frame(width: 540 * scale, height: 800 * scale)

                    Spacer(minLength: 0)

                    VStack(spacing: 5) {
                        Text("洛琪希・米格路迪亞")
                            .font(.system(size: 22, weight: .medium, design: .serif))
                            .tracking(1.5)
                            .foregroundStyle(Color("RoxyPaper"))
                        Text("ROXY MIGURDIA")
                            .font(.system(size: 9, weight: .medium, design: .monospaced))
                            .tracking(4.1)
                            .foregroundStyle(Color("RoxyAccent"))
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
