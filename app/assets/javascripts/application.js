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
//= require bootstrap
//= require isotope.pkgd
//= require_tree .

//= require image_slider

  // Instagram Feed Photos
  var feed = new Instafeed({
        // get: 'tagged',      
        // tagName: 'thesimplesol',   // Replace with Sol Blog tag
        // limit: 12, 
        // clientId: 'd2eba98f01fb4bbbb2b45f11535a2c33'  // Client ID from Instagram
        get: 'user',
        limit: 12,
        userId: 1452429841,
        accessToken: '1452429841.467ede5.4064223743964747a1de5d1b23c705ff'
  });
  feed.run();