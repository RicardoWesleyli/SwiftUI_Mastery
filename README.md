**![GitHub Logo](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)中文版** ｜ English

"Perhaps you couldn't imagine, this book on SwiftUI programming was written by a product manager.

### Motivation

Four years ago, by a stroke of luck, I started to delve into iOS programming. Due to the company's lack of iOS developers at the time, I volunteered to assist in completing some basic functionalities of the company's iOS version application alongside my primary product responsibilities.

Back then, despite having learned programming languages like C# and C++ during my college years, and having no experience using any programming language in my professional life, I remained optimistic. With the consent of the CTO, I obtained a programming book and embarked on the journey of trial and error.

At that time, using Swift + UIKit for programming, various protocols and layout constraints made me feel overwhelmed. Each time I implemented a small feature or page, it almost took me an entire night. However, as I gradually became familiar with its syntax, I was able to implement some basic functionalities and engage in in-depth discussions with other developers on certain technical issues. This was an unexpected gain.

To be honest, from installing the official development tools and writing the first "Hello, World!" to running and testing the first pre-release version of the app in the simulator, I was both clueless and excited. The moment the project ran on the simulator, I felt I had surpassed the limits of a product manager and become a "tech-savvy" product manager.

Later, due to my strong interest in iOS programming, I began to explore Swift + SwiftUI.

SwiftUI is a new framework released by Apple at the 2019 WWDC Worldwide Developers Conference. It is rarely used in commercial product development in China, and there are very few relevant development books available domestically. Therefore, I spent a long time learning it, and as a result, lost quite a bit of hair.

For the sake of convenient learning and review in the future, I started publishing columns on SwiftUI in the Juejin technology community to record the learning process. After about half a year and updating about 150 articles in 5 columns on the platform, I was fortunate enough to become a contracted author with the Juejin technology community. Later, I was invited by the China Water Conservancy and Hydropower Press editor to write and publish this book.

And that's how this book came to be.

### Ideas and Attempts

Before preparing to write this book, I was thinking about how to make it vivid and interesting.

Although the target readers of this book are more iOS developers, computer science graduates, or other practitioners who want to learn iOS programming, I hope this book can be suitable for everyone, not just programmers.

Everyone should learn programming, and everyone can learn how to think independently and analyze and solve problems through programming.

I don't want this to be a dull book, nor do I want you to follow the content of the book and still be unable to independently develop an ideal app by the end.

When I was just starting to learn, I found many free or paid books and tutorials at home and abroad. I followed the code line by line in the project cases, but in the end, I only implemented the content in the cases and could not develop a complete app.

This is a big blow to someone who wants to achieve their ideals and ambitions through hard work.

It's not because I'm not working hard enough, or because I'm not smart enough, but because these books and materials can only teach you so much, which is a very sad thing.

My ideal book is one that enables us to develop an app that can be launched on the App Store step by step according to the book. When we encounter problems in programming, we can quickly find solutions in the corresponding sections of the book. When we finish learning the last chapter or halfway through, we can develop the app we want, not just complete the examples in the book... Of course, the knowledge points in the book should be the latest.

Therefore, this book will include basic knowledge as well as some practical examples. We will implement very small and exquisite pages and explain how to use SwiftUI, a reactive UI framework, to build our ideal country, by analyzing complex concepts in programming.

### Summary of Contents

SwiftUI is an open-source cross-platform UI framework launched by Apple, which supports iOS, MacOS, WatchOS, TvOS, and other platforms. With this framework, complex interactions and functions can be implemented with very little code, greatly improving development efficiency.

This book consists of 29 chapters, systematically explaining SwiftUI background, Swift language syntax basics, SwiftUI basic components, interactive operations, data storage, network requests, hardware devices, payment models, app launching, and other contents. Each chapter is explained in conjunction with vivid and interesting examples, enhancing the fun of the book.

