import Foundation
import MapKit

public extension MKPolyline {
    public convenience init(coordinates coords: Array<CLLocationCoordinate2D>) {
        let unsafeCoordinates = UnsafeMutablePointer<CLLocationCoordinate2D>.allocate(capacity: coords.count)
        unsafeCoordinates.initialize(from: coords)
        self.init(coordinates: unsafeCoordinates, count: coords.count)
        unsafeCoordinates.deallocate(capacity: coords.count)
    }
}

public class MapViewDelegate: UIViewController, MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            // draw the track
            let polyLineRenderer = MKPolylineRenderer(overlay: polyline)
            polyLineRenderer.strokeColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
            polyLineRenderer.lineWidth = 2.0
            
            return polyLineRenderer
        }
        
        return MKOverlayRenderer()
    }
}
