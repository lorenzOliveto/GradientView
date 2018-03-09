# GradientView

A view with a configurable gradient.

## Installation

Add to your Podfile

```
use_frameworks!
pod 'GradientView', git: 'https://github.com/lorenzOliveto/GradientView.git'
```

Then run
```
pod install
```
## Usage

Drag a view in your storyboard and change its class to` GradientView`.
Then configure it in your ViewController.

Example:

```
import UIKit

class ViewController: UIViewController {

    @IBOutlet var gradientView: GradientView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.gradientView.colors = [UIColor.yellow.cgColor, UIColor.red.cgColor]
        self.gradientView.set(startPoint: CGPoint(x: 0.5, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
    }
}
```
