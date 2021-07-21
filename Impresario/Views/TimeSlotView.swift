
import SwiftUI
import CoreImage.CIFilterBuiltins

struct TimeSlotView: View {
    let timeSlot: TimeSlot
    
    var body: some View {
        if timeSlot.isAvailable {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.init(.darkGray))
            .frame(width: 120, height: 30, alignment: .center)
            .overlay(Button("\(timeSlot.startsAt)", action: {})
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
            )
        } else {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(.darkGray))
                .foregroundColor(Color.init(.white))
                .frame(width: 120, height: 30, alignment: .center)
                .overlay(Text("\(timeSlot.startsAt)")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .semibold))
                )
        }
    }
}

//struct StripView: View {
//    let numberOfStrips: Int = 5
//    let lineWidth: CGFloat = 2
//    let borderLineWidth: CGFloat = 1
//    let color = Color.green
//
//    var body: some View {
//
//        HStack(spacing: 0) {
//            ForEach(0..<numberOfStrips) { number in
//                Color.white
//                color.frame(width: lineWidth)
//                if number == numberOfStrips - 1 {
//                    Color.white
//                }
//            }
//
//        }.mask(WaveShape())
//        .overlay(WaveShape().stroke(color, lineWidth: borderLineWidth))
//        .frame(width: 100, height: 50)
//
//    }
//}
//    struct WaveShape: Shape {
//        func path(in rect: CGRect) -> Path {
//            var path = Path()
//            path.addEllipse(in: rect)
//            return path
//        }
//    }
//extension CGImage {
//
//    static func generateStripePattern(
//        colors: (UIColor, UIColor) = (.clear, .black),
//        width: CGFloat = 6,
//        ratio: CGFloat = 1) -> CGImage? {
//
//    let context = CIContext()
//    let stripes = CIFilter.stripesGenerator()
//    stripes.color0 = CIColor(color: colors.0)
//    stripes.color1 = CIColor(color: colors.1)
//    stripes.width = Float(width)
//    stripes.center = CGPoint(x: 1-width*ratio, y: 0)
//    let size = CGSize(width: width, height: 1)
//
//    guard
//        let stripesImage = stripes.outputImage,
//        let image = context.createCGImage(stripesImage, from: CGRect(origin: .zero, size: size))
//    else { return nil }
//    return image
//  }
//}
//
//extension Shape {
//
//    func stripes(angle: Double = 45) -> AnyView {
//        guard
//            let stripePattern = CGImage.generateStripePattern()
//        else { return AnyView(self)}
//
//        return AnyView(RoundedRectangle(cornerRadius: 10).fill(ImagePaint(
//            image: Image(decorative: stripePattern, scale: 1.0)))
//        .scaleEffect(2)
//        .rotationEffect(.degrees(angle))
//        .clipShape(self))
//    }
//}

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlotView(timeSlot: TimeSlot(startsAt: "2021-07-18 11:53:42.801883+0200", isAvailable: false))
    }
}
