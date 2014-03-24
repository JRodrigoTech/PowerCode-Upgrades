// Created by J.Rodigo (www.jra.so) 
// Based on the idea of Pedro Lahuerta (http://goo.gl/D9cUYG)
// Licence Creative commons atribution & share alike.

// The parameters of the base
rPad = 3 ;	// Round
xPad = 25 ;	// Width
yPad = 20 ;	// Length
hPad = 3 ;	// Height

// The parameters of the hook
hHook = 6 ;		// Height
xHook = 24 ;	// Width (one hook)
yHook = 4 ;		// Length (one hook)
sHook = 5.5 ; // Space between hooks

// Gap between the hooks (0 to disable)
GapHooks = 0 ;

// Cylinder resolution
$fn = 25 ; 

module base(){
	hull(){
		translate([xPad/2,yPad/2,0])
		cylinder(h = hPad, r = rPad, center = true);
		translate([-xPad/2,yPad/2,0])
		cylinder(h = hPad, r = rPad, center = true);
		translate([xPad/2,-yPad/2,0])
		cylinder(h = hPad, r = rPad, center = true);
		translate([-xPad/2,-yPad/2,0])
		cylinder(h = hPad, r = rPad, center = true);
	}
}

module hook(){
	difference(){
		// Hooks
		union(){
			translate([0,(yHook+sHook)/2,0])
			cube(size = [xHook,yHook,hHook], center = true);
			translate([0,-(yHook+sHook)/2,0])
			cube(size = [xHook,yHook,hHook], center = true);
		}
		// Gap between the hooks
		cube(size = [GapHooks,2*yHook+sHook+1,hHook+1], center = true);
	}
}

module AntiPad(){
	translate([0,0,hPad+(hHook/2)])
	hook();
	translate([0,0,hPad/2])
	base();
}

// ¡ ¡ ¡ Generate the piece ! ! !

	AntiPad();
