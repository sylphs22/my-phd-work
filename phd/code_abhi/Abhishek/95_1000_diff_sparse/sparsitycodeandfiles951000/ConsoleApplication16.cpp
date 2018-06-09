#define _CRT_SECURE_NO_DEPRECATE

#include<stdio.h>
#include "stdafx.h"
#include<conio.h>
#include <stdlib.h>
#include <time.h> 
#include <ctype.h> 
#include <iostream>
#include <fstream>
using namespace std;

int main () {
   int a; 
   int i =0 ;
   int j = 0 ;
   int rows = 95 ;
	   int cols = 1000 ;
char *inname = "95_1000_movierating.txt";

int** ippArray = new int*[rows];
for(int x=0 ; x<(rows+1);x++)
	ippArray[x] = new int[cols];


 ifstream infile(inname);
 if (!infile) { cout << "There was a problem opening file " << inname << " for reading." << endl;
 return 0; 
 }
 cout << "Opened " << inname << " for reading." << endl;
 while (infile >> a) 
 { 
	// cout << "Value from file is " << a << endl; 
 ippArray[i][j]= a ;
 if (j==cols-1 ) { i++ ; j=0;
                 } 
 else { j++ ;
     }
 } 
 // printf("\n") ;
 // printf("+++++++++++++++++++++++") ;
  // printf("\n") ;
 /*
for (int i=0; i< rows; i++)
{
	for(int j=0; j<cols;j++)
		printf(" %d ", ippArray[i][j] );
	printf("\n") ;
}
*/
//_getch();
// calculating current populated %
int non_zero_vals = 0 ;
int  zero_vals = 0 ;
int total_vals = rows*cols ;
float cur_pop = 0.0 ;
for (int i=0; i< rows; i++)
{
	for(int j=0; j<cols;j++)
	{
		if(ippArray[i][j]!=0) non_zero_vals++ ;
	}
	 
}
zero_vals = total_vals - non_zero_vals ;
cur_pop = (non_zero_vals*100)/total_vals ;
 // printf(" total items  = %d ", total_vals );
// printf(" total non zero items  = %d ", non_zero_vals );
//  printf(" total  zero items  = %d ", zero_vals );
  printf(" current pouplated %  = %f ", cur_pop );

//calculate the new MX with new_pop% 
 float new_pop = 4.0 ;
 float remove_items = ((cur_pop - new_pop )/ 100 )*total_vals;

	//   printf(" number of total  items to be deleted for achieving %f pop = %f ",new_pop, remove_items );
	  _getch();
	 // row wise calculation
	 int r ;
	 int rc ;
	 int rcn ;
	int row_non_zero_vals = 0 ;
	 for (int i=0; i< rows; i++)
        { 
	

	          for(int j=0; j<cols;j++)
	                  {
		                if(ippArray[i][j]!=0) row_non_zero_vals++ ;
	                  }
	            printf(" \n total non zero items for row %d = %d ",i, row_non_zero_vals );
	
	          int row_cur_pop = (row_non_zero_vals*100)/cols ;
              float row_remove_items = ((row_cur_pop - new_pop )/ 100 )*cols;
	            printf(" \n number of items to be deleted  from row %d for achieving %f pop = %f ",i,new_pop, row_remove_items );
	          /* initialize random seed: */
              // srand (time(NULL));
 	            rc = 0 ; rcn =0 ;
              //	// printf(" \n random = %d ",  r );
              for(int k = 0 ; k<= (row_remove_items-1);k++ )
	             { 
					 
					  for(int j=0; j<cols;j++)
	                  {
		               	  // printf(" ippArray =  %d ,  ", ippArray[i][j]) ;
	                  }
					  // printf("\n now starting for k") ;
					  // printf("\n  k = %d ",k) ;
                  rand1:	  r = rand() % cols  ;
		                      // printf("\n   rand fn = %d ", r) ;
		          if(ippArray[i][r]!=0)
		                    {  
								// printf(" \ this ippArray ippArray[%d][%d] = %d is not equal to zero hence making it zero",i,r,ippArray[i][r]);
								ippArray[i][r] = 0 ;
								
								 // printf("\n running rand fn due it ip being non zero for %d times", rcn) ;
			                     rcn++ ;
		                          continue ;
		                    }
		            else{
						  // printf(" \ this ippArray ippArray[%d][%d] = %d is   equal to zero hence running again",i,r,ippArray[i][r]);
						   
			              // printf("\n running rand fn due it ip being zero for %d times", rc) ;
			              rc++ ;
						   
		                  //	_getch();
		                  goto rand1 ;
		                  }
	               }
			   // printf("\n after adjusting this row \n" ) ;
			  for(int j=0; j<cols;j++)
	                  {
		               	  // printf("\n ippArray =  %d ,  ", ippArray[i][j]) ;
	                  }

	 row_non_zero_vals = 0 ;
	 row_remove_items = 0 ;
	// _getch();
 }



	  // printf("\n +++++++++++SPARSED MX ++++++++++++") ;
  // printf("\n") ;
	 /*
	 for (int i=0; i< rows; i++)
{
	for(int j=0; j<cols;j++)
		 printf(" %d ", ippArray[i][j] );
	  printf("\n") ;
}
*/
// _getch();

 ofstream   foutf_dec1 ;
	 foutf_dec1.open("OUT_4.TXT");
	 for (int i=0; i< rows; i++)
{
	for(int j=0; j<cols;j++)
	{
		foutf_dec1 << ippArray[i][j]  ;
        foutf_dec1 << "\t" ;
	}

      foutf_dec1 << "\n" ;
}
 printf("\n all done ");
 _getch();

  return 0;
}