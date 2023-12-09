//
//  3DModel.swift
//  Culinary Companion
//
//  Created by GREGORY CUESTA on 12/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct RotatingModel: View {
    var item: String
    var size: CGFloat
    
    
    var body: some View {
        TimelineView(.animation) { context in
            HStack {
                IngredientView(name: item)
                    .rotation3DEffect(
                        Rotation3D(
                            angle: Angle2D(degrees: 5 * context.date.timeIntervalSinceReferenceDate),
                            axis: .y
                        )
                    )
                    .frame(depth: size, alignment: .front)
                    .frame(width: size)
            }
        }
    }
    
    struct Ingredient: Equatable, Hashable {
        var name: String
        var size: CGFloat
    }
    
    struct IngredientView: View {
        var name: String
        var body: some View {
            Model3D(named: name) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case let .failure(error):
                    Text(error.localizedDescription)
                case let .success(model):
                    model
                        .resizable()
                        .scaledToFit()
                @unknown default:
                    Text("error")
                }
            }
        }
    }
}
    #Preview {
        RotatingModel(item: "pizza", size: 300)
    }
