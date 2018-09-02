import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!

    @IBOutlet weak var blurView: UIVisualEffectView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        openAnimation()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches where touch.view?.tag == 1 {
            closeAnimation()
        }
    }
}

fileprivate extension MenuViewController {
    func openAnimation() {
        blurView.alpha = 0
        let menuPosition = menuView.layer.position
        menuView.layer.position.x = -menuView.frame.width
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.menuView.layer.position.x = menuPosition.x
                self.blurView.alpha = 1
        },
            completion: nil)
    }
    
    func closeAnimation() {
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.menuView.layer.position.x = -self.menuView.frame.width
                self.blurView.alpha = 1

        },
            completion: { _ in
                self.dismiss(animated: true)
        })
    }
}
