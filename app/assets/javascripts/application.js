// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require raphael
//= require underscore
//= require gmaps/google
//= require_tree .



handler = Gmaps.build('Google');
handler.buildMap({
                    provider: {
                        disableDefaultUI: false,
                        disableDoubleClickZoom: true,
                        panControl: false,
                        panControlOptions: false,
                        rotateControl: false
                    },
                    internal: {id: 'map'}
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
);
