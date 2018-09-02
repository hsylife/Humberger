import UIKit

class BaseViewController: UIViewController {

    @IBAction func tapMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "showMenu", sender: nil)
    }

}

