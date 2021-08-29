
import Foundation
import SwiftUI

class AlertViewer {
    
    static func showAlertWithActions(message: String, completion: @escaping (() -> Void)) -> Alert {
        
        let alert = Alert(title: Text("Important message"),
                          message: Text("\(message)"),
                          primaryButton: .default(
                            Text("OK"),
                            action: {
                                completion()
                            }
                          ),
                          secondaryButton: .default(
                            Text("Cancel"),
                            action: {
                            }
                          )
        )
        return alert
    }
    
    static func showAlertWithNoActions(message: String) -> Alert {
        
        let alert = Alert(title: Text("Important message"),
                          message: Text("\(message)"),
                          dismissButton: .default(Text("OK"))
        )
        
        return alert
    }
}
