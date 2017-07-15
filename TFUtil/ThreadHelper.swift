//
//  ThreadHelper.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/4.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation

extension DispatchQueue {
    // This method will dispatch the `block` to self.
    // If `self` is the main queue, and current thread is main thread, the block
    // will be invoked immediately instead of being dispatched.
    func safeAsync(_ block: @escaping ()->()) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            async { block() }
        }
    }
}
