//
//  ViewExtension.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/29.
//

import SwiftUI
import PanModal
import UIKit

extension View {
    func presentModal<Content: View>(modalCase: PanModelCase, displayPanModal: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.onChange(of: displayPanModal.wrappedValue) { value in
            let topMostController = self.topMostController()
            if (value && !topMostController.isPanModalPresented) {
                if modalCase == .day {
                    DispatchQueue.main.async {
                        topMostController.presentPanModal(DaySheetController(rootView: content()))
                    }
                } else if modalCase == .location {
                    DispatchQueue.main.async {
                        topMostController.presentPanModal(LocationSheetController(rootView: content()))
                    }
                } else {
                    return
                }
            }
        }
    }
    
    func dismissModal() {
        let topController = topMostController()
        topController.dismiss(animated: true)
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
   
}

enum PanModelCase {
    case day
    case location
}

class DaySheetController<Content>: UIHostingController<Content>, PanModalPresentable where Content: View {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var cornerRadius: CGFloat {
        return 20
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(250)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(250)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.panModalSetNeedsLayoutUpdate()
    }
}

class LocationSheetController<Content>: UIHostingController<Content>, PanModalPresentable where Content: View {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var cornerRadius: CGFloat {
        return 20
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(250)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(250)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.panModalSetNeedsLayoutUpdate()
    }
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        let array = self.viewControllers
        for controller in array! {
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
}