Through studying this book, readers will have a comprehensive understanding of the SwiftUI framework and multi-platform development and will be able to independently develop using SwiftUI. This book is suitable for developers who are learning Swift + SwiftUI and those interested in SwiftUI to read and reference.

### About Book

#### Chapter 1: Embark on a New Experience, Your First SwiftUI Project
###### 1.1 Getting Started with Swift and SwiftUI
###### 1.2 Xcode, Your Official Development Tool
###### 1.3 Let's Create Your First SwiftUI Project
###### 1.4 A Brief Introduction to Xcode Operations and Project Structure
###### 1.5 Preview Your First Project
###### 1.6 A Simple Analysis of the View File Code
###### 1.7 Summary of This Chapter

#### Chapter 2: The Charm of Text, Utilizing Text Views
###### 2.1 Creating a New View File
###### 2.2 Formatting Text Using Modifiers
###### 2.3 More Modifiers and Usage Scenarios
###### 2.4 Using Custom Fonts in Your Project
###### 2.5 Combining Multiple Text Controls
###### 2.6 Summary of This Chapter

#### Chapter 3: Visual Communication, Utilizing Images
###### 3.1 Displaying a Local Image
###### 3.2 Formatting Images Using Modifiers
###### 3.3 More Modifiers and Usage Scenarios
###### 3.4 Utilizing SF Symbols Icon Library in Your Project
###### 3.5 Fetching an Image from the Internet
###### 3.6 Summary of This Chapter

#### Chapter 4: Layout Composition, Utilizing Stack Containers
###### 4.1 Practical Case Study: Startup Page
###### 4.2 Practical Case Study: Placeholder Page
###### 4.3 Practical Case Study: Status Display Page
###### 4.4 Tips: How to Collapse Code Blocks
###### 4.5 Summary of This Chapter

#### Chapter 5: Exploring Swift Syntax, Sharpening the Axe Before Chopping Wood
###### 5.1 Constants and Variables
###### 5.2 Data Types in Swift
###### 5.3 Operators and Usage Scenarios
###### 5.3.1 Commonly Used Operators
###### 5.3.2 Assignment Operators and Arithmetic Operators
###### 5.3.3 Ternary Operators
###### 5.3.4 Comparison Operators and Logical Operators
###### 5.3.5 Nil Coalescing Operator
###### 5.4 Summary of This Chapter

#### Chapter 6: Interactive Clicks, Utilizing Buttons
###### 6.1 Creating a Simple Button
###### 6.2 Creating a Button with Gradient Color
###### 6.3 Everything Can Be a Button
###### 6.4 Tips: Parameter Value Type Conversion
###### 6.5 Using the onTapGesture Modifier
###### 6.6 Tips: How to Rename Parameter Names in Bulk
###### 6.7 Summary of This Chapter

#### Chapter 7: Text Input, Utilizing TextFields
###### 7.1 Declaring TextField Parameters
###### 7.2 Creating a Simple TextField
###### 7.3 Formatting TextFields Using Modifiers
###### 7.4 Practical Case Study: Login Page
###### 7.5 Practical Case Study: Search Bar
###### 7.6 Tips: Implementing Keyboard Hiding
###### 7.7 Utilizing TextEditor for Multi-line Text Inputs
###### 7.8 Summary of This Chapter

#### Chapter 8: Data Presentation, Utilizing Lists
###### 8.1 Creating a Simple List
###### 8.2 Iterating Over Data in Arrays
###### 8.3 Defining Model Data Structures
###### 8.4 Displaying Data Using Model Structures
###### 8.5 Drag and Drop Sorting and Swipe Deletion
###### 8.6 Formatting List Styles Using Modifiers
###### 8.7 Summary of This Chapter

#### Chapter 9: Top Navigation, Utilizing NavigationViews
###### 9.1 Navigation Titles and Navigation Buttons
###### 9.2 Practical Case Study: Settings Page
###### 9.3 Page Navigation Based on Top Navigation
###### 9.4 Customizing Back Buttons
###### 9.5 Implementing Swipe Back Logic
###### 9.6 Summary of This Chapter

