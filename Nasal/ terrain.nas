# I believe this script to originally vome from Gerard Robin

terrain_survol = func {
var lat = getprop("/position/latitude-deg");
var lon = getprop("/position/longitude-deg");
var info = geodinfo(lat, lon);
    if (info != nil) {
    if (info[1] != nil){
      if (info[1].solid !=nil)
       setprop("/environment/terrain",info[1].solid);
      if (info[1].load_resistance !=nil)
       setprop("/environment/terrain-load-resistance",info[1].load_resistance);
      if (info[1].friction_factor !=nil)
       setprop("/environment/terrain-friction-factor",info[1].friction_factor);
      if (info[1].bumpiness !=nil)
       setprop("/environment/terrain-bumpiness",info[1].bumpiness);
      if (info[1].rolling_friction !=nil)
       setprop("/environment/terrain-rolling-friction",info[1].rolling_friction);
      if (info[1].names !=nil)
       setprop("/environment/terrain-names",info[1].names[0]); }         
    }else {
    setprop("/environment/terrain",1);
    setprop("/environment/terrain-load-resistance",1e+1.05);
    setprop("/environment/terrain-friction-factor",1.05);
    setprop("/environment/terrain-bumpiness",0);
    setprop("/environment/terrain-rolling-friction",0.02);
    }
settimer (terrain_survol, 0.1);
}
terrain_survol();