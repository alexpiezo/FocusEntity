//
//  FocusEntity+Colored.swift
//  FocusEntity
//
//  Created by Max Cobb on 8/26/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

#if canImport(ARKit)
import RealityKit

/// An extension of FocusEntity holding the methods for the "colored" style.

@available(iOS 13, *)
public extension FocusEntity {

  internal func coloredStateChanged() {
    guard let coloredStyle = self.focusEntity.coloredStyle else {
      return
    }
    var endColor: Material.Color = .clear
    if self.state == .initializing {
      endColor = coloredStyle.otherColor
    } else {
      endColor = self.onPlane ? coloredStyle.onColor : coloredStyle.offColor
    }
    self.fillPlane?.model?.materials[0] = SimpleMaterial(
      color: endColor, isMetallic: false
    )
  }
}
#endif
