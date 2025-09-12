import React, { useEffect, useRef } from 'react';
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const Map = () => {
  const mapContainer = useRef<HTMLDivElement>(null);
  const map = useRef<mapboxgl.Map | null>(null);

  useEffect(() => {
    if (!mapContainer.current) return;

    // Initialize map with Lille coordinates
    mapboxgl.accessToken = process.env.MAPBOX_PUBLIC_TOKEN || 'pk.eyJ1IjoidGVzdCIsImEiOiJjazlvd2J4bmMwMDFwM2ZtdzhkYXNpYTF2In0.test';
    
    map.current = new mapboxgl.Map({
      container: mapContainer.current,
      style: 'mapbox://styles/mapbox/light-v11',
      center: [3.0573, 50.6292], // Lille coordinates
      zoom: 12,
    });

    // Add marker for Mon p'tit Dépanneur location
    new mapboxgl.Marker({
      color: '#FF6B35'
    })
    .setLngLat([3.0573, 50.6292])
    .setPopup(new mapboxgl.Popup({ offset: 25 })
      .setHTML('<h3>Mon p\'tit Dépanneur</h3><p>21 Rue Edouard Delesalle<br>59000 Lille</p>'))
    .addTo(map.current);

    // Add navigation controls
    map.current.addControl(
      new mapboxgl.NavigationControl(),
      'top-right'
    );

    // Cleanup
    return () => {
      map.current?.remove();
    };
  }, []);

  return (
    <div className="relative w-full h-96">
      <div ref={mapContainer} className="absolute inset-0 rounded-lg shadow-lg" />
    </div>
  );
};

export default Map;