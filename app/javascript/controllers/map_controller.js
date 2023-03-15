import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";
import Rails from "rails-ujs";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    routeId: Number
  };

  connect() {
    console.log("Connected Map JS");

    mapboxgl.accessToken = this.apiKeyValue;

    const markersarray = this.markersValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 13,
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();

    console.log(markersarray);

    let fetchQueryString =
      "https://api.mapbox.com/directions/v5/mapbox/walking/";

    let i = 1;
    markersarray.forEach((marker) => {
      if (i == markersarray.length) {
        fetchQueryString =
          fetchQueryString +
          marker.lng +
          "," +
          marker.lat +
          `?geometries=geojson&access_token=${mapboxgl.accessToken}`;
      } else {
        fetchQueryString =
          fetchQueryString + marker.lng + "," + marker.lat + ";";
      }
      i += 1;
    });

    this.#fetchRoute(fetchQueryString);
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      // const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        // .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();

    // Extend the 'LngLatBounds' to include every coordinate in the bounds result.
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });

    this.map.fitBounds(bounds, {
      padding: 40,
      duration: 0,
    });
  }

  #fetchRoute(fetchQueryString) {
    fetch(fetchQueryString)
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        // this.#addingDistanceInfo()
        this.#sendPatch(data)
        const route = data.routes[0].geometry.coordinates;
        const geojson = {
          type: "Feature",
          properties: {},
          geometry: {
            type: "LineString",
            coordinates: route,
          },
        };
        this.map.addLayer({
          id: "route",
          type: "line",
          source: {
            type: "geojson",
            data: geojson,
          },
          layout: {
            "line-join": "round",
            "line-cap": "round",
          },
          paint: {
            "line-color": "#3887be",
            "line-width": 5,
            "line-opacity": 0.75,
          },
        });
      });
  }

  // #addingDistanceInfo() {
  //   const distance = document.querySelector(".distance")
  //   const duration = document.querySelector(".duration")
  //   console.log(distance)
  //   console.log(duration)
  //   console.log(data.routes[0].distance);
  //   console.log(data.routes[0].duration);

  //   distance.textContent = `Distance: ${data.routes[0].distance}`
  //   duration.textContent = `Duration: ${data.routes[0].duration}`
  // }

  #sendPatch(data) {
    console.log(this.routeIdValue)
    console.log('RouteId again?')
    const form = new FormData();
    console
    const DistanceInMetres = data.routes[0].distance
    const TimeInSeconds = data.routes[0].duration

    const DistanceInKm = parseFloat((DistanceInMetres / 1000).toFixed(2))
    // const TimeInMinutes = parseFloat((TimeInSeconds / 60).toFixed(0))
    const TimeInMinutes = Math.round((TimeInSeconds / 60))
    console.log(TimeInSeconds)

    form.append("route[distance]", DistanceInKm)
    form.append("route[time]", TimeInMinutes)

    console.log("jake")

    // fetch(`/routes/${this.routeIdValue}`, {
    //   method: "PATCH",
    //   headers: { "Content-Type": "application/json", "Accept": "application/json" },
    //   body: JSON.stringify(form)
    // })
    //   .then((response) => console.log(response))
    //   // .then((data) => console.log(data))

    Rails.ajax({
      url: `/routes/${this.routeIdValue}/move`,
      type: "PATCH",
      data: form
    })
  }
}
