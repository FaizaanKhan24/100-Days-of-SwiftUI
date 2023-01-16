//
//  ContentView.swift
//  Drawing
//
//  Created by Faizaan Khan on 1/14/23.
//

import SwiftUI

struct Arrow: InsettableShape{
    var insetAmount = 0.0
    
    var animatableData: Double {
            get { insetAmount }
            set { insetAmount = newValue}
        }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.height - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX, y: insetAmount))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.height * 0.33))
        path.move(to: CGPoint(x: rect.midX, y: insetAmount))
        path.addLine(to: CGPoint(x: rect.width - insetAmount, y: rect.height * 0.33))
        path.closeSubpath()
        
        return path
        
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ColorCyclingRectangle : View{
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack{
            ForEach(0..<steps){ value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color{
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var lineWidth = 1.0
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack{
            VStack{
                VStack{
                    Arrow()
                        .stroke(.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                        .animation(.easeInOut(duration: 2), value: lineWidth)
                        .padding()
                }
                .frame(width: 150, height: 250)
                .border(.gray)
                
                
                Text("Line width: \(lineWidth, specifier: "%.00f")")
                Slider(value: $lineWidth, in: 1...20)
                    .padding()
            }
            .padding()
            
            VStack{
                ColorCyclingRectangle(amount: colorCycle)
                    .frame(width: 300, height: 300)
                
                Slider(value: $colorCycle)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
