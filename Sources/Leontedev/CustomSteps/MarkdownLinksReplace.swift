import Foundation
import Files
import Publish

extension PublishingStep {
    static func moveZettelkastenToNotes() -> Self {
        step(named: "Making a copy of the Zettelkasten to notes") { context in
            let notesFolder = try context.folder(at: Path("Content/notes"))
            let zettelFolder = try context.folder(at: Path("Content/Zettelkasten"))
            let zettelFiles = zettelFolder.files
            for file in zettelFiles {
                try file.copy(to: notesFolder)
            }
        }
    }
    
    static func rewriteMarkdownLinks() -> Self {
        step(named: "Replacing local .md [[links]] with relative path [links](/notes/links)") { context in
            let notesFolder = try context.folder(at: Path("Content/notes"))
            let noteFiles = notesFolder.files
            for file in noteFiles {
                let chars = Array(try file.readAsString())
                var output: String = ""
                var isCapturingLinkName = false
                var linkName = ""

                for (index, char) in chars.enumerated() {
                    if isCapturingLinkName {
                        if char != "]" {
                            linkName.append(char)
                        } else if chars[index-1] == "]" {
                            isCapturingLinkName = false
                            if let newLink = linkName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                                output += "[\(linkName)](/notes/\(newLink))"
                            } else {
                                output += "[\(linkName)](/notes/\(linkName))"
                            }
                            
                            linkName = ""
                        }
                    } else if char == "[" {
                        if index > 0 && chars[index-1] == "[" {
                            isCapturingLinkName = true
                            output.removeLast()
                        } else {
                            output.append(char)
                        }
                    } else {
                        output.append(char)
                    }
                }
                
                try file.write(output)
            }
        }
    }
    
    static func deleteNotes() -> Self {
        step(named: "Delete newly generated .md files in Content\notes") { context in
            let notesFolder = try context.folder(at: Path("Content/notes"))
            let noteFiles = notesFolder.files
            for file in noteFiles {
                try file.delete()
            }
        }
    }
}
