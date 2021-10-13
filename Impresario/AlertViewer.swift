
import Foundation
import SwiftUI

class AlertViewer {
    
    static func showAlertWithActions(message: String, completion: @escaping () -> Void) -> Alert {
        
        let alert = Alert(title: Text("Important message"),
                          message: Text("\(message)"),
                          primaryButton: .default(
                            Text("Yes"),
                            action: {
                                completion()
                            }
                          ),
                          secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {}
                          )
        )
        return alert
    }
    
    static func showAlertWithNoActions(message: String, completion: @escaping () -> Void) -> Alert {
        
        let alert = Alert(title: Text("Important message"),
                          message: Text("\(message)"),
                          dismissButton: .default(Text("OK"),action: {completion()})
        )
        
        return alert
    }
}
