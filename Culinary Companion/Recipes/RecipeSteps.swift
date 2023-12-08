//
//  RecipeSteps.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 10/28/23.
//

import SwiftUI

struct RecipeSteps: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var item: String
    
    private let stepNames = [
        "Preheat Oven",
        "Prepare the Dough",
        "Add Sauce",
        "Add Cheese",
        "Add Pepperoni",
        "Bake the Pizza",
        "Add Fresh Arugula",
        "Serve and Enjoy!"
    ]
    
    private let steps = [
        "Preheat your oven to 475°F (245°C). If you have a pizza stone, place it in the oven to heat up.",
        "Roll out the pizza dough on a floured surface to your desired thickness. If you don’t have a pizza peel, prepare the dough on a piece of parchment paper for easy transfer to the oven.",
        "Spread the pizza sauce evenly on the dough, leaving a small border for the crust.",
        "Sprinkle half of the mozzarella cheese over the sauce.",
        "Add the pepperoni slices, then top with the remaining mozzarella cheese.",
        "Transfer the pizza to the preheated oven or pizza stone. Bake for about 12-15 minutes, or until the crust is golden and the cheese is bubbly.",
        "Once the pizza is baked, remove it from the oven. Immediately top with fresh arugula. The heat from the pizza will slightly wilt the arugula.",
        "Slice the pizza and serve hot."
    ]
    
    private let stepImages = [
        "",
        "s1",
        "s2",
        "s3",
        "s4",
        "",
        "s5",
        "pizza"
    ]

    @State private var currentStepIndex = 0

    var body: some View {
        
//        ForEach(steps.indices, id: \.self) { index in
//            let step = steps[index]
//            let image = (index < stepImages.count) ? stepImages[index] : "defaultImage" // Fallback image if not enough images
//            
//            ZStack {
//                Image(image)
//                    .resizable()
//                    .aspectRatio(1, contentMode: .fill)
//                    .cornerRadius(10)
//                    .clipped()
//                    .overlay(
//                        Rectangle()
//                            .foregroundColor(.black)
//                            .opacity(0.45)
//                            .cornerRadius(10)
//                    )
//                Text(step)
//                    .font(.title)
//                    .frame(width: 190, height: 200, alignment: .center)
//                    .multilineTextAlignment(.center)
//                    .lineLimit(nil)
//                    .padding()
//            }
//        }
        
        VStack {
            VStack {
                Text(stepNames[currentStepIndex])
                    .font(.title)
                
                if currentStepIndex != 0 && currentStepIndex != 5 {
                    Image(stepImages[currentStepIndex])
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .clipped()
                        .padding()
                        .frame(width: 250, height: 250)
                }
                
                Text(steps[currentStepIndex])
                    .padding([.top, .bottom], 20)
                    .padding([.trailing, .leading], 175)
                    .multilineTextAlignment(.center)
                
                if currentStepIndex == 0 {
                    Button("Start Oven") {
                           openWindow(id: "OvenTimer")
                    }

                }
            }

            HStack {
                Button(action: {
                    if currentStepIndex > 0 {
                        currentStepIndex -= 1
                    }
                }) {
                    Image(systemName: "arrow.left")
                }
                .disabled(currentStepIndex == 0)

                Spacer()

                Button(action: {
                    if currentStepIndex < steps.count - 1 {
                        currentStepIndex += 1
                    }
                }) {
                    Image(systemName: "arrow.right")
                }
                .disabled(currentStepIndex == steps.count - 1)
            }
            .padding()
        
        }
        .navigationBarTitle("\(item): Step \(currentStepIndex + 1) of \(steps.count)", displayMode: .inline)
    }
}

#Preview {
    RecipeSteps(item: "Apple Pie")
}
