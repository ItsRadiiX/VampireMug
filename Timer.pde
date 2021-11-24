class Timer {

    int timeToWait;
    int startTime;
    boolean done;

    public Timer(int timeToWaitInMillis){
        this.timeToWait = timeToWaitInMillis;
    }

    public boolean isDone(){
        if(!done){
            int passedTime = millis() - startTime;
            if(passedTime > timeToWait){
                done = true;
            }
        }
        return done;
    }

    public void start(){
        done = false;
        startTime = millis();
    }

    public void start(int timeToWait){
        this.timeToWait = timeToWait;
        start();
    }
}