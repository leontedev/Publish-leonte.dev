import Publish
import Plot


extension Theme {
    static func leontedevTheme(using navigation: Navigation, with projects: Projects) -> Self {
        Theme(
            htmlFactory: LeontedevHTMLFactory(navigation: navigation, projects: projects),
            resourcePaths: [
                "Theme/styles.css",
                "Theme/fonts/SourceSansPro-Bold.ttf",
                "Theme/fonts/SourceSansPro-Regular.ttf",
                "Theme/fonts/SourceCodePro-Regular.ttf",
            ]
        )
    }
}

private struct LeontedevHTMLFactory<Site: Website>: HTMLFactory {
    let navigation: Navigation
    let projects: Projects
    
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                
                // Projects
                .div(
                    .class("index page wrapper content clearfix "),
                    .div(
                        .class("section-header float-container"),
                        .h1("👨‍💻 Projects")
                    ),
                    .div(
                        .class("projects-ul"),
                        .indexProjectList(for: projects.items, on: context.site)
                    )
                ),
                

                // Articles
                .div(
                    .class("wrapper content clearfix"),
                    .div(
                        .class("section-header float-container"),
                        .h1("🚀 Latest articles")
                    ),
                    .itemList(
                        for: context.allItems(
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site
                    )
                ),
                
                .br(),
                .br(),
                
                // About section at the end
                .div(
                    .class("wrapper contentFooter clearfix"),
                    .id("aboutMeAnchor"),
                    .img(.class("avatar"), .src("avatar.jpg")),
                    .div(
                        .class("introduction"),
                        .contentBody(index.body)
                    ),
                    .navigationMenu(navigation)
                    
                ),
                .br(),
                .br(),
                .footer(for: context.site)
            )
        )
    }
    
    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(
                .header(for: context, selectedSection: section.id),
                .wrapper(
                    .h2(.text(section.title)),
                    .itemList(for: section.items, on: context.site)
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .header(for: context, selectedSection: item.sectionID),
                .wrapper(
                    .article(
                        .div(
                            .class("content"),
                            .contentBody(item.body)
                        ),
                        .br(),
                        .br(),
                        .p(.text("Published on \(item.date)")),
                        .span("Tagged with: "),
                        .tagList(for: item, on: context.site)
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        //notSupportedByThisTheme()
        
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .if(page.path != "projects",
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(.contentBody(page.body)),
                    .footer(for: context.site)
                )
            ),
            .if(page.path == "projects",
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .div(
                            .class("projectListSpacing"),
                            .projectList(for: projects.items, on: context.site)
                        )
                    ),
                    .footer(for: context.site)
                )
            )
            
            // About section at the end
//            .div(
//                .class("wrapper contentFooter clearfix"),
//                .img(.class("avatar"), .src("avatar.jpg")),
//                .div(
//                    .class("introduction"),
//                    .contentBody(index.body)
//                ),
//                .navigationMenu(navigation)
//
//            )
            
        )
        
        
    }
    
    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(
                    .h1("Browse all tags"),
                    .ul(
                        .class("all-tags"),
                        .forEach(page.tags.sorted()) { tag in
                            .li(
                                .class("tag"),
                                .a(
                                    .href(context.site.path(for: tag)),
                                    .text(tag.string)
                                )
                            )
                        }
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .header(for: context, selectedSection: nil),
                .wrapper(
                    .h1(
                        "Tagged with ",
                        .span(.class("tag"), .text(page.tag.string))
                    ),
                    .a(
                        .class("browse-all"),
                        .text("Browse all tags"),
                        .href(context.site.tagListPath)
                    ),
                    .itemList(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site
                    )
                ),
                .footer(for: context.site)
            )
        )
    }
    
    private func notSupportedByThisTheme() -> HTML { HTML() }
    private func notSupportedByThisTheme() -> HTML? { nil }
}

private extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    static func header<T: Website>(
        for context: PublishingContext<T>,
        selectedSection: T.SectionID?
    ) -> Node {
        let sectionIDs = T.SectionID.allCases
        
        return .header(
            .div(
                .class("wrapper"),
                //.a(.class("site-name"), .href("/"), .text(context.site.name)),
                .a(.class("site-name"), .href("/"), .img(.class("logo"), .src("/buildLogo_v3.png"))),
                
                .h4(.text(context.site.description)),
                
                //.if(sectionIDs.count > 1,
                .nav(
                    .ul(
                        .li(.a(
                            .href("/"),
                            .text("Home")
                        )),
                        .forEach(sectionIDs) { section in
                            .li(
                                .class(section == selectedSection ? "selected" : ""),
                                .a(
                                    .href(context.sections[section].path),
                                    .text(context.sections[section].title)
                            ))
                        },
                        .li(
                            //.class(context.site.  page.path == "projects" ? "selected" : ""),
                            .a(
                            .href("/projects"),
                            .text("Projects")
                        )),
                        .li(.a(
                            .href("/#aboutMeAnchor"),
                            .text("About")
                            ))
                    )
                )
                //)
                
            )
        )
    }
    
    static func navigationMenu(_ navigation: Navigation) -> Node {
        return .ul(
            .class("navigation-items-container"),
            .forEach(navigation.items) { navigationItem in
                .li(
                    .class("navigation-item"),
                    .a(
                        .href(navigationItem.destinationURL),
                        .div(
                            .img(.src(navigationItem.iconPath)),
                            .text(navigationItem.caption)
                        )
                    )
                )
            }
        )
    }
    
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                        )),
                    .tagList(for: item, on: site),
                    .p(.text(item.description))
                    ))
            }
        )
    }
    
    // Projects Page
    
    static func projectList<T: Website>(for items: [Project], on site: T) -> Node {
        return .div(
            .forEach(items) { item in
                .div(
                    .class("project-row"),
                    .div(
                        .class("project-column-left"),
                        .div(
                            .class("video"),
                            .div(
                                .class("video-inner"),
                                .video(
                                    .source(
                                        .src("https://www.leonte.dev/\(item.videoFile)"),
                                        .attribute(named: "type", value: "video/mp4")
                                    ),
                                    .attribute(named: "autoplay"),
                                    .attribute(named: "loop"),
                                    .attribute(named: "muted"),
                                    //.attribute(named: "controls"),
                                    .attribute(named: "playsinline")
                                )
                            )

                            //.img(.src("/\(item.videoFile)"))
                        )
                        
                    ),
                    .div(
                        .class("project-column-right"),
                        .div(
                            .class("app-row"),
                            .div(
                                .class("app-column-left"),
                                .img(.id(item.code), .class("app_icon"),.src("/\(item.appIcon)"))
                            ),
                            .div(
                                .class("app-column-right"),
                                .h2(.class("app_name"),.text(item.name)),
                                .h6(.class("app_header"), .text(item.subheader))
                            )
                        ),
                        .div(
                            .class("app_description"),
                            .forEach(item.paragraphs) { paragraph in
                                .p(.text(paragraph))
                            },
                            .h4(.text("My Role")),
                            .p(.text(item.role)),
                            .h4(.text("Technologies")),
                            .ul(.class("tech-list"), .forEach(item.technologies) { tech in
                                .li(
                                    //.class("tag"),
                                    .text(tech)
                                    )
                            }),
                            
                            // App Store Link
                            .forEach(item.appStore_link) { link in
                                .a(
                                    .img(.class("app_download"),.src("/download.svg")), .href(link)
                                )
                            },
                            .br()
                        )
                    )
                )
            }
        )
    }
    
    // Index Page projects list
    
    static func indexProjectList<T: Website>(for items: [Project], on site: T) -> Node {
        return .ul(
            .class("ul-project-container"), //compact grid latest item-list
            .forEach(items) { item in
                .li(
                    .class("li-project-item"),
                    .a(
                        .href("/projects#\(item.code)"),

                        .div(
                            .img(.src(item.appIcon)),
                            .br(),
                            .text(item.name),
                            .p(
                                .class("appSubheader"),
                                .text(item.subheader)
                            )
                        )
                    )
                )
            }
        )
    }
    
    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class("tag-list"), .forEach(item.tags) { tag in
            .li(.a(
                .href(site.path(for: tag)),
                .text(tag.string)
                ))
            })
    }
    
    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Written in Swift. Made with "),
                .a(
                    .text("Ink"),
                    .href("https://github.com/johnsundell/ink")
                ),
                .text(", "),
                .a(
                        .text("Plot"),
                        .href("https://github.com/johnsundell/plot")
                ),
                .text(", "),
                .a(
                        .text("Splash"),
                        .href("https://github.com/johnsundell/splash")
                ),
                .text(" & "),
                .a(
                        .text("Publish"),
                        .href("https://github.com/johnsundell/publish")
                ),
                .text(".")
            ),
            .p(
                .text("©2020 Mihai Leonte")
            ),
            .p(
                .a(.class("rss"), .text("RSS"), .href("/feed.rss"))
            )
        )
    }
}
