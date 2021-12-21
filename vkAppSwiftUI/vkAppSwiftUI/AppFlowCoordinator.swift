//
//  AppFlowCoordinator.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 20.12.2021.
//

//import Combine
//import SwiftUI
//
//class AppFlowCoordinator: NSObject {
//
//    let loginViewModel: LoginViewModel = LoginViewModel()
//    var navigationController: UINavigationController!
//
//    private var disposeBag: Set<AnyCancellable> = []
//
//    override init() {
//        super.init()
//        let loginView = LoginView(viewModel: loginViewModel, appCoordinator: self)
//        let loginViewController = UIHostingController(rootView: loginView)
//
//        self.navigationController = UINavigationController(rootViewController: loginViewController)
//    }
//
//    func start() {
//        self.loginViewModel.$isUserLoggedIn
//            .sink { [unowned self ] isLoggedIn in
//
//                if isLoggedIn == false {
//                    self.navigationController.popToRootViewController(animated: true)
//                } else {
//                    let viewController = MainViewController(nibName: nil, bundle: nil)
//                    self.navigationController.pushViewController(viewController, animated: true)
//                }
//
//            }
//            .store(in: &disposeBag)
//    }
//
//    func showSettings() {
//        let viewController = MainViewController(nibName: nil, bundle: nil)
//        viewController.view.backgroundColor = .green
//        self.navigationController.present(viewController, animated: true)
//    }
//}
