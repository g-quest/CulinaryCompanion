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
    
    private let steps = [
        "Preheat Oven & Prepare Pan: Preheat your oven to 375°F (190°C). Line a muffin tin with paper liners or grease with non-stick spray.",
        "Dry Ingredients: In a medium-sized bowl, whisk together the flour, baking powder, baking soda, salt, and cinnamon.",
        "Butter & Sugar Mixture: In a larger bowl, cream together the softened butter and sugar until light and fluffy. Add the eggs one at a time, beating well after each addition. Stir in the vanilla extract.",
        "Combine: Gradually add the dry ingredients to the wet mixture, alternating with the milk. Mix until just combined. Gently fold in the diced apples.",
        "Scoop & Topping: Divide the batter evenly among the muffin cups, filling each about 2/3 full. If you're using the topping, combine the sugar and cinnamon in a small bowl and sprinkle over the muffin batter.",
        "Bake: Bake for 20-25 minutes or until a toothpick inserted into the center of a muffin comes out clean.",
        "Cool: Remove the muffins from the oven and let them cool in the pan for about 5 minutes. Transfer to a wire rack to cool completely."
    ]

    @State private var currentStepIndex = 0

    var body: some View {
        
        VStack {
            Text(steps[currentStepIndex])
                .padding()

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
            
            if currentStepIndex == 0 {
                Button("Open New Window") {
                       openWindow(id: "OvenTimer")
                }

            }
        }
        .navigationBarTitle("\(item): Step \(currentStepIndex + 1) of \(steps.count)", displayMode: .inline)
    }
}

#Preview {
    RecipeSteps(item: "Apple Pie")
}