#### Chapter 10: Bottom Navigation, Utilizing TabViews
###### 10.1 Creating a Simple Bottom Navigation
###### 10.2 Formatting Bottom Navigation Using Modifiers
###### 10.3 Practical Case Study: Onboarding Page
###### 10.4 Practical Case Study: Carousel View
###### 10.5 Summary of This Chapter

#### Chapter 11: Basic Forms, Utilizing Forms
###### 11.1 Creating a Simple Form View
###### 11.2 Using Toggle Switches in Forms
###### 11.3 Using Pickers in Forms
###### 11.4 Steppers and Sliders in Forms
###### 11.5 Practical Case Study: RGB Color Palette
###### 11.6 Utilizing ColorPicker for Color Selection
###### 11.7 Summary of This Chapter

#### Chapter 12: Prompt Dialogs, Those Informative Pop-ups
###### 12.1 Practical Case Study: Content List
###### 12.2 Sheet Modal Dialog
###### 12.3 FullScreenCover Full-screen Dialog
###### 12.4 ActionSheet Option Dialog
###### 12.5 Alert Warning Dialog
###### 12.6 ContextMenu Tap-and-hold Dialog
###### 12.7 Summary of This Chapter

#### Chapter 13: Screen Expansion, Utilizing ScrollView Containers
###### 13.1 Creating a Simple Scrollable Page
###### 13.2 Practical Case Study: E-commerce Homepage - Carousel
###### 13.3 Practical Case Study: E-commerce Homepage - Quick Action Buttons
###### 13.4 Practical Case Study: E-commerce Homepage - Product Recommendations
###### 13.5 DisclosureGroup Expandable/Collapsible Views
###### 13.6 Summary of This Chapter

#### Chapter 14: Clicks, Long Presses, Drags, Zooms, Rotations
###### 14.1 Quick Overview of Gesture Modifiers
###### 14.2 TapGesture Tap Gesture
###### 14.3 LongPressGesture Long Press Gesture
###### 14.4 DragGesture Drag Gesture
###### 14.5 MagnificationGesture Zoom Gesture
###### 14.6 RotationGesture Rotation Gesture
###### 14.7 Utilizing Combined Gestures
###### 14.8 Summary of This Chapter

#### Chapter 15: Custom Colors, Crafting Your Unique Style
###### 15.1 Foreground Color
###### 15.2 Background Color
###### 15.3 Border Color
###### 15.4 Gradient Color
###### 15.5 Hexadecimal Color
###### 15.6 Summary of This Chapter

#### Chapter 16: Data Flow, Interacting Between Pages
###### 16.1 Usage of @State Property Wrapper
###### 16.2 Usage of @Binding Property Wrapper
###### 16.3 Usage of @Environment Property Wrapper
###### 16.4 Usage of @AppStorage Property Wrapper
###### 16.5 Summary of This Chapter

#### Chapter 17: Network Requests, Utilizing URLSession Framework
###### 17.1 Practical Case Study: Color Palette List
###### 17.2 Introduction to JSON Data Format
###### 17.3 Usage of URLSession Framework
###### 17.4 Usage of MVVM Architecture Pattern
###### 17.5 Tips: Implementing Random Data Display
###### 17.6 Summary of This Chapter

#### Chapter 18: Data Persistence, Utilizing FileManager Framework
###### 18.1 Practical Case Study: Note-taking App Style
###### 18.2 Usage of @AppStorage Application Storage Wrapper
###### 18.3 Usage of FileManager Local File Storage Framework
###### 18.4 Practical Case Study: Adding Note Operation
###### 18.5 Practical Case Study: Deleting Note Operation
###### 18.6 Practical Case Study: Editing Note Operation
###### 18.7 Summary of This Chapter

