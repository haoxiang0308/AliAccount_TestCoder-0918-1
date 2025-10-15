import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemBackground
        self.title = "My View Controller"
    }
    
    override func loadView() {
        super.loadView()
        // Create the main view
        let mainView = UIView()
        mainView.backgroundColor = UIColor.systemBackground
        
        // Create a label
        let label = UILabel()
        label.text = "Hello, Swift!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the main view
        mainView.addSubview(label)
        
        // Add constraints for the label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
        
        // Set the main view as the view controller's view
        self.view = mainView
    }
}