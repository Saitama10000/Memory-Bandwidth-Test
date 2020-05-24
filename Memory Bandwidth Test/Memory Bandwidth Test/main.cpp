#include <iostream>
#include <vector>
#include <thread>
#include "timer.h"

extern "C"
{
	void read(void* input, const long long size);
	void write(void* input, const long long size);
}

int main()
{
	const long long size = 1 << 28;
	int* input = new int[size];

	int N{ 1 };
	std::cout << "N=";
	std::cin >> N;

	std::string ans;
	std::cout << "read or write? (r/w) ";
	std::cin >> ans;

	std::vector<double> timers;
	while(true)
	{
		Timer timer;
		
		std::vector<std::thread> threads;
		for (int i = 0; i < N; i++)
			if (ans == "r")
				threads.push_back(std::thread{ read, (void*)input, size });
			else
				threads.push_back(std::thread{ write, (void*)input, size });
		for (auto& thread : threads)
			thread.join();
		timers.push_back(timer.get_ms()); 
		
		double time{ 0.0 };
		for (auto& duration : timers)
			time += duration;
		time /= timers.size();
		
		double averageBandwidth{ (N * size * sizeof(*input)) * 1000.0 / (1 << 30) / time };

		std::cout << "Average time: " << time 
			<< "\nAverage memory bandwidth: " <<  averageBandwidth << " GB/s\n";
	}

	return 0;
}