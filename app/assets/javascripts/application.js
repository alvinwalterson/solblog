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
//= require turbolinks
//= require bootstrap
//= require_tree .

//= require image_slider

  var timeout         = 500;
  var closetimer      = 0;
  var ddmenuitem      = 0;

  // open hidden layer
  function mopen(id)
  {    
      // cancel close timer
      mcancelclosetime();

      // close old layer
      if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

      // get new layer and show it
      ddmenuitem = document.getElementById(id);
      ddmenuitem.style.visibility = 'visible';

  }
  // close showed layer
  function mclose()
  {
      if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
  }

  // go close timer
  function mclosetime()
  {
      closetimer = window.setTimeout(mclose, timeout);
  }

  // cancel close timer
  function mcancelclosetime()
  {
      if(closetimer)
      {
          window.clearTimeout(closetimer);
          closetimer = null;
      }
  }

  // close layer when click-out
  document.onclick = mclose;


  // Instagram Feed Photos
  var feed = new Instafeed({
        get: 'tagged',      
        tagName: 'messi',   // Replace with Sol Blog tag
        clientId: 'c949d548ff5a48a2b10b31e660db9fb7'  // Client ID from Instagram
  });
  feed.run();