//
//  File.swift
//  
//
//  Created by Mihai Leonte on 20/01/2020.
//

import Foundation

struct NavigationItem {
    let iconPath: String
    let caption: String
    let destinationURL: URL
}

struct Navigation {
    let items: [NavigationItem]
}

let navigation = Navigation(
    items: [
        .init(
            iconPath: "/social/twitter.svg",
            caption: "Follow me",
            destinationURL: URL(string: "https://twitter.com/leonte_dev")!
        ),
        .init(
            iconPath: "/social/github.svg",
            caption: "See my projects",
            destinationURL: URL(string: "https://github.com/leontedev")!
        ),
        .init(
            iconPath: "/social/linkedin.svg",
            caption: "View my profile",
            destinationURL: URL(string: "https://www.linkedin.com/in/doru-mihai-leonte-7a30b730/")!
        ),
        .init(
            iconPath: "/social/CV.svg",
            caption: "Read my résumé",
            destinationURL: URL(string: "/CV_Mihai_Leonte_iOS_Dev.pdf")!
        ),
    ]
)
