import ViperUIKitCLICore

let tool = ViperUIKitCLITool()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
