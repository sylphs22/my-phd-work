// ranking.cpp : Defines the entry point for the console application.
//

//#include "stdafx.h"


// ConsoleApplication10.cpp : Defines the entry point for the console application.


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
	 const int f_dec = 150;
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
		//	// printf("[%d][%d] , %d \t" , i , j,ippArray[i][j] );
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
	
	int usercount = ippArray[rows-1][0];
	// printf("\n user count => = %d",usercount) ;
	int opprows = usercount;
	   int** oppArray = new int*[opprows];
	   int** timeArray = new int*[opprows];
	   float** New_R  = new float*[opprows]  ;    
     float** RN = new float*[opprows]  ; 
     float** U = new float*[opprows]  ; 
	 float** V = new float*[opprows]  ;
	  float** P = new float*[opprows]  ;
	   float** Q = new float*[f_dec]  ;
	   int** S = new int*[opprows]  ;
	   float** W = new float*[opprows]  ;
	   float** R= new float*[opprows]  ;
   //float P[Rx][f_dec] ;
	//  float Q[f_dec][Ry] ;
	   // float S[Rx][f_dec] 
//	  cin.get();
	
	for(int x=0 ; x<(opprows+1);x++) {
	oppArray[x] = new int[prod_max];
	timeArray[x]=new int[prod_max];
	New_R[x] = new float[prod_max];
	RN[x] = new float[prod_max];
	U[x] = new float[prod_max];
	V[x] = new float[prod_max];
	P[x] =  new float[f_dec];
	S[x] =  new int[prod_max];//chnaging S to incorporate the item numbers
	W[x] = new float[prod_max];
	R[x] = new float[prod_max];
	}
	
	for(int x=0 ; x<(f_dec);x++) {
	Q[x] = new float[prod_max];
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
	 for (int i = 0; i <  rows; ++i) {
        
			oppArray[ippArray[i][0]-1][ippArray[i][1]]=ippArray[i][2] ;
			timeArray[ippArray[i][0]-1][ippArray[i][1]]=ippArray[i][3] ;

		//	// printf("[%d][%d] , %d \t" , i , j,ippArray[i][j] );
           // // cout << ippArray[i][j] << " ";
        }
         
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
	 // printf("\n**********  final output \n" );
	 ofstream   foutf_dec1 ;
	// foutf_dec1.open("OUT.TXT");
	 for (int i = 0; i < opprows; ++i) {
        for (int j = 1; j <= prod_max; ++j) {
			
		//	// printf("[%d][%d] , %d  ," , i , j,oppArray[i][j] );
			// foutf_dec1 << oppArray[i][j] ;
			// foutf_dec1 << "\t *" ;
			R[i][j-1]= oppArray[i][j] ;
			V[i][j-1]=timeArray[i][j];
			W[i][j-1]=j-1;
		// printf(" \n \n ****** S[%d][%d]  %d \n>     ",i,j-1,S[i][j-1] );
		// _getch();
		//	// cout << oppArray[i][j] ;
		//	int val = (int)strtol(oppArray[i][j], (char **)NULL, 10);
			// printf(" \n  ****** current oppArray -> %f   \n>     ",oppArray[i][j]);
			 // printf(" \n  ****** New_R val -> %f   \n>     ",New_R[i][j-1]); // _getch();
			//// printf(" \n  ******  oppArray[i][j]-0  %d   \n>     ",oppArray[i][j]-'0');
			
           // // cout << ippArray[i][j] << " ";
        }
		
		// foutf_dec1 << "\n" ;
        // cout << endl;
		//_getch();
	

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
	 fout00.open("Similarity_dump.txt");
	// fout8.open("new_PQS_dump.txt");
	// foutf_dec.open("err_data.csv");
	 fout1.open("dump.txt");
	//fout2.open("dump1.txt");
	// fout7.open("new_dump.txt");
	// fout16.open("new_dump.csv");
	// fout9f_dec.open("Q_data.txt");
	
	// initialiQqing R matrix with Rx rows and Ry colums
	
	 
//	float  oppArray[9][61]  ; org R array was defined here 
	// printf("\n +++ Printing R matrix +++ \n");
	// fout1 << "--- +++ Printing R matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
			// printf(" in R block oppArray > %f   ",New_R[i][j]) ;  
			// fout1 <<New_R[i][j]  ;
		//	W[i][j]=(double)rand() / ((double)RAND_MAX)  ;
			New_R[i][j]=0;
			S[i][j]=0;
			// fout1 << '\t' ;
		}
		// printf("\n");
		// fout1 <<'\n' ;
	}
