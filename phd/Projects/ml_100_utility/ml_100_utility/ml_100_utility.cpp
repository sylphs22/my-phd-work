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
	 const int Rx = 943 ;
	 const int Ry = 1682;
	 const int f_dec = 2;
// NEWCOMMENT	float New_R[Rx][Ry] ;
	//  ld block begings here 
	int rows ;
	const int N=80 ;
char line[N];

// reading total number of rows
// printf("HELLO WORLD") ;
	
ifstream fin1  ;

int nol=0 ;

	fin1.open("IN.TXT",ios::binary) ;

		while (fin1)
{
	 ++nol ;
	fin1.getline(line,N) ;
	

	 
}
	
	fin1.close();


//// cout << "nol =>"  ;
//// cout << nol  ;
//// cout << endl;
rows = nol-1 ;
// _getch();



	std::fstream myfile("IN.TXT", std::ios_base::in);
	 int a ;
	 int mr =0 ;
	 int mc =0 ;
	 int col=4;
    // Allocate a two-dimensional f_decxf_dec array of ints
    int** ippArray = new int*[rows];
	// int* SinArr  = new int[7f_dec] ;
	for(int x=0 ; x<(rows+1);x++)
	ippArray[x] = new int[4];
	//ippArray[1] = &(ippArray[0][f_dec]);
	//ippArray[f_dec] = &(ippArray[0][4]);
	 int Scount=0;
	 while (myfile >> a)
    {
		// // printf(" \n 	currently alloting -> %d ", a);
	 //  SinAroppArray[Scount]=a;
		//Scount++;
	 //	if(Scount==7f_dec) break ;
		 ippArray[mr][mc] = a ;
	//	 // printf("mr mc %d %d",mr , mc);
		if (mc<(col-1))
		 {
			 mc++ ;

		 }
		 else
		 {
			 mc=0 ;
			 mr++ ;
		 
		 }
		 
		 
		  if (mr*mc==rows*4){
		 break ;
		 }
		  
		//	 // printf("in of array"); 
	 }
   
	  
    for (int i = 0; i < rows; ++i) 
	{
        for (int j = 0; j < 4; ++j) 
		{
		//	// printf("[%d][%d] , %d \t" , i , j,ippArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
        // cout << endl;
    }
    
	// finding number of items , by finding max item code
	int prod_max=ippArray[0][2];
	for(int i=0;i<rows;i++)
	{
	//	// printf("\n %d",ippArray[i][1]);
		if(prod_max<ippArray[i][1]) 
			prod_max=ippArray[i][1] ;
	} 
	// printf("\n max = %d",prod_max) ;
	  // cin.get();

	// creation of new array 
	
	int usercount = ippArray[rows-1][0];
	// printf("\n user count => = %d",usercount) ;
	int opprows = usercount;
	   int** oppArray = new int*[opprows];
	   float** New_R  = new float*[opprows]  ;    
   //  float** RN = new float*[opprows]  ; 
    // float** U = new float*[opprows]  ; 
	// float** V = new float*[opprows]  ;
	//  float** P = new float*[opprows]  ;
	//   float** Q = new float*[f_dec]  ;
	//   float** S = new float*[opprows]  ;
   //float P[Rx][f_dec] ;
	//  float Q[f_dec][Ry] ;
	   // float S[Rx][f_dec] 
//	  cin.get();
	
	for(int x=0 ; x<(opprows+1);x++) {
	oppArray[x] = new int[prod_max];
	New_R[x] = new float[prod_max];
//	RN[x] = new float[prod_max];
//	U[x] = new float[prod_max];
//	V[x] = new float[prod_max];
//	P[x] =  new float[f_dec];
//	S[x] =  new float[f_dec];
	}
	
	for(int x=0 ; x<(f_dec);x++) {
//	Q[x] = new float[prod_max];
	}



	//  New_R[f_dec][f_dec]= 7 ;

	  // printf("\n ******* New_R[f_dec][f_dec] = %d  ",New_R[f_dec][f_dec]);
	 //  cin.get();
	 // printf("\n In out matrix , num of rows = %d  & num of cols = %d\n",opprows,prod_max) ;
//	 cin.get();
	 // filling value in new array
	 
	 for (int i = 0; i < opprows; ++i) {
        for (int j = 0; j <= prod_max; ++j) {
			oppArray[i][j] = 0;
		//	// printf("[%d][%d] , %d \t" , i , j,oppArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
        // cout << endl;
    }
    // cout << endl;
//	 cin.get();

	  // adjusting  final value of  new array
	 // printf("\n---- adjusting  final value of  new array \n" );
	 for (int i = 0; i <  rows; ++i) {
        
			oppArray[ippArray[i][0]-1][ippArray[i][1]]=ippArray[i][2] ;

		//	// printf("[%d][%d] , %d \t" , i , j,ippArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
         
    	

	// cin.get();

	 // printing final value of  new array
	 // printf("\n**********  final output \n" );
	 ofstream   foutf_dec1 ;
	// foutf_dec1.open("OUT.TXT");
	 for (int i = 0; i < opprows; ++i) {
        for (int j = 1; j <= prod_max; ++j) {
			
		//	// printf("[%d][%d] , %d  ," , i , j,oppArray[i][j] );
			// foutf_dec1 << oppArray[i][j] ;
			// foutf_dec1 << "\t *" ;
			New_R[i][j-1]= oppArray[i][j] ;
			// printf(" \n \n ****** NEW oppArray i j %d %d \n>     ",i,j );
		//	// cout << oppArray[i][j] ;
		//	int val = (int)strtol(oppArray[i][j], (char **)NULL, 10);
			// printf(" \n  ****** current oppArray -> %f   \n>     ",oppArray[i][j]);
			 // printf(" \n  ****** New_R val -> %f   \n>     ",New_R[i][j-1]); // _getch();
			//// printf(" \n  ******  oppArray[i][j]-0  %d   \n>     ",oppArray[i][j]-'0');
			
           // // cout << ippArray[i][j] << " ";
        }
		// foutf_dec1 << "\n" ;
        // cout << endl;

	

    }
    // cout << endl;
	// foutf_dec1.close();
	// cin.get();

	//	// printf(" \n \n +++++++  NEW oppArray 0 0> %f   ",oppArray[0][0]) ; _getch();
	//  old block ends here 

	//  std::// cout << "\n +++++++++++++++++++++++ NEW BLOCK +++++++++++++++++++++++++ \n" << std::endl;
  
    //std:: // cout << "Hello World!" << std::endl;
 //   std::cin.get();

	// file for dump 
//	ofstream  fout1,  foutf_dec, fout7, fout16,  fout9f_dec , fout8, fout9, fout00 ;
	 ofstream fout00,fout1,fout2 ;
	// fout00.open("Similarity_dump.txt");
	// fout8.open("new_PQS_dump.txt");
	// foutf_dec.open("err_data.csv");
	fout1.open("dump.txt");
	//fout2.open("dump1.txt");
	// fout7.open("new_dump.txt");
	// fout16.open("new_dump.csv");
	// fout9f_dec.open("Q_data.txt");
	
	// initialiQqing R matrix with Rx rows and Ry colums
	
for(int i=0;i<Rx;i++){
	for(int j=0;j<Ry;j++){
		
	//	if(New_R[i][j] != 0) continue ; // skipping for already rated items

		//printf ("\n for RN[%d}[%d] pred value is %f",i,j , pred_sorted) ;
		//_getch();
		//fout1 << "\n ";
		//fout1 << i ; 
		//fout1 << "\t ";
	//	fout1 << j ; 
	//	fout1 << "\t ";
		fout1 << (New_R[i][j]);//+C[i]+D[j])+3.52
        fout1 << "\t ";
	}
	   fout1 << "\n ";

}
//}


    return 0;
	


}