import Foundation
import Files
import ShellOut
import Publish

struct StringReplace {
    /// Values to replace.
    let replacements: [(source: String, target: String)]
    // Paths to evaluate in `Output/` directory.
    let filePaths: Set<String>
    
    func replace(in file: File) throws {
        try replacements.forEach { (source, target) in
            let newContent = try shellOut(to: "sed 's/${\(source)}/\(target)/g' \(file.path)")
            try file.write(newContent)
        }
    }
}

extension PublishingStep {
    static func stringReplace(_ stringReplace: StringReplace) -> Self {
        step(named: "String replace") { context in
            try stringReplace.filePaths.forEach { filePath in
                let outputFolder = try context.folder(at: Path("Output"))
                let file = try outputFolder.file(at: filePath)
                try stringReplace.replace(in: file)
            }
        }
    }
}
