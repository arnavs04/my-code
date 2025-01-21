interface SecondObserver {
    void tick();
}

class Clock implements SecondObserver {
    private int hour;
    private int minutes;
    private int seconds;
    private boolean isAM;

    public Clock() {
        hour = 12;
        minutes = 0;
        seconds = 0;
        isAM = true;
    }

    public Clock(int hour, boolean isAM) {
        this.hour = hour;
        this.minutes = 0;
        this.seconds = 0;
        this.isAM = isAM;
    }

    public Clock(int hour, int minutes, int seconds, boolean isAM) {
        this.hour = hour;
        this.minutes = minutes;
        this.seconds = seconds;
        this.isAM = isAM;
    }

    public int getHours() {
        return hour;
    }

    public int getMinutes() {
        return minutes;
    }

    public int getSeconds() {
        return seconds;
    }

    public boolean getIsAM() {
        return isAM;
    }

    public void setTime(int hour, int minutes, int seconds, boolean isAM) {
        this.hour = hour;
        this.minutes = minutes;
        this.seconds = seconds;
        this.isAM = isAM;
    }

    @Override
    public void tick() {
        seconds++;
        if (seconds == 60) {
            seconds = 0;
            minutes++;
        }
        if (minutes == 60) {
            minutes = 0;
            hour++;
        }
        if (hour == 13) {
            hour = 1;
            isAM = !isAM;
        }
    }

    public String get_time() {
        String amPm = isAM ? "AM" : "PM";
        return hour + ":" + (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds + " " + amPm;
    }
}

class PrintClock extends Clock {
    public PrintClock() {
        super();
    }

    public PrintClock(int hour, boolean isAM) {
        super(hour, isAM);
    }

    public PrintClock(int hour, int minutes, int seconds, boolean isAM) {
        super(hour, minutes, seconds, isAM);
    }

    public void print_time() {
        System.out.println("Current Time: " + get_time());
    }
}

class TickingPrintClock extends PrintClock {
    public TickingPrintClock() {
        super();
    }

    public TickingPrintClock(int hour, boolean isAM) {
        super(hour, isAM);
    }

    public TickingPrintClock(int hour, int minutes, int seconds, boolean isAM) {
        super(hour, minutes, seconds, isAM);
    }

    @Override
    public void tick() {
        super.tick();
        System.out.println("Ticking Time: " + get_time());
    }
}

public class ClockTest {
    public static void main(String[] args) {
        Clock clock = new Clock();
        System.out.println("Initial Time: " + clock.get_time());
        for (int i = 0; i < 19012004; i++) { // my birthday
            clock.tick();
        }
        System.out.println("After 19012004 seconds: " + clock.get_time());

        PrintClock printClock = new PrintClock(11, 59, 58, true);
        printClock.print_time();
        printClock.tick();
        printClock.print_time();

        TickingPrintClock tickingPrintClock = new TickingPrintClock(11, 59, 58, true);
        for (int i = 0; i < 5; i++) {
            tickingPrintClock.tick();
        }
    }
}
