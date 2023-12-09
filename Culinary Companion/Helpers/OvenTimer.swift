//
//  OvenTimer.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/27/23.
//

import SwiftUI

struct OvenTimer: View {
    @State private var currentTemperature: Double = 65
    @State private var elapsedTime: Double = 0
    let targetTemperature: Double = 475
    let totalTime: Double = 240  // Total time in seconds
    let initialTemperature: Double = 65
    let delayTime: Double = 5
    
    var body: some View {
        VStack {
            Text("Oven Temperature")
                .font(.largeTitle)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.orange)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.currentTemperature / self.targetTemperature, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.orange)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: self.currentTemperature)
                
                Text("\(Int(self.currentTemperature))°")
                    .font(.system(size: 50, weight: .bold))
            }
            .padding(40)
            if self.currentTemperature >= self.targetTemperature {
                Text("Target Temperature Reached")
                    .font(.title)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.orange)
            } else {
                Text("Heating to: \(Int(self.targetTemperature))°")
                    .font(.title)
                    .padding(.bottom, 8)
          
                
            }
        }
        .padding()
        .onAppear {
            self.startHeating()
        }
        
    }
    
    func startHeating() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.elapsedTime += 1
            guard self.elapsedTime > self.delayTime else { return }
            
            let adjustedTime = self.elapsedTime - self.delayTime
            let timeFraction = adjustedTime / (self.totalTime - self.delayTime)
            let temperatureIncrement: Double
            
            if timeFraction < 2.0 / 3.0 {
                temperatureIncrement = ((self.targetTemperature - self.initialTemperature) / (self.totalTime - self.delayTime)) * (1 + timeFraction)
            } else {
                temperatureIncrement = ((self.targetTemperature - self.initialTemperature) / (self.totalTime - self.delayTime)) * (2 - timeFraction)
            }
            
            if self.currentTemperature < self.targetTemperature {
                self.currentTemperature += temperatureIncrement
                self.currentTemperature = min(self.currentTemperature, self.targetTemperature)
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    OvenTimer()
}
