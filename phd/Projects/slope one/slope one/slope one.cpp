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
	 const int Rx = 6040;
	 const int Ry = 3952;
	 const int f_dec = 25;
// NEWCOMMENT	float New_R[Rx][Ry] ;
	//  ld block begings here 
	int rows ;
	const int N=80 ;
char line[N];

// reading total number of rows
 //printf("HELLO WORLD") ;
/*	ifstream fin4;
      fin4.open("CL_in.txt",ios::binary);
	  float** CM_in ;
	   CM_in = new float* [Ry]; 
   for (int i = 0; i < Ry; i++ ) 
   {
       CM_in[i] = new float[Rx+1] ;
   }
  // fin3.close();
 
for ( int i = 0; i < Ry; i++ )
  {
     for ( int j = 0; j < Rx+1; j++ )
   {
    fin4 >> CM_in[i][j];
	//printf("CM_in[i][j] %f",CM_in[i][j]);
//_getch();
 }
 }*/
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

// printf("HELLO WORLD1") ;


	std::fstream myfile("IN.TXT", std::ios_base::in);
	 float a ;
	 int mr =0 ;
	 int mc =0 ;
	 int col=4;
    // Allocate a two-dimensional f_decxf_dec array of ints
    float** ippArray;
	ippArray= new float*[rows];
// int* SinArr  = new int[7f_dec] ;
	for(int x=0 ; x<(rows+1);x++)
	ippArray[x] = new float[4];
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
	// printf("mr mc %d %d",mr , mc);
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
    // Fill the array
	 /*
    for (int i = 0; i < 18; ++i) {
        for (int j = 0; j < f_dec; ++j) {
            ippArray[i][j] = i + j;
        }
    }

	*/
   
	 // printf("\nout of array \n");
	  // Output the array
	  
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < 4; ++j) {
		// printf("ippArray[i][j]  %f \t" ,ippArray[i][j] );
		// _getch();
           // // cout << ippArray[i][j] << " ";
        }
        // cout << endl;
    }
    // cout << endl;
	 
    // Deallocate
	/*

	for(int x=0 ; x<19;x++)
	delete [] ippArray[x];

    delete [] ippArray;
	 delete [] SinArr; */
    // Keep the window open
  //  cin.get();
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
	//printf("\n rows => = %d",ippArray[rows-1][0]) ;
	int usercount = ippArray[rows-1][0];
	// printf("\n user count => = %d",usercount) ;
	//_getch();
	int opprows = usercount;
	 float** oppArray = new float*[opprows];
	 	int** timeArray = new int*[opprows];

	 float** New_R  = new float*[opprows]  ;    
     float** RN = new float*[opprows]  ; 
     float** U = new float*[opprows]  ; 
	 float** V = new float*[opprows]  ;
	  float** P = new float*[opprows]  ;
	   float** Q = new float*[f_dec]  ;
	   float** S = new float*[opprows]  ;
   //float P[Rx][f_dec] ;
	//  float Q[f_dec][Ry] ;
	   // float S[Rx][f_dec] 
//	  cin.get();
	//printf("\hello");
		//  printf("\n In out matrix , num of rows = %d  & num of cols = %d\n",opprows,prod_max) ;
	for(int x=0 ; x<(f_dec);x++) 
	{
	Q[x] = new float[prod_max];
	}
		//printf("\hello1");

for(int x=0 ; x<(opprows+1);x++){

oppArray[x] = new float[prod_max];
timeArray[x]=new int[prod_max];
New_R[x] = new float[prod_max];
	RN[x] = new float[prod_max];
	U[x] = new float[prod_max];
	V[x] = new float[prod_max];
	P[x] =  new float[f_dec];
	S[x] =  new float[f_dec];
	
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
			timeArray[i][j]=0;
		//	// printf("[%d][%d] , %d \t" , i , j,oppArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
        // cout << endl;
    }
    // cout << endl;
