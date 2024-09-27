//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by Daniel Alejandro Esquivel Correa on 27/09/24.
//

import SwiftUI
import _MapKit_SwiftUI

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center:
                CLLocationCoordinate2D(latitude: 6.148732, longitude: -75.390734),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    @State var places: [Place] = []
    @State var showPopUp: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var isFav: Bool = false
    @State var showSheet: Bool = false
    
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map { PresentationDetent.fraction($0)}
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            var color = if place.fav {
                                Color.yellow
                            } else {
                                Color.black
                            }
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay {
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(16)
                        Spacer()
                    }
                }
            }
            
            if showPopUp != nil {
                let view = VStack {
                    Text("Añadir localización").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text:  $name).padding(.bottom, 8)
                    Toggle("¿Es un lugar favorito?", isOn: $isFav)
                    Spacer()
                    Button("Guardar") {
                        savePlace(
                            name: name,
                            fav: isFav,
                            coordinates: showPopUp!
                        )
                        clearForm()
                    }
                }
                withAnimation {
                    CustomDialog(
                        closeDialog: {
                            showPopUp = nil
                        },
                        onDismissOutside: false,
                        content: view
                    )
                }
            }
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places) { place in
                        let color = if place.fav {
                            Color.yellow.opacity(0.5)
                        } else {
                            Color.black.opacity(0.5)
                        }
                        VStack {
                            Text(place.name).font(.title3).bold()
                        }.frame(width: 100, height: 50)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(color, lineWidth: 1)
                            }.shadow(radius: 5)
                            .padding(.horizontal, 8)
                            .onTapGesture {
                                animateCamera(coordinates: place.coordinates)
                                showSheet = false
                            }
                    }
                }
            }.presentationDetents(Set(height))
        }.onAppear {
            loadPlaces()
        }
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D) {
        withAnimation{
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center:
                        coordinates,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            )
        }
    }
    
    func savePlace(name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
        savePlaces()
    }
    
    func clearForm(){
        name = ""
        isFav = false
        showPopUp = nil
    }
}

#Preview {
    FavPlaces()
}

extension FavPlaces {
    func savePlaces(){
        if let encodeData = try? JSONEncoder().encode(places) {
            UserDefaults.standard.set(encodeData, forKey: "places")
        }
    }
    
    func loadPlaces() {
        if let savedPlaces = UserDefaults.standard.data(forKey: "places"),
           let decodedPlaces = try? JSONDecoder().decode([Place].self, from: savedPlaces) {
            places = decodedPlaces
        }
    }
}
