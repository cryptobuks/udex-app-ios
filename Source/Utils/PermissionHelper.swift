import UIKit
import AVFoundation

class PermissionsHelper {
  static let shared = PermissionsHelper()
  
  func performWithCameraPermission(fromController: UIViewController, action: @escaping () -> ()) {
    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .authorized {
      action()
    } else {
      AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { [weak self] granted in
        DispatchQueue.main.async {
          if granted {
            action()
          } else {
            self?.showPermissionAlert(fromController: fromController, message: "UDEX need access to camera to scan QR codes.")
          }
        }
      })
    }
  }
  
  private func showPermissionAlert(fromController: UIViewController, title: String? = nil, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: { _ in
      if let url = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url)
      }
    })
    
    alertController.addAction(settingsAction)
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    alertController.preferredAction = settingsAction
    
    fromController.show(alertController, sender: nil)
  }
  
}
