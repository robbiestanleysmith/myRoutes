import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 13,
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    let a = 0;
    let b = 2;

    // until b = array.length do this
    // within the loop add 1 to a and 1 to b
    const markersarray = this.markersValue.slice(0, 2)
    console.log(markersarray)
    this.#fetchRoute(markersarray)
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();

    // Extend the 'LngLatBounds' to include every coordinate in the bounds result.
    this.markersValue.forEach(marker => {
      bounds.extend([marker.lng, marker.lat]);
    });

    this.map.fitBounds(bounds, {
    padding: 40,
    duration: 0
    });
  }

  #fetchRoute(markersarray) {
    fetch(`https://api.mapbox.com/directions/v5/mapbox/walking/${markersarray[0].lng},${markersarray[0].lat};${markersarray[1].lng},${markersarray[1].lat}?geometries=geojson&access_token=${mapboxgl.accessToken}`)
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        const route = data.routes[0].geometry.coordinates;
        const geojson = {
          type: 'Feature',
          properties: {},
          geometry: {
            type: 'LineString',
            coordinates: route
          }
        };
        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
        });
      });

  }

}
