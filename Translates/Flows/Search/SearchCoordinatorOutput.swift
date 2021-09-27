//
//  AuthorizationCoordinatorOutput.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

protocol SearchCoordinatorOutput: AnyObject {
    
    var finishFlow: CompletionBlock? { get set }
}
