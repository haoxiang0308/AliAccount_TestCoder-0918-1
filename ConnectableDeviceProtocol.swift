import Foundation

/// Protocolo para dispositivos que pueden conectarse
protocol ConnectableDevice {
    /// Estado de conexión del dispositivo
    var isConnected: Bool { get }
    
    /// Nombre del dispositivo
    var deviceName: String { get }
    
    /// ID único del dispositivo
    var deviceId: String { get }
    
    /// Intenta conectar el dispositivo
    /// - Returns: Booleano indicando si la conexión fue exitosa
    func connect() -> Bool
    
    /// Desconecta el dispositivo
    /// - Returns: Booleano indicando si la desconexión fue exitosa
    func disconnect() -> Bool
    
    /// Verifica si el dispositivo está disponible
    /// - Returns: Booleano indicando si el dispositivo está disponible
    func isAvailable() -> Bool
}

// Ejemplo de implementación
class SampleDevice: ConnectableDevice {
    var isConnected: Bool = false
    let deviceName: String
    let deviceId: String
    
    init(name: String, id: String) {
        self.deviceName = name
        self.deviceId = id
    }
    
    func connect() -> Bool {
        // Lógica de conexión simulada
        print("Conectando al dispositivo \(deviceName) con ID \(deviceId)")
        isConnected = true
        return true
    }
    
    func disconnect() -> Bool {
        // Lógica de desconexión simulada
        print("Desconectando del dispositivo \(deviceName)")
        isConnected = false
        return true
    }
    
    func isAvailable() -> Bool {
        // Lógica de disponibilidad simulada
        return !isConnected
    }
}