//	_getch();
	// normaliQqing R by dividing by 5 , into RN
	
// NEWCOMMENT	float RN[Rx][Ry] ;
/*	for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
		//	RN[i][j]=R[i][j];
			if(R[i][j]>4)
			{RN[i][j]=1 ;}
			else if(R[i][j]==4)
				{RN[i][j]=0.75;}
				else if(R[i][j]==3)
				{RN[i][j]=0.5;}
			   else if(R[i][j]==2)
			{RN[i][j]=0.25;}
				else if(R[i][j]==1){RN[i][j]=0.1;}
			    else RN[i][j]=0;
		}}*/
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
		//	RN[i][j]=R[i][j];
			if(R[i][j]>4)
			{New_R[i][j]=1;}
			else if(R[i][j]==4)
				{New_R[i][j]=0.9;}
				else if(R[i][j]==3)
				{New_R[i][j]=0.3;}
			   else if(R[i][j]==2)
			{New_R[i][j]=0.2;}
				else if(R[i][j]==1){New_R[i][j]=0.1;}
			    else New_R[i][j]=0;
		//	printf("current R is > %f \t RN = %f \t",New_R[i][j],RN[i][j]) ;

// _getch();
   }
	}
//	_getch();
	// printing RN
	// printf("\n +++ Printing RN matrix +++ \n");
	// fout1 << "--- +++ Printing RN matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
			// printf("%f   ",RN[i][j]) ;
			// fout1 <<RN[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n");
		// fout1 << '\n' ;
	}
//	_getch();
	//  Declaring P Matrix ,  here  9 X f_dec
//	float P[Rx][f_dec] ;
	// printf("\n +++ Printing P matrix +++ \n");
	// fout1 << "--- +++ Printing P matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<f_dec;j++){
		P[i][j]= (double)rand() / (double)RAND_MAX  ;
		//	P[i][j]= 0.001 ;
			// printf("%f   ",P[i][j]) ;
			// fout1 <<P[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
//	_getch();
	//  Declaring Q Matrix  ..actually should be 61 X f_dec.. 
	// but will be using f_dec X 61 as Q' will be used everywhere
