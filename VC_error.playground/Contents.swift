import UIKit

// ORIGINAL VC - Runnable creating a new UIKit project and replacin the code in the VC

//import UIKit
//
//class ViewController: UIViewController {
//    private let refreshInterval = 1.0 / 60.0
//
//    private let timeLabel = UILabel()
//    private let startButton = UIButton(type: .system)
//    private let pauseButton = UIButton(type: .system)
//
//    private var startTime: Date?
//    private var timer: Timer?
//    private var elapsedTime: Date?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpViews()
//    }
//
//    private func setUpViews() {
//        timeLabel.text = "00:00:00"
//        timeLabel.font = .monospacedDigitSystemFont(ofSize: 72, weight: .regular)
//        timeLabel.textAlignment = .center
//        timeLabel.adjustsFontSizeToFitWidth = true
//
//        startButton.setTitle("Start", for: .normal)
//        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
//
//        pauseButton.setTitle("Pause", for: .normal)
//        pauseButton.addTarget(self, action: #selector(pausedTapped), for: .touchUpInside)
//        pauseButton.isHidden = true
//
//        let verticalStack = UIStackView(arrangedSubviews: [timeLabel, startButton, pauseButton])
//        verticalStack.axis = .vertical
//        verticalStack.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verticalStack)
//
//        NSLayoutConstraint.activate([
//            timeLabel.heightAnchor.constraint(equalToConstant: 200),
//            verticalStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//
//
//            verticalStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            verticalStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//        ])
//    }
//
//    @objc func startTapped(sender: UIButton) {
//        startButton.isHidden = true
//        pauseButton.isHidden = false
//
//        startTime = Date()
//        timer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
//            guard let self = self else { return }
//            let elapsedTime = Date().timeIntervalSince(startTime ?? Date())
//
//            let minutes = Int(elapsedTime / 60)
//            let seconds = Int(elapsedTime - TimeInterval(minutes))
//            let hundredths = Int(100 * (elapsedTime - TimeInterval(minutes) - TimeInterval(seconds)))
//
//            self.timeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, hundredths)
//        }
//    }
//
//    @objc func pausedTapped(sender: UIButton) {
//        startButton.isHidden = false
//        pauseButton.isHidden = true
//
//        timer?.invalidate()
//        elapsedTime = Date()
//        timer = nil
//    }
//}


//class ViewController: UIViewController {
//
//    private let refreshInterval = 1.0 / 60.0
//    private let timeLabel = UILabel()
//    private let startButton = UIButton(type: .system)
//    private let pauseButton = UIButton(type: .system)
//
//    private var startTime: Date?
//    private var timer: Timer?
//    private var elapsedTime: TimeInterval = 0.0 // Added variable to track elapsed time
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpViews()
//    }
//
//    private func setUpViews() {
//        timeLabel.text = "00:00:00"
//        timeLabel.font = .monospacedDigitSystemFont(ofSize: 72, weight: .regular)
//        timeLabel.textAlignment = .center
//        timeLabel.adjustsFontSizeToFitWidth = true
//
//        startButton.setTitle("Start", for: .normal)
//        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
//
//        pauseButton.setTitle("Pause", for: .normal)
//        pauseButton.addTarget(self, action: #selector(pausedTapped), for: .touchUpInside)
//        pauseButton.isHidden = true
//
//        let verticalStack = UIStackView(arrangedSubviews: [timeLabel, startButton, pauseButton])
//        verticalStack.axis = .vertical
//        verticalStack.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verticalStack)
//
//        NSLayoutConstraint.activate([
//            timeLabel.heightAnchor.constraint(equalToConstant: 200),
//            verticalStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            verticalStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            verticalStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//        ])
//    }
//
//    //With issue
//    @objc func startTapped(sender: UIButton) {
//        startButton.isHidden = true
//        pauseButton.isHidden = false
//
//        startTime = Date()
//        timer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
//            guard let self = self else { return }
//            let elapsedTime = Date().timeIntervalSince(self.startTime ?? Date())
//
//            let minutes = Int(elapsedTime / 60)
//            let seconds = Int(elapsedTime - TimeInterval(minutes))
//            let hundredths = Int(100 * (elapsedTime - TimeInterval(minutes) - TimeInterval(seconds)))
//
//            self.timeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, hundredths)
//        }
//    }
//
//    //FIXED
//    @objc func startTapped(sender: UIButton) {
//        // ... your existing code ...
//
//        // Check if the timer is already running
//        guard timer == nil else { return }
//
//        startTime = Date() //Current Date and Time
//        timer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
//            guard let self = self else { return }
//
//            // Calculate the elapsed time based on the stored start time and previous elapsed time
//            self.elapsedTime = -(self.startTime?.timeIntervalSinceNow ?? 0) + (self.elapsedTime ?? 0)
//
//            let minutes = Int(self.elapsedTime / 60)
//            let seconds = Int(self.elapsedTime) % 60
//            let hundredths = Int((self.elapsedTime * 100).truncatingRemainder(dividingBy: 100))
//
//            self.timeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, hundredths)
//        }
//    }
//
//    //With issue
//    @objc func pausedTapped(sender: UIButton) {
//        startButton.isHidden = false
//        pauseButton.isHidden = true
//
//        timer?.invalidate()
//        timer = nil
//    }
//
//    //FIXED
//    @objc func pausedTapped(sender: UIButton) {
//        // ... your existing code ...
//
//        // Store the elapsed time when pausing
//        elapsedTime = -(startTime?.timeIntervalSinceNow ?? 0) + (elapsedTime ?? 0)
//
//        // ... your existing code ...
//    }
//}

// Testing giladas
let interval = Date().timeIntervalSinceNow
print(abs(interval))
print(interval)



