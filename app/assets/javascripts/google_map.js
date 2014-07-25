$(document).ready(function(){
    $(document).on('page:update', function() {
        var map = document.getElementById('google_map');
        if (!_.isNull(map)) {
            handler = Gmaps.build('Google');
            handler.buildMap({
                    provider: {
//                        disableDefaultUI: false,
                        disableDoubleClickZoom: true,
                        panControl: false,
                        panControlOptions: false,
                        rotateControl: false
                    },
                    internal: {id: 'google_map'}
                },
                function () {
                    markers = handler.addMarkers([
                        {
                            "lat": 59.965894,
                            "lng": 30.292593,
                            "picture": {
                                "url": "/assets/map-marker.png",
                                "width": 32,
                                "height": 40
                            }
                        }
                    ]);
                    handler.bounds.extendWith(markers);
                    handler.fitMapToBounds();
                    handler.getMap().setZoom(17);
                }
            )
        }
    });
});
