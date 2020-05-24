#pragma once
#include <iostream>
#include <chrono>
#include <string>

struct Timer
{
	int numberOfProcesses;
	std::string tag;
	std::chrono::time_point<std::chrono::steady_clock> start;
	std::chrono::time_point<std::chrono::steady_clock> end;
	std::chrono::duration<double> duration{ 0.0f };

	Timer(std::string tag = "NO_NAME", int numberOfProcesses = 1):
		tag{ tag }, numberOfProcesses{ numberOfProcesses }, 
		start{ std::chrono::high_resolution_clock::now() } {}
	~Timer() { if (tag != "NO_NAME") std::cout << tag << " took " << get_ms() << " ms\n"; }
	
	double get_ms()
	{
		end = std::chrono::high_resolution_clock::now();
		duration = end - start;

		return duration.count() * 1000.0 / numberOfProcesses;
	}
};
