#include <stdio.h>
#include <new>

extern "C"
{
	unsigned long long cycle_start();
	unsigned long long cycle_end();
	void read(int* input, int size);
}

int main()
{
	const long long size = 1ll << 25;
	int* input = new int[size];
	for (int i = 0; i < size; i++)
		input[i] = i;
	
	
	for (int j = 0; j < 10; j++)
	{

		unsigned long long start = 0;
		unsigned long long end = 0;
		unsigned long long duration = 0;
		unsigned long long cycles = 0;
		unsigned long long n = 0;

		for (int i = 0; i < 1000; i++)
		{
			start = cycle_start();
			read(input, size);
			end = cycle_end();

			duration = end - start;
			cycles += duration; n += 1;

		}

		const double cpuFrequency = 4.0;
		const double peakBandwidth = 42.666;
		double bandwidth = (double)(size * sizeof(int)) / (double)(cycles / n - 20) * cpuFrequency;

		printf("%15.2e %16lld %16lld %16.2f GB/s  %2.3f%% peak\n",
				(double)(cycles / n),
				cycles / n,
				duration,
				bandwidth,
				bandwidth / peakBandwidth * 100.0
		);
	}
	
	system("pause");
	return 0;
}