//	float Q[f_dec][Ry] ;
	// printf("\n +++ Printing Q matrix +++ \n");
	// fout1 << "--- +++ Printing Q' matrix +++ ---\n" ;
	for(int i= 0;i<f_dec;i++){
		for(int j =0;j<Ry;j++){
			Q[i][j]=  (double)rand() / ((double)RAND_MAX)  ; 
			//Q[i][j] = 0.01;
			// printf("%f   ",Q[i][j]) ;
			// fout1 <<Q[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
//	_getch();
	//  Declaring S Matrix  here 9 X f_dec
	// float S[Rx][f_dec] ;
	// printf("\n +++ Printing S matrix +++ \n");
	// fout1 << "--- +++ Printing S matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<f_dec;j++){
			// S[i][j]= (double)rand() / ((double)RAND_MAX)  ;  
			//S[i][j] = 0.01 ;
			// printf("%f   ",S[i][j]) ;
			// fout1 <<S[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
	//	_getch();

	///sorting algorithm


		//  starting Error calculation 
	/*	float rat[Ry];
		int it[Ry];
		for(int i= 0;i<Rx;i++){
			// fout1 << "--- +++ Inside i loop # +++ ---" ;
        	// fout1 << i  ;
	     // fout1 << '\n' ;
			
		for(int j =0;j<Ry;j++){
			rat[j]=0;
			it[j]=0;
			// fout1 << "--- +++ Inside jloop # +++ ---" ;
        	// fout1 << j  ;
	     // fout1 << '\n' ;
		//	if(New_R[i][j]==0) 
				//{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
				//	continue ; 
			//}  // bypassing
			rat[j]=RN[i][j];
			it[j]=W[i][j];
		}
			//printf("\n == rat[%d] %f " , j,rat[j]);		
		       //   printf("\n ==  it[%d] %d " , j,it[j]);
				//_getch();
			float sort_temp=0,sort_temp1=0;
			for (int sj = 0; sj <=Ry; sj++)
			{
			for (int j = 0; j < Ry; j++)
    {
       // for (int sj = si + 1; sj < Ry; ++sj)
      //  {
            if (rat[j] < rat[j+1])
            {
                sort_temp = rat[j];
                rat[j] = rat[j+1];
                rat[j+1] = sort_temp;
				sort_temp1 = it[j];
                it[j] = it[j+1];
                it[j+1] = sort_temp1;
				 
            }
     //  }
   }
                    
		}
		for(int j =0;j<Ry;j++){
		//	New_R[i][j]=0;
		//	S[i][j]=0;
			New_R[i][j]=rat[j];
			S[i][j]=it[j];
		     //PQ[j] = 0        
		}
		//printf("hello");
		}
/*for(int i =0;i<Rx;i++){

			for(int j =0;j<Ry;j++){

				printf("\n == currently processing New_R[%d][%d] %f  " , i,j,New_R[i][j]);
		        printf("\n == currently processing S[%d][%d] %d  " , i,j,S[i][j]);
				_getch();


			}
		}*/
float err_ij_temp1,err_ij_temp2[f_dec] , err_mid, err_fin , err_prev, PQPQ[Rx],RR[Rx];
float A[f_dec],B[f_dec],C[f_dec],D[f_dec];
//float nor1,RR=0,norm1;
 float  PQ ,norm2,sum,norm1;
		err_fin = 0 ;
		err_prev = 0 ;
		int b=0;
for(int TOP=0;TOP<150;TOP++)
{
	
//	  err_prev = 0 ;
//	  err_fin = 0 ;
		for(int i= 0;i<Rx;i++){
			
			//float A[f_dec],B[f_dec],C[f_dec],D[f_dec];
		  //  float sum_fe=0,sum_rfe=0,sum_PQfe=0;
			for ( int e = 0 ; e < f_dec ; e++ )
			{
				A[e]=0;B[e]=0;
			}
          //  float  PQ ,norm2,sum;
			//float nor1,RR=0,norm1;
		    int c=0;
			PQPQ[i]=0;
			RR[i]=0;
			for(int j =0;j<Ry;j++){
				norm2=0;
				PQ=0;sum =0;
					if(New_R[i][j]==0) 
				{  
					continue ; 
			      }  
			
			                    PQ=0; 
								sum=0,norm2=0;
							//	b=0;
								norm1=0;
								//int a=0;
							//	b=S[i][j];
						//	printf("\n == currently processing RN[%d][%d] %f " , i,j,New_R[i][j]);
						//	_getch();
			 for ( int e = 0 ; e < f_dec ; e++ )
					 {
														
														//printf("\n %d",a) ;
								 sum = sum + P[i][e]*Q[e][j];
													// sum = sum + C[i]*Q[e][j];
										//			printf ("\n Q[%d][%d] %f",e,j,Q[e][j]);
										//			_getch();
                                 norm1=norm1+ P[i][e]*P[i][e];//;C[i]*C[i]
													//  printf("\norm1 %f",norm1);
													//_getch();
							    norm2=norm2+(Q[e][j]*Q[e][j]);
										// printf("\n norm2[c] %f",norm2[c]);
										//_getch;
							}
			
										//	printf("\n norm1 norm2[c] %f %f",norm1,norm2[c]);
											//		_getch();
												//	PQ=PQ+sum/(sqrtf((norm1*norm2))) ;		
		PQ= PQ+sum/(sqrtf(norm1*norm2)) ;
												 
				 for ( int e = 0 ; e < f_dec ; e++ )
			{
	A[e]=A[e]+(((Q[e][j]*sum*norm1*norm2)-(sum*sum*(norm2)*P[i][e]))/(norm1*norm2*norm1*norm2));
	B[e]=B[e]+(((Q[e][j]*sqrtf(norm1*norm2)*New_R[i][j])-(New_R[i][j]*sum*sqrtf(norm2/norm1)*P[i][e]))/(norm1*norm2));
			 }
					// printf("\n PQPQ[%d] RR[%d] %f %f",i,i,PQPQ[i],RR[i]);
					//	_getch();
								//RR=RR+New_R[i][j]*New_R[i][j];
								RR[i]=RR[i]+PQ*New_R[i][j];
			                    PQPQ[i]=PQPQ[i]+PQ*PQ;
											//	norm12=norm12+norm1*norm2[c];
										      // 	c++;
							}
	
			for ( int e = 0 ; e < f_dec ; e++ )
		{
		//printf("\n RR PQPQ[%d]  %f",i,PQPQ[i]);
		//_getch();
				P[i][e]=P[i][e]-0.009*((A[e]/PQPQ[i])-(B[e]/RR[i]));//+0.01*P[i][e]);					
}//j
}//i
for(int j =0;j<Ry;j++)
	{
				norm2=0;
				PQ=0;sum =0;//PQPQ=0;
 for ( int e = 0 ; e < f_dec ; e++ )
			{
				C[e]=0,D[e]=0;
				err_ij_temp2[e]=0;
				}
 for(int i =0;i<Rx;i++)
	{
					if(New_R[i][j]==0) 
				{  
					continue ; 
			      }  

								//int a=0;
								//b=S[i][j];
	
						//	printf("\n == currently processing RN[%d][%d] %f " , i,j,New_R[i][j]);
						//	_getch();
	/*	for ( int e = 0 ; e < f_dec ; e++ )
			{
				C[e]=0,D[e]=0;
				err_ij_temp2[e]=0;
				}
for(int k =0;k<Rx;k++)
	{
		if(New_R[k][j]==0) 
				{  
					continue ; 
			      }  
		if(b==New_R[k][j])*/
			
					 PQ=0; 
								sum=0,norm2=0;
							//	b=0;
								norm1=0;
			 for ( int e = 0 ; e < f_dec ; e++ )
				{
														
														//printf("\n %d",a) ;
				 sum = sum + P[i][e]*Q[e][j];
													// sum = sum + C[i]*Q[e][j];
										//			printf ("\n Q[%d][%d] %f",e,j,Q[e][j]);
										//			_getch();
                 norm1=norm1+ P[i][e]*P[i][e];//;C[i]*C[i]
													//  printf("\norm1 %f",norm1);
													//_getch();
			     norm2=norm2+(Q[e][j]*Q[e][j]);
										// printf("\n norm2[c] %f",norm2[c]);
										//_getch;
		    }
			
										//	printf("\n norm1 norm2[c] %f %f",norm1,norm2[c]);
											//		_getch();
												//	PQ=PQ+sum/(sqrtf((norm1*norm2))) ;		
				 PQ= PQ+sum/(sqrtf(norm1*norm2)) ;																							
										 // printf("\n RPQ= %f PQPQ=%f",RPQ,PQPQ);
              for ( int e = 0 ; e < f_dec ; e++ )
					{
				//printf("\n PQPQ[%d] %f",i,PQPQ[i]);
				//_getch();
					err_mid=0;
					err_fin=0;
					//C[e]=0,D[e]=0;
			//	err_ij_temp2=0;
			//C[e]=C[e]+(1/PQPQ[i])*(((P[i][e]*sum*norm1*norm2)-(2*sum*sum*(norm1)*Q[e][j]))/(norm1*norm2*norm1*norm2));
			err_mid=(((P[i][e]*sum*norm1*norm2)-(sum*sum*(norm1)*Q[e][j]))/(norm1*norm2*norm1*norm2));
			C[e]=C[e]+(err_mid/PQPQ[i]);
			err_fin=(((P[i][e]*sqrtf(norm1*norm2)*New_R[i][j])-(New_R[i][j]*sum*sqrtf(norm1/norm2)*Q[e][j]))/(norm1*norm2));
			//D[e]=D[e]+(1/RR[i])*(((P[i][e]*sqrtf(norm1*norm2)*New_R[i][j])-(New_R[i][j]*sum*sqrtf(norm1/norm2)*Q[e][j]))/(norm1*norm2));
			D[e]=D[e]+(err_fin/RR[i]);  
			//	err_ij_temp2[e]= (C[e]/PQPQ)-(D[e]/RR);
				//Q[e][j]=Q[e][j]+0.001*(err_ij_temp2);//-0.1*Q[e][j]);
				//P[i][e]=P[i][e]-0.001*(A[e]-(sqrtf(RR)*B[e]/(sqrtf(PQPQ))));		 
						 
						 }
						 
						 //  _getch();
							
		
								}
for(int i =0;i<Rx;i++)
	{   
		//b=0;b=S[i][j];
					if(New_R[i][j]==0) 
				{  
					continue ; 
			      } 
	   for ( int e = 0 ; e < f_dec ; e++ )
		{
			//printf("\n PQPQ  %f ",(C[e])-(D[e]));
			//_getch();
			Q[e][j]=Q[e][j]-0.009*((C[e])-(D[e]));//+0.01*Q[e][j]);
	   }
		}
}
/*  err_prev = 0 ;
	  err_fin = 0 ;
	  float sum_PQ=0,sum_RPQ=0,sum_NPQ=0,sum_NRPQ=0,sum_RR=0,sum_NRR=0;
		for(int i= 0;i<Rx;i++){
			// fout1 << "--- +++ Inside i loop # +++ ---" ;
        	// fout1 << i  ;
	     // fout1 << '\n' ;
			float  PQ = 0 ,sum =0,norm1=0,norm2=0,RPQ=0,PQPQ=0,RR=0;
			 sum_PQ=0,sum_RPQ=0,sum_RR=0;
			 float PPQR=0,PPQ=0;
		    float sum_fe=0,sum_rfe[f_dec],sum_PQfe[f_dec];
			for(int j =0;j<Ry;j++){

			
			// fout1 << "--- +++ Inside jloop # +++ ---" ;
        	// fout1 << j  ;
	     // fout1 << '\n' ;
			
			if(New_R[i][j]==0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			}  
			
			                     PQ = 0 ,sum =0,norm1=0,norm2=0;
								int a=0;
							//printf("\n == currently processing RN[%d][%d]  " , i,j);
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
														a=S[i][j];
														//printf("\n %d",a) ;
													 sum = sum + P[c][e]*Q[e][a];
													// sum = sum + C[i]*Q[e][j];
                                                      norm1=norm1+ P[c][e]*P[c][e];//;C[i]*C[i]
													  norm2=norm2+Q[e][a]*Q[e][a];
														//sum = sum + P[c][e]*B[j];
														// fout1 << "inner temp PQ ="  ;
												        // fout1 << sum  ;
												         // fout1 << "\n"  ;
														//sum = 0;
														//_getch();
													 }
 
											//	 // 
												   // fout1 << "\n outside  e loop    \n" ;
															
												 PQ= PQ+sum/(sqrtf((norm1*norm2))) ;

												 // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
												 sum = 0;
												 norm1=0;
												 norm2=0;
												
												 }
										

								}
			
		       sum_RPQ=sum_RPQ+PQ*New_R[i][j];
			  sum_PQ=sum_PQ+PQ*PQ;
			  sum_RR=sum_RR+New_R[i][j]*New_R[i][j];

			  //	printf("\n  sum_RPQ sum_PQ %f %f",sum_RPQ,sum_PQ);
			//	_getch();
		    
		}
		   sum_NRPQ=log(sum_RPQ);
			sum_NPQ=0.5*log(sum_PQ);
			sum_NRR=0.5*log(sum_RR);
		//printf("\n sum_NPQ %f sum_NRPQ %f sum_NRR %f",sum_NPQ,sum_NRPQ,sum_NRR);
		//_getch();
//}
			err_fin=err_fin +(sum_NPQ+sum_NRR-sum_NRPQ);
			//printf ("\n err_fin %f",err_fin);
			//_getch();
}
printf ("\n err_fin %d %f",TOP,err_fin);

}//top
_getch();
		           
*/
}		
	float temp_sum1 = 0,tempnorm1=0,tempnorm2=0 ;
	for(int i=0;i<Rx;i++) 
	{
		// b=0;
		for(int j=0;j<Ry;j++)
		{
		//	b=0;
		//	b=S[i][j];
			for(int k=0;k<f_dec;k++)

			{
				// printf("\n tempsum1 %f",temp_sum1);
				// getch();
						 temp_sum1 =   temp_sum1 +  P[i][k]*Q[k][j] ;//C[i]*Q[k][j] ;
				         tempnorm1 =   tempnorm1 +  P[i][k]*P[i][k] ;//C[i]*C[i] ;
						 tempnorm2 =   tempnorm2 +  Q[k][j]*Q[k][j] ;
			}
			 tempnorm1=sqrtf(tempnorm1);
			 tempnorm2=sqrtf(tempnorm2);
			 U[i][j] = (temp_sum1/(tempnorm1*tempnorm2)) ; 
			 temp_sum1 = 0 ;
			 tempnorm1=0;
			 tempnorm2=0;
		}
	}
 for(int i=0;i<Rx;i++) 
	{
		//int b=0;
 for(int j=0;j<Ry;j++)
		{ 
		//	b=0;
		//	b=S[i][j];
		if (V[i][j]==0) {continue;}
		if (New_R[i][j]!=0){continue;}
			
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << j; 
		fout1<< "\t ";
		fout1 << U[i][j];//+C[i]+D[j];
		//fout1<< "\t ";
		fout1 << "\n ";
			//fout00<<"\t";
		}
		//fout1 << "\n ";
		//fout00<<"\n";
 }
 



    return 0;
	


}

    

