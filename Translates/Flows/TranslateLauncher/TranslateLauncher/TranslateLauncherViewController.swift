//
//  TranslateLauncherViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

import UIKit
import Lottie

/**
Лаунчер
 */
class TranslateLauncherViewController: BaseViewController, TranslateLauncherAssemblable {
    
    var presenter: TranslateLauncherPresenterInput?
    
    var onCompletion: CompletionBlock?
    
    private var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func initUI() {
        
        let animation = Animation.named("book-with-bookmark")

        // Load animation to AnimationView
        animationView = AnimationView(animation: animation)
        animationView.loopMode = .playOnce
       
        view.addSubview(animationView)
 
    }
    
    override func initConstraints() {
        animationView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32)
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(256)
        }
    }
    
    override func initListeners() {
        animationView.play { [weak self] _ in
            self?.onCompletion?()
        }
        
    }

    deinit {
        print("TranslateLauncherViewController is deinit")
    }
}

// MARK: - TranslateLauncherPresenterOutput

extension TranslateLauncherViewController {
    
// TODO: implement output presentation methods
    
}
