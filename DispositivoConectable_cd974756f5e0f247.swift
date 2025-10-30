import Foundation

/// Protocolo que define las capacidades básicas de un dispositivo conectable
protocol ConnectableDevice {
    /// Nombre del dispositivo
    var name: String { get }
    
    /// Estado de conexión actual
    var isConnected: Bool { get }
    
    /// Intenta conectar al dispositivo
    /// - Returns: `true` si la conexión fue exitosa, `false` en caso contrario
    func connect() -> Bool
    
    /// Desconecta del dispositivo
    /// - Returns: `true` si la desconexión fue exitosa, `false` en caso contrario
    func disconnect() -> Bool
    
    /// Verifica si el dispositivo está disponible
    /// - Returns: `true` si el dispositivo está disponible para conexión, `false` en caso contrario
    func isAvailable() -> Bool
}

/// Extensión con implementación por defecto para algunas funcionalidades
extension ConnectableDevice {
    func isAvailable() -> Bool {
        return !isConnected
    }
}