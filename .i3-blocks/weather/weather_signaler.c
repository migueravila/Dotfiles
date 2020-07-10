#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <stdio.h>

// Sleep time between daemon updates.
#define SLEEP_TIME_S    300

// Test for internet connection. Returns true if connection is established.
static int test_internet_connection()
{
    const char *cmd = "nc -zw1 google.com 443 1> /dev/null 2>&1";
    return !system(cmd);
}

// Signal handler for signaling the weather applet.
static void timer_handler(int sig, siginfo_t *si, void *uc)
{
    (void) sig; // Ignore parameter.
    (void) si;  // Ignore parameter.
    (void) uc;  // Ignore parameter.

    // Test for internet connection till found or 20 times.
    for (int i = 0; i < 20; ++i) 
    {
        if (test_internet_connection())
        {
            // Connection established. Break out.
            break;
        }
        else
        {
            // Retry every second.
            sleep(1);
        }
    }

    // Signal the weather applet.
    const char *cmd = "pkill -RTMIN+2 i3blocks";
    if ( system(cmd) )
    {
        // Error message should be printed to stdout since stdout is the way to
        // interface with a user in i3blocks.
	puts("WEATHER_SIGNALER ERROR\n");
    }
}

int timer_init_launch(
        timer_t *timer, 
        struct sigevent *sev, 
        struct sigaction *sa,
        struct itimerspec *tspec)
{
    // Event initialization.
    sev->sigev_notify = SIGEV_SIGNAL;
    sev->sigev_signo = SIGRTMIN;
    sev->sigev_value.sival_ptr = timer;

    // Signal action type initializaion.
    sa->sa_flags = SA_SIGINFO;
    sa->sa_sigaction = timer_handler;
    sigemptyset(&sa->sa_mask);
    if (sigaction(SIGRTMIN, sa, NULL) == -1)
        return -1;

    // Initialze timer.
    if (timer_create(CLOCK_BOOTTIME, sev, timer) == -1)
        return -1;

    // Start the timer.
    tspec->it_value.tv_sec = SLEEP_TIME_S;
    tspec->it_value.tv_nsec = 0;
    tspec->it_interval.tv_sec = SLEEP_TIME_S;
    tspec->it_interval.tv_nsec = 0;
    if (timer_settime(*timer, 0, tspec, NULL) == -1)
        return -1;

    // Initialization successful.
    return 0;
}

int main()
{
    timer_t timer;
    struct sigevent sev;
    struct sigaction sa;
    struct itimerspec tspec;

    // Initialize signaler
    if (timer_init_launch(&timer, &sev, &sa, &tspec))
        exit(EXIT_FAILURE);

    // Signal on daemon launch.
    sleep(1);
    timer_handler(0, NULL, NULL);

    while(1)
    {
        sleep(100);
    }
}
