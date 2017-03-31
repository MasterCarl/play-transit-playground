//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
import MapKit
//#-end-hidden-code

/*:
 # Putting stops on a map
 ### Creating objects
 
 Now, let's take a look at all the stops on a route. To show their positions on a map, we have to convert them to `Stop` objects that can be shown on a map.
 > Notice the `MKAnnotation` in the first line of the class declaration? This is called a *protocol* that our `Stop` class conforms to - it's like a contract that states what a class has to provide. To be a **M**ap**K**it **Annotation**, first of all, our `Stop` needs to have a `coordinate`.
 */
class Stop: NSObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    
    init(json: [String: Any]) {
        let latitude = json["lat"] as! Double
        let longitude = json["lon"] as! Double
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = json["title"] as? String
    }
}

let url = URL(string: /*#-editable-code*/"http://restbus.info/api/agencies/sf-muni/routes/E"/*#-end-editable-code*/)  // Also available: The F line

//#-hidden-code
let json: [String: Any]
if let data = loadSync(contentsOf: url) {
    json = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
} else {
    json = [String: Any]()
}

//#-end-hidden-code

//: ### Transforming the array
//: First, we have to cast the `"stops"` value to an array.
let stopsJson = json["stops"]
    as! [ [String: Any] ]
//: Then, we create an empty array to hold our `Stop` objects.
var stops = [Stop]()
//: Just as a first example, this is how you initialize the first object.
let firstStop = Stop(json: stopsJson[0])
//#-editable-code
stops.append(firstStop) // Feel free to delete this line
//#-end-editable-code

/*:
 So, now we have the first stop that we can put on our map. But what about all the other ones? Let's go through the array and convert them one by one.
 Here's how to do it:
 1. Create a `Stop` object
 2. Add it to the list of stops by calling `stops.append(stop)`.
 */
//#-code-completion(identifier, show, stops, append(), Stop(json: [String: Any]), singleStopJson, stop)
//#-code-completion(keyword, show, let)
//#-editable-code
for singleStopJson in stopsJson {
    // nothing so far
    
}
//#-end-editable-code



//: ### Adding them to the map
//: This is fairly straightforward.
let mapView = MKMapView()
//#-hidden-code
let delegate = MapViewDelegate()
mapView.delegate = delegate     // Aaargh. This is the second time I've had delegates disappear because they were held in weak variables...
PlaygroundPage.current.liveView = mapView
let sanFrancisco = mapView.regionThatFits(MKCoordinateRegion(center: firstStop.coordinate, span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)))
mapView.setRegion(sanFrancisco, animated: false)
//#-end-hidden-code

mapView.showAnnotations(stops, animated: true)
//#-hidden-code
mapView.camera.altitude *= 2.0
//#-end-hidden-code

/*:
 ### Visualizing the route
 Now, let's draw a line to show how the stops are connected. To do that, we have to extract just the coordinates from our stops.
 > To transform an array of `Stop` Objects into another array, we can use a `for _ in` loop as before. As a more concise alternative, there is the `map` function. It takes another function as a parameter (inside the parentheses) and calls it with each element. The return values make up the new array. Why don't you try and apply this concept to the loop from before?
 */
let coordinates = stops.map({ (stop: Stop) -> CLLocationCoordinate2D in
    return stop.coordinate
})

//: It is important that we keep the points in the right order. Append `.shuffled()` to the next line to see why.
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, shuffled())
//#-editable-code
let orderedCoordinates = coordinates
//#-end-editable-code
let polyline = MKPolyline(coordinates: orderedCoordinates)
mapView.add(polyline, level: .aboveRoads)
