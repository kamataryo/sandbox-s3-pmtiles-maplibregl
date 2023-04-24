import * as pmtiles from 'pmtiles';

const protocol = new pmtiles.Protocol();
maplibregl.addProtocol("pmtiles", protocol.tile);

const pmtiles_url = 'https://d4bm4c8153spm.cloudfront.net/hello.pmtiles'

const map = new maplibregl.Map({
  container: 'map',
  style: 'https://demotiles.maplibre.org/style.json',
  center: [139.888, 36.8],
  zoom: 4,
  hash: true,
});

map.on('load', () => {
  map.addSource('pmtiles', {
    type: 'vector',
    url: `pmtiles://${pmtiles_url}`
  })
  map.addLayer({
    id: 'pmtiles-label',
    source: 'pmtiles',
    'source-layer': 'hello',
    type: 'symbol',
    layout: {
      'text-field': '{name}',
      'text-offset': [0, .6],
    },
    paint: {
      'text-halo-width': 1,
      'text-halo-color': 'white',
    }
  })
  map.addLayer({
    id: 'pmtiles-circle',
    source: 'pmtiles',
    'source-layer': 'hello',
    type: 'circle',
    paint: {
      'circle-radius': 2,
      'circle-color': 'black',
    },
  })
})
