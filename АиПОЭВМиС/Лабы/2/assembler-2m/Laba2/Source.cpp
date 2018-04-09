#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <Windows.h>
#include <iostream>
using namespace std;
extern "C"
{
	void sayID();
	double func(double);
}
void main()
{
	
	printf("This is My id: \n");
	sayID();
	double x;
	printf("Enter,please 'x' for function: \n");
	cin >> x;
	cout << func(x) << endl;
	system("pause");
}
