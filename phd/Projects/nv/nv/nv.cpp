// novelty.cpp : Defines the entry point for the console application.
// To TAKE CARE OF NV's logic , a new array has been created oppArray_NEW with Serial No , user id , movie , context , rating in one row

#include <iostream> 
#include <fstream>
#include "conio.h"
#include "float.h"
#include <math.h>
#include <cstdlib>
using namespace std;
// #define rows 18
int main(int argc, char *argv[])
{   
    using namespace std;
	 const int Rx = 121;
	 const int Ry = 1232;
	 const int f_dec = 2;
// NEWCOMMENT	float New_R[Rx][Ry] ;
	//  ld block begings here 
	int rows ;
	const int N=80 ;
    char line[N];
	  ifstream fin1  ;
      int nol=0 ;
	fin1.open("IN.TXT",ios::binary) ;

		while (fin1)
{
	 ++nol ;
	 fin1.getline(line,N) ;
	//cout << fin1.getline(line,N) ; 

	 
}
	
	fin1.close();

     rows = nol-1 ;
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
		 // cout << ippArray[mr][mc] ;
		 // _getch();
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
		  }}
		  
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
	const int context = 3;
	 int  SIZE_oppArray_NEW = opprows*prod_max*context ;
	 int entries_per_user = prod_max*context ;
	 int** oppArray_NEW = new int*[SIZE_oppArray_NEW];
	 int	user_count_1= 1 ;
	  int	user_count_2= 0 ;
	 int	mov_count_1= 1 ;
	 int    mov_count_2= 0 ;
	 int	context_count_1= 1;
	 int    context_count_2= 0 ;
	  for(int x=0 ; x<(SIZE_oppArray_NEW);x++) {
		
	oppArray_NEW[x] = new int[5];
	oppArray_NEW[x][0] =x ; 

	 oppArray_NEW[x][1] = user_count_1 ;
	 user_count_2++ ;

	 if (user_count_2==entries_per_user )
	 {user_count_2 =0 ;
	 user_count_1 ++ ;
	 
	   
	 }

	  oppArray_NEW[x][2] = mov_count_1 ;
	 mov_count_2++ ;

	 if (mov_count_2==context )
	 {
	 mov_count_2 =0 ;
	 mov_count_1 ++ ;
	 }
	 if(mov_count_1>prod_max){
		  mov_count_1= 1 ;
	  mov_count_2= 0 ;
	 }
	 
	  oppArray_NEW[x][3] = context_count_1 ;
	  context_count_1++ ;
	// context_count_2++ ;

	 if (context_count_1 >  context )
	 { 
	 context_count_1 =1  ;
	 }


	 	 oppArray_NEW[x][4] = 0 ;

	}

	  int cur_user = 0 ;
	  int cur_mov = 0 ;
	  int cur_rat = 0;
	  int cur_context=  0 ; 
	  int cur_count = 0 ;
 
	  for (int i = 0; i < rows; ++i) {
         
			cur_user = ippArray[i][0] ;
			cur_mov = ippArray[i][1] ;
			cur_rat = ippArray[i][2] ;
			cur_context = ippArray[i][3] ;
            cur_count = ((cur_user-1) * entries_per_user )+ ((cur_mov-1)* context) + (cur_context - 1 );
		 

		  oppArray_NEW[cur_count][4]=cur_rat ;
		  		  		 
	  }



		/* for(int i =0 ; i < 25;i++) {
			oppArray_NEW[i][0] =i ; 

		}
		*/
		ofstream fout_new_dump ;
		 fout_new_dump.open("new_dump.txt");
		for(int i =0 ; i < SIZE_oppArray_NEW;i++) {
			//  printf("%d , \t",oppArray_NEW[i][1]);
			// printf("%d , \t",oppArray_NEW[i][2]);
			 // printf("%d , \t",oppArray_NEW[i][3]);
			 //  printf("%d , \t",oppArray_NEW[i][4]);
			 //_getch();
			//fout_new_dump << oppArray_NEW[i][0]  ;
			// fout_new_dump << '\t' ;
			//fout_new_dump << oppArray_NEW[i][1]  ;
			// fout_new_dump << '\t' ;
			//fout_new_dump << oppArray_NEW[i][2]  ;
			// fout_new_dump << '\t' ;
			//fout_new_dump << oppArray_NEW[i][3]  ;
			// fout_new_dump << '\t' ;
			//fout_new_dump << oppArray_NEW[i][4]  ;
			// fout_new_dump << '\n' ;

		}

		float P[Rx][f_dec];
		for(int i= 0;i<Rx;i++){
		for(int j =0;j<f_dec;j++){
		P[i][j]= (double)rand() / (double)RAND_MAX  ;
			//P[i][j]= 0.001 ;
			// printf("%f   ",P[i][j]) ;
			// fout1 <<P[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
	float Q[f_dec][Ry];
	for(int i= 0;i<f_dec;i++){
		for(int j =0;j<Ry;j++){
			Q[i][j]= (double)rand() / (double)RAND_MAX  ; 
			//Q[i][j] = 0.001;
			// printf("%f   ",Q[i][j]) ;
			// fout1 <<Q[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
	float B[context];
	for(int j =0;j<context;j++){
		B[j]=(double)rand() / (double)RAND_MAX  ;
		//B[j]=0.001 ;
	}
	float C[Rx];
	for(int i =0;i<Rx;i++){
		C[i]=(double)rand() / (double)RAND_MAX  ;
		//B[j]=0.001 ;
	}
	float D[Ry];
	for(int j =0;j<Ry;j++){
		D[j]=(double)rand() / (double)RAND_MAX  ;
		//B[j]=0.001 ;
	}
	float err_ij_temp , err_mid, err_fin , err_prev ;
		err_fin = 0 ;
	//	err_prev = 0 ;
	for(int TOP=0;TOP<200;TOP++)
{
	err_fin =0;
	for(int a =0 ; a < SIZE_oppArray_NEW;a++)
	{
			int i=oppArray_NEW[a][1];
			int j=oppArray_NEW[a][2];
			int l=oppArray_NEW[a][3];
			if  (oppArray_NEW[a][4]==0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			}  
			float  PQ = 0,PQB=0 ,sum =0,sum1=0;
								// printf("\n == currently processing RN[%d][%d][%d]  " , i,j,l);
								// _getch();
							// printf("\n === before PQ multiplication " ) ;
			                  	for ( int c = i ; c <=i ; c++ )
									{  
										 // fout1 << "\n inside c loop when c = ,  \n" ;
															// fout1 << c  ;
									//	 // printf("\n === inside first for" ) ;
										for (int d = i ; d <= i ; d++ )
											  {
												  // fout1 << "\n inside d loop when d = ,  \n" ;
															// fout1 << d  ;
												//  // printf("\n === inside second for" ) ;
												  for ( int e = 0 ; e < f_dec ; e++ )
													{
													//printf("\n P[%d][%d] = %f",c-1,e,P[c-1][e]) ;
													//printf("\n Q[%d][%d] = %f",e,j-1,Q[e][j-1]) ;
													// _getch();
														sum = sum + P[c-1][e]*Q[e][j-1];

													}
 
											// printf("\n %f",PQ) ;
												   // fout1 << "\n outside  e loop    \n" ;
															
												 PQ = PQ + sum;//*B[l-1] ;

												 // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
												 sum = 0;
												 }
										//printf("\n B[%d]%d %d= %f",l-1,i-1,j-1,B[l-1]) ;
								   //_getch();
									  PQB = PQ*B[l-1];
									}
								
      // printf("\n rating = %d %d %d %d",i-1,j-1,l-1,oppArray_NEW[a][4]) ;
		// printf("\n C[i-1]= %f",C[i-1]);
		//  printf("\n D[j-1]= %f",D[j-1]);
		//  _getch();
			err_ij_temp = (oppArray_NEW[a][4] - (PQB+C[i-1]+D[j-1]+3));//+SQ+C[i]+D[j]+C[i]

			            // fout1 << "\n err_ij_temp =" ;
						// fout1 << err_ij_temp ;
						// fout1 << "\n  ";
			//printf("=== RN val %f   ",New_R[i][j]) ;
			//printf("=== B[j] %f   ",B[j]) ;
	    //  printf("=== \n org err_ij_temp =  %f   ",err_ij_temp ) ;
		//  _getch();
			float sum2=0;
			for(int k=0;k<f_dec;k++)
			{						
            // float Pik_temp = P[i][k] ;
			// float Qkj_temp = Q[k][j] ;
			//printf("===\n P[%d][%d] %f   ",i,k,P[i][k]) ;
			//printf("=== \n Q[%d][%d] %f   ",k,j,Q[k][j]) ;
			//printf("=== \n B[%d] =  %f   ",l,B[l]) ;
			//_getch();
			  P[i-1][k] = P[i-1][k] + 0.01*( err_ij_temp * Q[k][j-1]*B[l-1] - 0.1* P[i-1][k]);
			  Q[k][j-1] = Q[k][j-1] + 0.01*( err_ij_temp * P[i-1][k]*B[l-1] -  0.1* Q[k][j-1]);
			  sum2=sum2+P[i-1][k]*Q[k][j-1];
			 C[i-1]=C[i-1]+0.01*(err_ij_temp-0.1*C[i-1]);
			 D[j-1]=D[j-1]+0.01*(err_ij_temp-0.1*D[j-1]);

			}
			//printf("\n sum2= %f",sum2);
			  // _getch();
			//printf("\n sum2= %f",sum2);
			//printf("\n err_ij_temp= %f",err_ij_temp);
			//_getch();
			B[l-1]   =  B[l-1] + 0.01* (err_ij_temp *sum2 - 0.1 * B[l-1]);
			//C[i]   =  C[i]+0.0001 * (err_ij_temp  - 0.0002 * C[i]);
			}

for(int a =0 ; a < SIZE_oppArray_NEW; a++) 
{
			int i=oppArray_NEW[a][1];
			int j=oppArray_NEW[a][2];
			int l=oppArray_NEW[a][3];
			 if(oppArray_NEW[a][4]==0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			}  
			float  PQ = 0,PQB=0 ,sum =0,sum1=0;
							//	 printf("\n == currently processing RN[%d][%d]  " , i,j);
							// printf("\n === before PQ multiplication " ) ;
			                  	for ( int c = i ; c <=i ; c++ )
									{  
										for (int d = i ; d <= i ; d++ )
											  {												  
												  for ( int e = 0 ; e < f_dec ; e++ )
													{
													 sum = sum + P[c-1][e]*Q[e][j-1];
														
													 }												
												 PQ= PQ+sum;//*B[l-1] ;

												 sum = 0;
												 }

										  PQB=PQ*B[l-1];
									
									 }
// to find Error;

		//printf("\n PQB= %f",PQB);
		//_getch();
			err_fin = err_fin + fabs(oppArray_NEW[a][4] - (PQB+C[i-1]+D[j-1]+3));//+SQ)) ;
			
}

      printf("=== \n error final when top = %d ,  =  %f   ",TOP,err_fin ) ;
//_getch();
// tops ends after this 
}
 _getch(); 
 //float U[Rx-1][Ry-1][context]={0,0,0};
	float temp_sum1 = 0,temp_sum2=0;
	for(int i=0;i<Rx;i++) 
	{
		for(int j=0;j<Ry;j++)
		{
			for(int k=0;k<f_dec;k++)
			{
						   temp_sum1 =   temp_sum1 +  P[i][k]*Q[k][j] ;
				        // temp_sum1 =   temp_sum1 +  P[i][k]*B[j] ;
						
			}
			
			for(int l=1;l<=context;l++)
			{
			 temp_sum2 = temp_sum1*B[l-1]; 
			    fout_new_dump<<i;
				fout_new_dump<<"\t";
				fout_new_dump<<j;
				fout_new_dump<<"\t";
				fout_new_dump<<l;
				fout_new_dump<<"\t";
				fout_new_dump<<temp_sum2+C[i]+D[j]+3;
				fout_new_dump<<"\n";
		}
			temp_sum1 = 0 ;
		}
	}
	
/*for(int i=0;i<Rx-1;i++) 
	{
		for(int j=0;j<Ry-1;j++)
		{
			for(int l=0;l<context;l++)
			{
				fout_new_dump<<i;
				fout_new_dump<<"\t";
				fout_new_dump<<j;
				fout_new_dump<<"\t";
				fout_new_dump<<l;
				fout_new_dump<<"\t";
				fout_new_dump<<U[i][j][l];
				fout_new_dump<<"\n";
			}
		}
}
			*/
    return 0;
}

