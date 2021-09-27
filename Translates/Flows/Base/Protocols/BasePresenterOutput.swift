//
//  BasePresenterOutput.swift
//  Translates
//
//  Created by Sergey Nazarov on 25.09.2021.
//  
//

protocol BasePresenterOutput: AnyObject {
    
    func onAnimating(isStart: Bool)
    func showErrorDialog(title: String?, message: String?, onButton: CompletionBlock?)
    func showQuetionDialogQuetion(title: String, message: String, onYes: CompletionBlock?, onNo: CompletionBlock?)
   
}

extension BasePresenterOutput {
    
    func showErrorDialog(
        title: String? = nil,
        message: String? = nil,
        onButton: CompletionBlock? = nil) {
        
        showErrorDialog(title: title, message: message, onButton: onButton)
    }
    
    func showQuetionDialogQuetion(
        title: String,
        message: String,
        onYes: CompletionBlock?,
        onNo: CompletionBlock?) {
        showQuetionDialogQuetion(
            title: title,
            message: message,
            onYes: onYes,
            onNo: onNo
        )
    }
}

