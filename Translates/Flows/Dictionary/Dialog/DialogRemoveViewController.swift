//
//  DialogRemoveViewController.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import UIKit

/**
Отчистить БД
*/
class DialogRemoveViewController: BaseViewController, DialogRemoveAssemblable {

    var presenter: DialogRemovePresenterInput?
    
    var onCompletion: CompletionBlock?
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.text = "you_need_remove_all".localized
        return lbl
    }()
    
    var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()
    
    var animatedView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    var shapeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 8
        sv.distribution = .fillEqually
        return sv
    }()
    
    private let yesBtn: TranslateButton = {
        let btn = TranslateButton()
        btn.setStyle(with: .yes(title: "yes".localized))
        return btn
    }()
    
    private let cancelBtn: TranslateButton = {
        let btn = TranslateButton()
        btn.setStyle(with: .cancel(title: "cancel".localized))
        return btn
    }()
    
    private var animatedViewBottomOffset: CGFloat = 0.0
    private var swipeDismissInteractor: SwipeInteractionController?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        swipeDismissInteractor?.animatedViewBottomOffset = animatedViewBottomOffset
    }
    
    override func initUI() {
        self.view.addSubviews(backgroundView, animatedView)
        animatedView.addSubviews(shapeView, titleLbl, stackView)
       
        stackView.addArrangedSubview(yesBtn)
        stackView.addArrangedSubview(cancelBtn)
        
        configureSwipeAction()
    }
    
    override func initConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview().offset(0)
        }
        
        shapeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(5)
            make.width.equalTo(44)
        }
        
        animatedView.snp.makeConstraints { make in
            make.height.equalTo(256)
            make.left.right.equalToSuperview()
            self.animatedViewBottomOffset = Helper.safeAreaInsets.bottom >= 35 ? Helper.safeAreaInsets.bottom + 50 : 50
            make.bottom.equalToSuperview().offset(self.animatedViewBottomOffset)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(44)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
        }
        
        yesBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }

    private func configureSwipeAction() {
        swipeDismissInteractor = SwipeInteractionController(
            viewController: self,
            animatedView: animatedView,
            progressEnd: 0.3
        )
        swipeDismissInteractor?.animatedViewBottomOffset = animatedViewBottomOffset
        swipeDismissInteractor?.velocityThreshold = 1500
        transitioningDelegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHolder))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapHolder() {
        self.onCompletion?()
    }
    
    override func initListeners() {
        cancelBtn.touchUp = { [weak self] _ in
            self?.onCompletion?()
        }
        
        yesBtn.touchUp = { [weak self] _ in
            self?.presenter?.removeAllWords()
            self?.onCompletion?()
        }
    }

    deinit {
        print("DialogRemoveViewController is deinit")
    }
}

// MARK: - SelectMonthYearPresenterOutput

extension DialogRemoveViewController {
    
// TODO: implement output presentation methods
    
}

extension DialogRemoveViewController: ModalAnimatable {
    var animatedBackgroundView: UIView {
        backgroundView
    }
    
    var animatedMovingView: UIView {
        animatedView
    }
}

extension DialogRemoveViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        ModalPresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        ModalDismissAnimator()
    }
    
    func interactionControllerForDismissal(
        using animator: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        guard let interactionInProgress = swipeDismissInteractor?.interactionInProgress else {
            return nil
        }
        return interactionInProgress ? swipeDismissInteractor : nil
    }
}
