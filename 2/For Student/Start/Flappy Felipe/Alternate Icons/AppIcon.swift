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

import UIKit

enum AppIcon {
  case primary
  case valentine
  case thanksgiving
  case christmas
  
  static var current: AppIcon {
    return [
      primary,
      valentine,
      thanksgiving,
      christmas
    ].first{$0.name == UIApplication.shared.alternateIconName}!
  }
  
  static func alternate() {
    let icon: AppIcon
    
    if current == valentine {
      icon = primary
    }
    else {
      icon = valentine
    }
    
    UIApplication.shared.setAlternateIconName(icon.name)
  }
  
  var name: String? {
    switch self {
    case .primary: return nil
    case .valentine: return "Valentine"
    case .thanksgiving: return "Thanksgiving"
    case .christmas: return "Christmas"
    }
  }
}










