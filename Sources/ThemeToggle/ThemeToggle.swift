import SwiftUI

struct ThemeToggle: View {

    private enum Constant {

        static let size = CGSize(width: 375, height: 130)
    }

    @Binding var isOn: Bool

    private var cornerRadius: CGFloat {
        Constant.size.height / 2
    }

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundStyle(backgroundStyle)
            .frame(width: Constant.size.width, height: Constant.size.height)
            .overlay(earth)
            .overlay(stars)
            .overlay(cloudes)
            .overlay(alignment: isOn ? .leading : .trailing) {
                moonSun
            }
            .clipped()
            .onTapGesture {
                isOn.toggle()
            }
            .animation(.default, value: isOn)
    }

    private var backgroundStyle: some ShapeStyle {
        let nightColors = [Color.nightBackgroundStart, Color.nightBackgroundEnd]
        let dayColors = [Color.dayBackgroundStart, Color.dayBackgroundEnd]
        return LinearGradient(
            gradient: Gradient(colors: isOn ? dayColors : nightColors),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        ).shadow(
            .inner(color: .black.opacity(0.3), radius: 10, x: -2, y: 4)
        )
    }

    private var earth: some View {
        Ellipse()
            .foregroundStyle(Color.earth)
            .frame(width: 272, height: 202)
            .position(
                x: 20,
                y: isOn ? 250 : 170
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .clipped()
    }

    private var moonSun: some View {
        Circle()
            .modifier(LayerBlurModifier(radius: 5))
            .foregroundStyle(isOn ? Color.sun : Color.moon)
            .padding(10)
            .overlay {
                Image("moon-decorations", bundle: .module)
                    .opacity(isOn ? 0 : 1)
            }
    }

    private var stars: some View {
        Image("stars", bundle: .module)
            .opacity(isOn ? 0 : 1)
    }

    private var cloudes: some View {
        Group {
            Image("cloud-top-left", bundle: .module)
                .offset(
                    x: isOn ? 0 : -40,
                    y: isOn ? -25 : -100
                )
            Image("cloud-top-right", bundle: .module)
                .offset(
                    x: isOn ? 120 : 250,
                    y: isOn ? -10 : -30
                )
            Image("cloud-bottom", bundle: .module)
                .offset(
                    x: isOn ? 25 : 0,
                    y: isOn ? 25 : 100
                )
        }
    }
}

private struct PrerviewContentView: View {

    @State var isOn: Bool = true

    var body: some View {
        ThemeToggle(isOn: $isOn)
    }
}

#Preview {
    PrerviewContentView()
}
