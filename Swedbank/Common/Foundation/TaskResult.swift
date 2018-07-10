//
//  DataTaskResult.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Enum describes the possible options for result of the operation.
enum TaskResult<T> {
    case success(T)
    case failure(Error)
}

