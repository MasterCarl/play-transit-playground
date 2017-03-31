//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
//#-end-hidden-code

/*:
# About me
 Hi, I'm Carl! I'm currently doing my Bachelor's in IT Systems Engineering in Potsdam, Germany.
 ### My apps
 During my studies, I got started with iOS development as a student research assistant, developing an app that enables safe and redundant file storage in the cloud.
 
 I've also built iOS apps at various hackathons. Among them were
 - a grocery shopping assistant that puts grocery items on your **Wunderlist** when you scan the empty boxes with your app
 - a video viewer that shows two **Dubsmash** videos side-by-side and lets the user vote on which is better
 - an e-scooter sharing app for **Coup** that suggests optimal pickup locations and routes for a better fleet distribution.
 
 ### What they have in common
 Besides having an attractive UI to impress the jury, every app needed to communicate with a service to get its data - authentication, user videos, scooter locations, product names, file chunks - and to send the results back.
 
 In this playground, I'm going to illustrate the basics of making API requests, parsing the data and doing something with the result. These are the fundamental building blocks to creating an awesome transit app - **Play Transit**.
 > There's a lot of force unwrapping used here (i.e., we just assume there will be a value when there could be none and hope for the best). While this might be a bad idea in a production app, causing a crash, it's what we've always done at hackathons because that's just something you can worry about later. **May the force be with you!**
 */
//: [Next](@next)