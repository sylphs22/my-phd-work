// personality1.cpp : Defines the entry point for the console application.
//

// ConsoleApplication10.cpp : Defines the entry point for the console application.
//

#include <iostream>
 
#include <fstream>
#include "conio.h"
#include "float.h"
#include <math.h> 
using namespace std;
// #define rows 18
int main(int argc, char *argv[])
{   
    using namespace std;
	 const int Rx = 95 ;
	 const int Ry = 1000;

	ifstream fin3;
      fin3.open("IN.txt");
	  float** f1 ;
	   f1 = new float* [Rx]; 
   for (int i = 0; i < Rx; i++ ) 
   {
       f1[i] = new float[Ry] ;
   }
  // fin3.close();
 
for ( int i = 0; i < Rx; i++ )
  {
     for ( int j = 0; j < Ry; j++ )
   {
	  // 
      fin3 >> f1[i][j];
	//printf("f[i][j] %f",f1[i][j]);
	//_getch();
 }
 }

 ofstream  fout1;
	 fout1.open("dump.txt");
	for (int i = 0; i < Rx; i++) {
        for (int j = 0; j < Ry; j++) {
			if(f1[i][j] == 0) continue ;
	   fout1 << "\n ";
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << j ; 
		fout1 << "\t ";
		fout1 << f1[i][j];//+C[i]+D[j])+3.52
		//fout1<<"\t";
		}
		// fout1 << "\n ";
	 }
	 


    return 0;
	


}