#### Chapter 19: Drawing Graphics, Utilizing Path and Shape
###### 19.1 Basic Shapes in SwiftUI
###### 19.1.1 Circle
###### 19.1.2 Ellipse
###### 19.1.3 Rectangle
###### 19.1.4 RoundedRectangle
###### 19.1.5 Capsule
###### 19.2 Drawing Graphics Using Path
###### 19.2.1 addLine for Drawing Lines
###### 19.2.2 addQuadCurve for Drawing Quadratic Bézier Curves
###### 19.2.3 addCurve for Drawing Cubic Bézier Curves
###### 19.2.4 addArc for Drawing Arcs
###### 19.3 Customizing Shapes Using Shape
###### 19.4 Practical Case Study: Countdown Circle
###### 19.5 Summary of This Chapter

#### Chapter 20: Exploring Device Features, Shooting, Uploading, Saving, Sharing
###### 20.1 Selecting Images from Photo Library
###### 20.1.1 Creating ImagePicker Method
###### 20.1.2 Using ImagePicker Method
###### 20.2 Capturing Images Using Camera
###### 20.2.1 Setting Selector sourceType
###### 20.2.2 Previewing Effects on Real Devices
###### 20.3 Saving Images to Local Photo Library
###### 20.3.1 Converting View to UIImage
###### 20.3.2 Displaying UIImage Model Objects
###### 20.3.3 Saving UIImage Model Objects
###### 20.4 Sharing Images to Other Platforms
###### 20.4.1 Creating ShareSheet Method
###### 20.4.2 Using ShareSheet Method
###### 20.5 Summary of This Chapter

#### Chapter 21: FaceID, Utilizing LocalAuthentication Framework
###### 21.1 Creating a Configuration Switch
###### 21.2 Creating an Unlocking Page
###### 21.3 Implementing Identity Authentication Method
###### 21.4 Configuring Permissions in Info.plist
###### 21.5 Implementing Login Identity Authentication Interaction
###### 21.6 Logic Optimization
###### 21.7 Summary of This Chapter

#### Chapter 22: Playing Sounds and Videos, Enhancing Your Sensory Experience
###### 22.1 Practical Case Study: Electronic Wooden Fish
###### 22.2 Implementing Sound Playback Method
###### 22.3 Practical Case Study: Text-to-Speech
###### 22.4 Creating a Help Tutorial Page
###### 22.5 Implementing Video Playback Method
###### 22.6 Summary of This Chapter

#### Chapter 23: Gregorian and Lunar Calendar, Formatting Dates Using DateFormatter
###### 23.1 Practical Case Study: Digital Clock
###### 23.2 Formatting Dates
###### 23.3 Usage of Chinese Calendar
###### 23.4 Summary of This Chapter

#### Chapter 24: Custom Styles, Utilizing ViewModifier Protocol
###### 24.1 Creating Custom Views
###### 24.2 Custom View Modifiers
###### 24.3 Practical Case Study: Registration Page
###### 24.4 Practical Case Study: Custom Toast Popup
###### 24.5 Knowledge Extension: Modifying Toggle Control Styles
###### 24.6 Summary of This Chapter

#### Chapter 25: Making Your App Move, Adding Animation Magic
###### 25.1 Adding Implicit Animation to Views
###### 25.2 Using Implicit Animation in Composite Views
###### 25.3 Adding Explicit Animation to Views
###### 25.4 Practical Case Study: Timer Button Group
###### 25.5 Practical Case Study: Loading Animation
###### 25.6 Practical Case Study: 3D Rotation Animation
###### 25.7 Summary of This Chapter

