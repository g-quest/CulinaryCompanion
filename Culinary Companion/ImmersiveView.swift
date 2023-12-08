//
//  ImmersiveView.swift
//  Culinary Companion
//
//  Created by Gregory Cuesta on 11/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
            
            
//            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
//            floor.generateCollisionShapes(recursive: false)
//            floor.components[PhysicsBodyComponent.self] = .init(
//                massProperties: .default,
//                mode: .static
//            )
//            content.add(floor)
//            if let milkModel = try? await Entity(named: "milk"),
//               let milk =
//                milkModel.children.first?.children
//                .first {
//                milk.scale = [1,1,1]
//                milk.position.y = 0.5
//                milk.position.z = -1
//                
//                milk.generateCollisionShapes(recursive: false)
//                milk.components.set(InputTargetComponent())
//                
//                milk.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
//                    massProperties: .default,
//                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
//                    mode: .dynamic
//                ))
//                milk.components[PhysicsMotionComponent.self] = .init()
//                
//                content.add(milk)
//            }
        }

    }
    
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
