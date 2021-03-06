//
//  File.swift
//  
//
//  Created by Mihai Leonte on 20/01/2020.
//

import Foundation

struct Project {
    let name: String
    let code: String
    let subheader: String // The header under the app's name
    let status: String // In Progress or Published
    let status_css: String // Class name for the CSS style to be applied to the status
    let appIcon: String // Filename of the app's icon
    let videoFile: String
    let role: String // My Role
    let appStore_link: [String]
    let gitHub_link: String
    let technologies: [String]
    let paragraphs: [String] // Description
}

struct Projects {
    let items: [Project]
}

let projects = Projects(items: [
    .init(name: "Net Worthy",
          code: "net_worthy",
          subheader: "Smart Portfolio",
          status: "In Progress",
          status_css: "in_progress",
          appIcon: "NetWorthyLogo_in_progress.svg",
          videoFile: "mock_NetWorthy.mp4",
          role: "Sole developer",
          appStore_link: [],
          gitHub_link: "",
          technologies: ["SwiftUI", "Combine", "CoreData", "CloudKit", "IEX Cloud API"],
          paragraphs: ["See your net worth at a glance. Stocks, bonds, gold or other metals, cryptocurrencies, rent income & fixed assets.", "A good investment portfolio should include rebalancing rules. Net Worthy will make it easy to keep track of the ratios between your different asset classes and notify you only when you need to take action."]),
    
    .init(name: "Locally",
          code: "locally",
          subheader: "Your Locations Repo",
          status: "Published",
          status_css: "published",
          appIcon: "LocallyLogo.svg",
          videoFile: "mock_Locally.mp4",
          role: "Sole developer",
          appStore_link: ["https://apps.apple.com/us/app/id1488488997"],
          gitHub_link: "",
          technologies: ["SwiftUI", "UIKit", "Combine", "CoreData", "CloudKit", "MapKit", "Deep Linking"],
          paragraphs: ["Locally brings together the most popular navigation apps that you use. Maps by Apple, Google Maps, Waze, Uber, Lyft.", "Store your favorite locations in Locally and when it's time to go, select the transit type and quickly jump into your preferred navigation app."]),
    
    .init(name: "Timely HN",
          code: "timely",
          subheader: "Hacker News reader",
          status: "Published",
          status_css: "published",
          appIcon: "TimelyLogo.svg",
          videoFile: "mock_Timely.mp4",
          role: "Sole developer",
          appStore_link: ["https://apps.apple.com/us/app/id1389959690"],
          gitHub_link: "",
          technologies: ["UIKit", "Codable", "Storyboards", "Programmatic UI", "Algolia API", "DTFoundation API"],
          paragraphs: ["I wanted a better Hacker News reader experience for myself. The main feature is keeping track of the stories which were already read or simply seen, in order to filter them from the news feed.", "Besides the HN official API the app also implements the Algolia API - which offers the possibility to create custom time periods for the feeds."]),
    
    .init(name: "GoT Map Recap",
          code: "got",
          subheader: "Game of Thrones Recap",
          status: "Published",
          status_css: "published",
          appIcon: "GoTLogo.svg",
          videoFile: "mock_GoT_v2.mp4",
          role: "Developer in a team of two. My focus was on the UX implementation and map creation.",
          appStore_link: ["https://apps.apple.com/us/app/got-map-recap/id1105547119"],
          gitHub_link: "",
          technologies: ["Unity", "SQLite", "Vector graphics", "Web scraping"],
          paragraphs: ["A companion app for both the 'Game of Thrones' TV show and George R.R. Martin's original book series.",
                       "The recap feature includes full synopsis and scene transcripts for each TV episode. While the book recap is very handy while reading the book - to keep track of where the action takes places and the characters involved.",
                       "Different zoom levels populates the map with a different density of details."]),
])
