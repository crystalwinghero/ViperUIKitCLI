//
//  ViperUIKitCLITool.swift
//  
//
//  Created by Buzzwoo MBP on 9/9/21.
//

import Foundation
import Files

public final class ViperUIKitCLITool {
    private let arguments: [String]
    
    enum Error : Swift.Error {
        case invalidArguments
        case invalidModuleName
        case failedToCreateFile
    }
    
    enum ArgOption : String {
        case help = "--help"
        case table = "--table"
    }

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() throws {
        guard arguments.count > 1 else {
            try self.handle(.help, name: nil)
            return
        }
        if let option = ArgOption(rawValue: arguments[1]) {
            try self.handle(option, name: arguments.last)
        } else if let option = ArgOption(rawValue: arguments.last ?? "") {
            try self.handle(option, name: arguments[1])
        } else {
            try self.handle(nil, name: arguments[1])
        }
    }
    
    private func handle(_ argOption : ArgOption?, name : String?) throws {
        var isTable : Bool? = nil
        switch argOption {
        case .help:
            self.showHelp()
        case .none:
            isTable = false
            fallthrough
        case .table:
            guard name != argOption?.rawValue else {
                self.showHelp()
                return
            }
            try self.createTemplate(name ?? "", isTable ?? true)
        }
    }
    
    private func showHelp() {
        let instruction = """
Run:
viper-uikit-cli <ModuleName>.<ViperName> #for normal UIViewController
viper-uikit-cli --table <ModuleName>.<ViperName> #for UIViewController with UITableView embeded
"""
        print(instruction)
    }
    
    private func createTemplate(_ name : String, _ isTableView : Bool) throws {
        let sub = name.split(maxSplits: 1, omittingEmptySubsequences: true, whereSeparator: { $0 == "." })
        guard sub.count == 2 else {
            throw Error.invalidModuleName
        }
        let module = "\(sub[0])"
        let e = "\(sub[1])"
        do {
            let current = Folder.documents ?? Folder.current
            print("Target path: \(current.path)")
            print("Creating folder: \(e) ...")
            let folder = try current.createSubfolder(named: e)
            print("Creating VIPER file...")
            let viper = try folder.createFile(named: "\(e)Viper.swift")
            try viper.write(Template.viper(e))
            print("Creating View folder...")
            let viewFolder = try folder.createSubfolder(named: "ViewControllers")
            print("Creating ViewController...")
            let vc = try viewFolder.createFile(named: "\(e)ViewController.swift")
            try vc.write(Template.view(e, isTableView))
            print("Creating nib file...")
            let xib = try viewFolder.createFile(named: "\(e)ViewController.xib")
            if isTableView {
                try xib.write(Template.xibTable(e, module))
            } else {
                try xib.write(Template.xib(e, module))
            }
            print("Creating Interactor file...")
            let interactor = try folder.createFile(named: "\(e)Interactor.swift")
            try interactor.write(Template.interactor(e))
            print("Creating Presenter file...")
            let presenter = try folder.createFile(named: "\(e)Presenter.swift")
            try presenter.write(Template.presenter(e, isTableView))
            print("Creating Entity file...")
            let entity = try folder.createFile(named: "\(e)Entity.swift")
            try entity.write(Template.entity(e))
            print("Creating Router file...")
            let router = try folder.createFile(named: "\(e)Router.swift")
            try router.write(Template.router(e))
            print("Done!")
        } catch {
            throw Error.failedToCreateFile
        }
    }
}
