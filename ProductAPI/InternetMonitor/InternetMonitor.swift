import Network
import Combine

class InternetMonitor: ObservableObject {
    
    @Published var isConnected: Bool = true
    
    private var monitor: NWPathMonitor?
    private var queue = DispatchQueue(label: "InternetMonitorQueue")
    
    init() {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor?.start(queue: queue)
    }
    
    deinit {
        monitor?.cancel()
    }
}
