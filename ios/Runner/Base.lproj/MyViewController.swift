import Flutter
class MyViewController: FlutterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the Flutter engine
        let flutterEngine = FlutterEngine(name: "my_flutter_engine") // Replace with your engine name
        flutterEngine.run()

        // Set the initial route
        self.setInitialRoute("your_initial_route") // Replace with your initial route

        // Add the Flutter view
        self.view = flutterEngine.view

        // Register a method channel handler to receive data from Flutter
        let channel = FlutterMethodChannel(name: "your_channel_name", binaryMessenger: flutterEngine.binaryMessenger)
        channel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "sendTextToSwift" {
                if let arguments = call.arguments as? [String: Any],
                   let text = arguments["text"] as? String {
                    // Display the received text in Swift
                    self?.displayText(text)
                }
            }
        }
    }

    func displayText(_ text: String) {
        // Display the text in your Swift UI (e.g., UILabel)
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 30)
        view.addSubview(label)
    }
}
