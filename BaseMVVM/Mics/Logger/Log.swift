//
//  Log.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 30/11/2022.
//
import Foundation
import XCGLogger

let log = XCGLogger.default

func setupLogger() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss.SSSSZ"
    dateFormatter.locale = Locale.current
    log.dateFormatter = dateFormatter
    log.levelDescriptions[.verbose] = "🗯Verbose"
    log.levelDescriptions[.debug]   = "💡Debug"
    log.levelDescriptions[.info]    = "📝Info"
    log.levelDescriptions[.warning] = "⚠️Warning"
    log.levelDescriptions[.error]   = "🐞Error"
    log.levelDescriptions[.severe]  = "🌈Severe"
    log.setup(level: .verbose, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil)
}
