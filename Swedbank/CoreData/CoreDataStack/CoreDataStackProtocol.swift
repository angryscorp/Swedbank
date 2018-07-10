//
//  CoreDataStackProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

/// Provides the basic functionality of Core Data Stack.
protocol CoreDataStackProtocol {

    /// Provides access to Main Persistent Container of the application.
    var persistentContainer: NSPersistentContainer { get }

}