//	 cin.get();

	  // adjusting  final value of  new array
	 // printf("\n---- adjusting  final value of  new array \n" );
	 int d,e;
	 for (int i = 0; i <  rows; ++i) {
        d=ippArray[i][0]-1;
		e=ippArray[i][1];
			oppArray[d][e]=ippArray[i][2] ;
		    timeArray[d][e]=ippArray[i][3] ;
		//	// printf("[%d][%d] , %d \t" , i , j,ippArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
	// delete [] ippArray;
         
    	/* begin
			_getch();
	for(int i= 0;i<9;i++){
		for(int j =1;j<61;j++){
			// printf(" oppArray val >%d %d %d   ",i,j,oppArray[i][j]) ; // _getch();
			 
			 
		}
		// printf("\n");
		 
	}
	 end */

	// cin.get();

	 // printing final value of  new array
	 //printf("\n**********  final output \n" );
	 ofstream   foutf_dec1 ;
	// foutf_dec1.open("OUT.TXT");
	 for (int i = 0; i < opprows; ++i) {
        for (int j = 1; j <= prod_max; ++j) {
			
		//	// printf("[%d][%d] , %d  ," , i , j,oppArray[i][j] );
			// foutf_dec1 << oppArray[i][j] ;
			// foutf_dec1 << "\t *" ;
			New_R[i][j-1]= oppArray[i][j] ;
			RN[i][j-1]=timeArray[i][j];
			// printf(" \n \n ****** NEW oppArray i j %d %d \n>     ",i,j );
		//	// cout << oppArray[i][j] ;
		//	int val = (int)strtol(oppArray[i][j], (char **)NULL, 10);
			// printf(" \n  ****** current oppArray -> %f   \n>     ",oppArray[i][j]);
			 // printf(" \n  ****** New_R val -> %f   \n>     ",RN[i][j-1]); // 
			// _getch();
			//// printf(" \n  ******  oppArray[i][j]-0  %d   \n>     ",oppArray[i][j]-'0');
			
           // // cout << ippArray[i][j] << " ";
        }
		// foutf_dec1 << "\n" ;
        // cout << endl;

	

    }
	 //delete [] oppArray;
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
	//fout2.open("similarity.txt");
	// fout7.open("new_dump.txt");
	// fout16.open("new_dump.csv");
	// fout9f_dec.open("Q_data.txt");
	float B[Rx];
	for(int i=0;i<Rx;i++){

	B[i]=0;
}
float t1=0;
int co=0;
for(int i=0;i<Rx;i++){
	t1=0;
	co=0;
	for(int j=0;j<Ry;j++){
		if(New_R[i][j]==0){continue;}


		t1=t1 + New_R[i][j];
		co++;					
	}
	B[i]=t1/co;
	//B[i]=B[i]/co ;
	//printf("\n B[i]%d %f %d",i,B[i],co);
	//	getch();
}
float diff,pred,avg_i;
pred=0;
int count,count1;
	// initialiQqing R matrix with Rx rows and Ry colums
		for(int i= 0;i<Rx;i++){
			// fout1 << "--- +++ Inside i loop # +++ ---" ;
        	// fout1 << i  ;
	     // fout1 << '\n' ;
		for(int j =0;j<Ry;j++){
			// fout1 << "--- +++ Inside jloop # +++ ---" ;
        	// fout1 << j  ;
	     // fout1 << '\n' ;
			pred=0;
		if(New_R[i][j]!=0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			    }  // bypassing when rating = 0
		if(RN[i][j]==0){continue;}
		count1=0;avg_i=0;
	for(int b= 0;b<Ry;b++){
		diff=0,count=0;
		     
			 if(New_R[i][b]==0){continue;}
			 if(b==j)continue;
			for(int a= 0;a<Rx;a++){
				//if(a==i)continue;
			//	if(New_R[i][b]==0){continue;}
				if(New_R[a][j]==0){continue;}
				if (New_R[a][b]==0){continue;}

			diff=diff+New_R[a][j]-New_R[a][b];
			//printf("\ndiff %f %d %d %d %d %d",diff,i,j,a,b,count);
			//_getch();
			count++;
			}
			if (count==0){continue;}
			avg_i=avg_i+(diff/count);
		//	printf("avg_i %f %d",avg_i,count);
		//	_getch();
			count1++;
		}
	if (count1==0){
		pred=B[i];}
	else pred=B[i]+(avg_i/count1) ;
		//printf("pred %f %d %d %d",pred,i,j,count1);
		//_getch();
		fout1 << "\n ";
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << j ; 
		fout1 << "\t ";
		fout1 << (pred);
		}
		}
 // _getch();  
	
	




    return 0;
	


}
