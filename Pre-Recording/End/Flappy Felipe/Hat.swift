/*
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import SpriteKit

final class Hat: SKSpriteNode {
  convenience init() {
    self.init(imageNamed: AppIcon.current.textureName)
    isUserInteractionEnabled = true
  }

  override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
    AppIcon.alternate{
      [unowned self]
      getIcon in
      
      do {
        let icon = try getIcon()
        
        DispatchQueue.main.async{
          self.texture = SKTexture(imageNamed: icon.textureName)
        }
      }
      catch AppIcon.AlternateError.noAlternateToday {}
      catch {fatalError(error.localizedDescription)}
    }
  }
}

private extension AppIcon {
  var textureName: String {
    return name ?? "Sombrero"
  }
}
