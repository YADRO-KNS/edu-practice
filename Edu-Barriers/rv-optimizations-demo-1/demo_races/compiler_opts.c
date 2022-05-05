#define _GNU_SOURCE
#include <pthread.h>
#include <stdio.h>	// For printf
#include <unistd.h>	// For usleep
#include <stdbool.h>	// For bool
#include <sched.h>	// For setaffinity
#include <stdint.h>	// For uintptr_t
#include <stdlib.h>	// For srand()+rand()

#define READ_ONCE(x)	(*(const volatile typeof(x) *)&(x))

#define WRITE_ONCE(x, val)				\
	do {						\
		*(volatile typeof(x) *)&(x) = (val);	\
	} while (0)

static void msleep(int msecs)
{
	usleep(msecs * 1000);
}

static bool ready;

static void set_affinity(int cpu)
{
	cpu_set_t set;

	CPU_ZERO(&set);
	CPU_SET(cpu, &set);
	sched_setaffinity(pthread_self(), sizeof(set), &set);
}

static void* p1(void *arg)
{
	int cpu = (uintptr_t)arg;

	printf("--> %s (cpu %d)\n", __func__, cpu);
	set_affinity(cpu);

	msleep(2);

	#if 0
	ready = true;
	#else
	WRITE_ONCE(ready, true);
	#endif

	printf("%s: made ready\n", __func__);

	printf("<-- %s\n", __func__);
	return NULL;
}

void* p2(void *arg)
{
	int cpu = (uintptr_t)arg;

	printf("--> %s (cpu %d)\n", __func__, cpu);
	set_affinity(cpu);

	#if 0
	unsigned long long wait_cnt = 10;
	while (ready2) {
		msleep(100);
		if (!--wait_cnt)
			break;
	}
	#elif 1
	unsigned long long wait_cnt = 100 * 1000 * 1000;
	while (!ready) {
		if (!--wait_cnt)
			break;
	}
	#else
	unsigned long long wait_cnt = -1;
	while (!READ_ONCE(ready)) {
		if (!--wait_cnt)
			break;
	}
	#endif

	printf("%s: %s%s\n", __func__,
	       ready ? "ready" : "NOT ready!",
	       wait_cnt ? "" : " (timeout)");

	printf("<-- %s\n", __func__);
	return NULL;
}

int main()
{
	pthread_attr_t attr;
	pthread_t id1, id2;
	bool ready = false;

	pthread_attr_init(&attr);

	set_affinity(1);
	srand(time(NULL));

	pthread_create(&id1, &attr, &p1, (void*)2);
	pthread_create(&id2, &attr, &p2, (void*)3);

	pthread_join(id1, NULL);
	pthread_join(id2, NULL);

	return 0;
}