#### Chapter 26: CoreData and CloudKit, Better Data Management
###### 26.1 Introduction to CoreData Framework
###### 26.2 Practical Case Study: ToDo App
###### 26.2.1 Creating TodoModel Data Structure
###### 26.2.2 Creating ToDoListRow View
###### 26.2.3 Implementing toggleTodoItemCompleted Method
###### 26.2.4 Creating InputTextField View
###### 26.2.5 Implementing addTodoItem Method
###### 26.2.6 Implementing deleteTodoItem Method
###### 26.3 Creating Entity Models
###### 26.4 Creating Persistence Singleton
###### 26.5 Implementing CoreData Local Data Storage
###### 26.5.1 Using CoreData Container in Project
###### 26.5.2 Modifying addTodoItem Method
###### 26.5.3 Modifying deleteTodoItem Method
###### 26.5.4 Modifying toggleTodoItemCompleted Method
###### 26.6 Implementing iCloud Cloud Data Storage
###### 26.6.1 Adding iCloud Database Container
###### 26.6.2 Adding Background Modes Capability
###### 26.6.3 Configuring CloudKit Cloud Storage Development
###### 26.7 Summary of This Chapter

#### Chapter 27: Lightweight Interaction, Utilizing Widgets
###### 27.1 Creating Widget Projects
###### 27.2 Explaining Widget Project Files
###### 27.2.1 MyWidgetBundle File
###### 27.2.2 MyWidgetLiveActivity File
###### 27.2.3 MyWidget File
###### 27.2.4 MyWidget.intentdefinition File
###### 27.2.5 Assets.xcassets File
###### 27.3 Practical Case Study: Redirect to WeChat Scan
###### 27.4 Practical Case Study: Daily Quote
###### 27.4.1 Completing OneWord Project
###### 27.4.2 Sharing Data Using App Group
###### 27.4.3 Completing OneWordWidget Project
###### 27.5 Summary of This Chapter

#### Chapter 28: Making Your First Bucket of Gold, Adding In-App Purchases and Subscriptions
###### 28.1 Understanding App Payment Mechanisms
###### 28.1.1 Paid Purchase
###### 28.1.2 In-App Purchase
###### 28.1.3 App Subscription
###### 28.1.4 Advertising
###### 28.2 Practical Case Study: In-App Purchase Page
###### 28.3 Integrating In-App Purchase Functionality into Projects
###### 28.3.1 Creating In-App Purchase Test Files
###### 28.3.2 Referencing StoreKit Framework Files
###### 28.3.3 Implementing In-App Purchase Functionality
###### 28.3.4 Implementing Restore Purchase Functionality
###### 28.4 Summary of This Chapter

#### Chapter 29: App Store Deployment, Releasing Your First App
###### 29.1 AppIcon Application Icon
###### 29.2 Store Preview Images
###### 29.3 Technical Support Website URL
###### 29.4 Privacy Policy Website URL
###### 29.5 Agreement, Tax, and Banking Settings
###### 29.6 Formal Submission and Deployment
###### 29.7 Summary of This Chapter


### Errata and Feedback

As this is the first time I have published a book, my writing skills may be a bit immature, so there may be some errors or unclear parts in the book. While asking for your understanding, I also welcome corrections and feedback. All the examples in the book can be downloaded from GitHub (https://github.com/RicardoWesleyli/SwiftUI.git). If you have any valuable ideas and suggestions, you can also directly send an email to 16620164429@163.com. Looking forward to meeting you.

### Acknowledgments

Thanks to Miss Jiang Peiqi, who has always supported me. Your Mr. Li Zhiwei has finished writing this book~

Thanks to Mr. Wang Xinyu, the editor of the Water Conservancy and Hydropower Press, for the encouragement and help he gave me during the writing process, which enabled me to complete all the manuscripts smoothly.

Finally, thanks to my parents, Qi Qi's parents, and my sister who is about to enter the workplace, as well as Mr. Zhang Yong, Mr. Ye Yongcheng, and Mr. Xu Zhi, who have guided me on the road of life. Thank you for your support and help, lighting up the future path for me.

I dedicate this book to my dearest family and many friends who love iOS!"
