function time_callback (timeint)
    t = timer;
    t.StartDelay = timeint;
    t.TimerFcn = @(myTimerObj, thisEvent)disp( '3 seconds have elapsed' );
    start(t)

end

