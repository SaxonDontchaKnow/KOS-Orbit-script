clearscreen.

function flightplan{ //this is the main function to fly the rocket to orbit
    launch().
    ascent().
    coast().
    orbit().
}
flightplan().

function properStage{ //this is to ensure that the rocket stages properly
    set fuel to stage:liquidfuel.
    if fuel < 0.1 and hasThrusters() = true{
        stage.
    }
    else{
        wait until fuel < 0.1.
        stage.
    }
}

function hasThrusters{ //this checks to see if the craft has thrusters
    if maxthrust > 0 {
        return true.
    }
}

function launch{ //this is to get the rocket off the ground
    lock throttle to 1.
    lock steering to heading(90,90).
    set x to 3.
    from {x.} until x = 0 step {set x to x-1.} do{
        print "T-" + x.
        wait 1.
    }
    if x = 0{
        stage.
    }
}

function ascent{ //this is to ensure the rocket maneuvers properly to reach space
    when verticalSpeed > 100 then {
        lock steering to heading(75,90).
    }
    wait until altitude = 3000.
    lock steering to prograde.
    properStage().

}

function coast{ //this makes the rocket wait before reaching space before firing thrusters for circulization

}

function orbit{ //this is to make the rocket circularize its trajectory

}

wait until false.
