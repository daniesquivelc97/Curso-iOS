//
//  MapExample.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 22/09/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.148845, longitude: -75.3931528),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    )
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position){
                    Marker("Aeropuerto", coordinate: CLLocationCoordinate2D(latitude: 6.1667493, longitude: -75.4370644))
                }.mapStyle(.hybrid(elevation: .realistic, showsTraffic: true)).onMapCameraChange(frequency: .continuous) { context in
                    print("Estamos en: \(context.region)")
                }.onTapGesture { coor in
                    if let coordinates = proxy.convert(coor, from: .local) {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                            )
                        )
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Button("Ir al sur") {
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 6.1667493, longitude: -75.4370644),
                                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                                )
                            )
                        }
                    }.padding(32).background(.white)
                    
                    Button("Ir al norte") {
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 6.148845, longitude: -75.3931528),
                                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                                )
                            )
                        }
                        
                    }.padding(32).background(.white)
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
