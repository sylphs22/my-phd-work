// ranking.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


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
	 const int f_dec = 18;
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
	for(int i= 0;i<Rx;i++){
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
		}}
	/*for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
		//	RN[i][j]=R[i][j];
			if(R[i][j]>4)
			{New_R[i][j]=0.98 ;}
			else if(R[i][j]==4)
				{New_R[i][j]=0.88;}
				else if(R[i][j]==3)
				{New_R[i][j]=0.5;}
			   else if(R[i][j]==2)
			{New_R[i][j]=0.2;}
				else if(R[i][j]==1){New_R[i][j]=0.1;}
			    else New_R[i][j]=0;
		//	printf("current R is > %f \t RN = %f \t",New_R[i][j],RN[i][j]) ;

// _getch();
   }
	}*/
//	_getch();
	// printing RN
	// printf("\n +++ Printing RN matrix +++ \n");
	// fout1 << "--- +++ Printing RN matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =0;j<Ry;j++){
			// printf("%f   ",RN[i][j]) ;
			// fout1 <<RN[i][j]  ;
			// fout1 << '\t' ;
			U[i][j]=0;
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
		P[i][j]= fabs((double)rand() / (double)RAND_MAX)  ;
		//P[i][j]= 0.001 ;
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
			Q[i][j]= fabs( (double)rand() / ((double)RAND_MAX))  ; 
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
		float rat[Ry];
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
for(int i =0;i<Rx;i++){

			for(int j =0;j<Ry;j++){
				if(New_R[i][j]==0) 
				{  
					continue ; 
			      } 
			//	printf("\n == currently processing New_R[%d][%d] %f  " , i,j,New_R[i][j]);
		     //   printf("\n == currently processing S[%d][%d] %d  " , i,j,S[i][j]);
			//	_getch();


			}
		//	_getch();
		}
float err_ij_temp1[f_dec],err_ij_temp2[f_dec] , err_mid, err_fin , err_prev ;
		err_fin = 0 ;
		err_prev = 0 ;
		int b=0;int d=0;
		float A[f_dec],B[f_dec],C[f_dec],D[f_dec];
		  //  float sum_fe=0,sum_rfe=0,sum_PQfe=0;
             float  PQ ,norm2,sum;
			float nor2,sumPQ,PQPQ,norm1,pq,pqpq;
for(int TOP=0;TOP<180;TOP++)
{	
	  err_prev = 0 ;
	  err_fin = 0 ;
	  for ( int e = 0 ; e < f_dec ; e++ )
				{
					err_ij_temp2[e]=0;}
		for(int i= 0;i<Rx;i++){
			
			
		  //  int c=0;
for ( int e = 0 ; e < f_dec ; e++ )
				{
				err_ij_temp1[e]=0;
				A[e]=0;
			//	C[e]=0;
				}
			//B=0;D=0;
	for(int j =0;j<10;j++)
			{
				PQPQ=0;norm2=0;
				PQ=0;sum=0;d=0;	sumPQ=0;
			pq=0;d=S[i][j];
		      nor2=0;
	for ( int e = 0 ; e < f_dec ; e++ )
				{
				A[e]=0;
				B[e]=0;
			//	C[e]=0;D[e]=0;
				}
				if(New_R[i][j]==0) 
				{  
					continue ; 
			      } 
				//c=0;
				
	      for(int k=j;k<Ry;k++)
		  {
				norm2=0;b=0;
				PQ=0;sum =0;
					if(New_R[i][k]==0) 
				{  
					continue ; 
			      }  
			
			b=0;
			// printf ("\n PQPQ %d %d %f",i,j,PQPQ);
		    //  _getch();
			  sumPQ=0;
			            PQ=0; 
				sum=0,norm2=0;
								
				norm1=0;nor2=0;
		      b=S[i][k];
			//  printf("\n k %d",k);
			 // _getch();
			 for ( int e = 0 ; e < f_dec ; e++ )
				{
														
						//printf("\n %d",a) ;
				 sum = sum + P[i][e]*Q[e][b];
				 sumPQ = sumPQ + P[i][e]*Q[e][d];
		        // sum = sum + C[i]*Q[e][j];
		//			printf ("\n Q[%d][%d] %f",e,j,Q[e][j]);
				//			_getch();
                norm1=norm1+ P[i][e]*P[i][e];//;C[i]*C[i]
					 // printf("\norm1 sum %f %f",norm1,sum);
													//_getch();
				norm2=norm2+(Q[e][b]*Q[e][b]);
				nor2=nor2+(Q[e][d]*Q[e][d]);
										// printf("\n norm2 %f",norm2);
										//_getch();
								}
							//_getch();	
										//	printf("\n norm1 norm2[c] %f %f",norm1,norm2[c]);
											//		_getch();
												//	PQ=PQ+sum/(sqrtf((norm1*norm2))) ;		
				        PQ = sum;///(sqrtf((norm1*norm2))) ;
						pq= sumPQ;//(sqrtf((norm1*nor2))) ;
					//	printf("\n pq %d %d %f",i,j,pq);
					//	_getch();
					 for ( int e = 0 ; e < f_dec ; e++ )
				{
					//B=0,D=0;C=0;
				//printf ("\n norm1 norm2 Q[%d][%d] P[%d][%d] PQ %f %f %f %f %f",e,b,i,e,norm1,norm2,Q[e][b],P[i][e],PQ);			
				//_getch();
             //   B[e]=(sqrtf(norm1*nor2)*Q[e][d]- sumPQ*sqrtf(nor2/norm1)*P[i][e])/(norm1*nor2);
				B[e]=2*Q[e][d]/pq ;
				A[e]=A[e]+PQ*(Q[e][b]);//-sqrtf(norm2/norm1)*P[i][e]*sum)/(norm1*norm2));exp(PQ)*

				//A[e]=A[e]+((sqrtf(norm1*norm2)*Q[e][b]-sqrtf(norm2/norm1)*P[i][e]*sum)/(norm1*norm2));
			//	D[e]=(sqrtf(norm1*nor2)*P[i][e]-sumPQ*sqrtf(norm1/nor2)*Q[e][d])/(norm1*nor2);
			//	C[e]=(sqrtf(norm1*nor2)*P[i][e]-sumPQ*sqrtf(norm1/nor2)*Q[e][d])/(norm1*nor2);
			 //   D[e]=P[i][e]/pq;

				//A[e]=A[e]+((sqrtf(norm1*norm2)*Q[e][b]-sqrtf(norm2)*P[i][e]*PQ));
				//C[e]=C[e]+((sqrtf(norm1*norm2)*P[i][e]-sqrtf(norm1)*Q[e][b]*PQ));
			//	C[e]=P[i][e];//exp(pq)*
				
		//	Q[e][b]=Q[e][b]-0.001*(err_ij_temp2-0.01*Q[e][b]);	
			//	C[e]=C[e]+((sqrtf(norm1*norm2)*P[i][e]-sqrtf(norm1)*Q[e][b]*PQ)/(norm1*norm2));
			//printf ("\n A[%d] Q[%d][%d] %f %f ",e,e,b,A[e],Q[e][b]);
			//_getch();
				} 
			//		_getch();					// printf ("\n PQ[%d] %f",c,PQ[c]);
												// _getch();
												 // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
												// sum[c] = 0;
												// norm1=0;
												// norm2[c]=0;
											//	RPQ=RPQ+PQ[c]*New_R[i][j];
											//	RPQ=RPQ+PQ[c]*New_R[i][j];
			             PQPQ=PQPQ+PQ*PQ;
											//	norm12=norm12+norm1*norm2[c];
									//c++;
											//	printf("PQPQ %f",PQPQ);
					//_getch();
			}
					//printf("PQPQ %d %d %f",i,j,PQPQ);
					//_getch();
										 // printf("\n RPQ= %f PQPQ=%f",RPQ,PQPQ);
											//  _getch();
		
			b=0;	
			//pq=0;
			b=S[i][j];
		      nor2=0;norm1=0;
			// printf ("\n PQPQ %d %d %f",i,j,PQPQ);
		    //  _getch();
			  sumPQ=0;
	/*	for ( int e = 0 ; e < f_dec ; e++ )
			{
				//printf("\norm1 sumPQ nor2 %f %f %f",norm1,sumPQ,nor2);

					sumPQ=sumPQ+P[i][e]*Q[e][b];
			         nor2=nor2+(Q[e][b]*Q[e][b]);
					 norm1=norm1+P[i][e]*P[i][e];
					// printf("\norm1 sumPQ nor2 %f %f %f",norm1,sumPQ,nor2);
					// _getch();
		       }
         
		pq=sumPQ/(sqrtf(norm1*nor2));
		b=0;b=S[i][j];
		//printf("\n pq PQPQ %f %f",pq,PQPQ);
		//	_getch();*/
	for ( int e = 0 ; e < f_dec ; e++ )
	{
		//B=0,D=0;C=0;
		//pqpq=pqpq+pq;
	//	B=(sqrtf(norm1*nor2)*Q[e][b]- sumPQ*sqrtf(nor2/norm1)*P[i][e])/(norm1*nor2);
	//	B=((norm1*nor2)- sqrtf(nor2/norm1)*P[i][e])/(norm1*nor2);

		//printf("\n %d",b);
	//	B=B/pq;
	//    D=(sqrtf(norm1*nor2)*P[i][e]-sumPQ*sqrtf(norm1/nor2)*Q[e][b])/(norm1*nor2);
	//	D=(sqrtf(norm1*nor2)*P[i][e]-pq*sqrtf(norm1)*Q[e][b]);
	//	C=(sqrtf(norm1*nor2)*P[i][e]-pq*sqrtf(norm1)*Q[e][b]);
		//D=D/pq;
		
		A[e]=A[e]/PQPQ;
	//	C[e]=C[e]/PQPQ;
		
							//}
		//	printf("hello %d %d %d",i,j,b);
		//_getch();
			//	printf("\nerr_ij_temp1 %f",err_ij_temp1) ;

	//	printf("\n A[%d] C[%d] B D %f %f %f %f,%d,%d",e,e,A[e],C[e],B,D,i,b) ;
			//_getch();

				//			_getch();
				    // err_ij_temp2=0;//err_ij_temp1=0;
           //  for ( int e = 0 ; e < f_dec ; e++ )
							//	{
					//err_ij_temp1[e]=0;err_ij_temp2[e]=0;
              err_ij_temp1[e]=err_ij_temp1[e]+(A[e]-B[e]);
				//	 err_ij_temp2[e]=err_ij_temp2[e]+((C[e])-D[e]);//err_ij_temp1=(A[e]-B);
			//	printf("\n err_ij_temp2[%d] err_ij_temp1[%d] %f %f %d %d",e,e,err_ij_temp2[e],err_ij_temp1[e],i,j) ;
		//	_getch();
		      //  Q[e][b]=Q[e][b]-0.001*(err_ij_temp2);//-0.01*Q[e][b]);
			//	Q[e][b]=Q[e][b]-0.001*(err_ij_temp2-0.01*Q[e][b]);
			//	Q[e][b]=Q[e][b]-0.001*(err_ij_temp2-0.01*Q[e][b]);
		        //P[i][e]=P[i][e]-0.0000001*(err_ij_temp1+0.01*P[i][e]);
				//printf("\nQ[%d][%d] p[%d][%d] %f %f",e,b,i,e,Q[e][b],P[i][e]);
	/*for(int k=j+1;k<Ry;k++)
		  {			

			  b=0;
			  if(New_R[i][k]==0) 
				{  
					continue ; 
			      }  
			  b=S[i][k];
			// printf("\n b %d %d ,C[%d] %f",b,k,e,C[e]);
			//_getch();
			  Q[e][b]=Q[e][b]-0.001*(C[e]);
				}
			 }*/
	      //  _getch();
	}
}
	for ( int e = 0 ; e < f_dec ; e++ )
	{	
		//printf("\n err_ij_temp1[%d] %d  %f",e,i,err_ij_temp1[e]) ;
		//_getch();
		  P[i][e]=P[i][e]-0.001*(err_ij_temp1[e]);//-0.01*P[i][e]);//-0.01*P[i][e]);
			//err_ij_temp2[e]=err_ij_temp2[e]+(C[e]-D[e]);				
	}
	

}
float err_ij_temp3[f_dec];
//for(int i= 0;i<Rx;i++){
for(int j =0;j<10;j++)
			{
//	for(int e= 0;e<f_dec;e++){

	//		err_ij_temp2[e]=0;
	//		err_ij_temp3[e]=0;
	//	}
for(int i= 0;i<Rx;i++){
		PQPQ=0;
		if(New_R[i][j]==0) 
				{  
					continue ; 
			      } 

		for(int e= 0;e<f_dec;e++){

			err_ij_temp2[e]=0;
			err_ij_temp3[e]=0;
		}
		for(int l= 0;l<Rx;l++){
				d=0;d=S[i][j];
				if(New_R[l][j]==0) 
				{  
					continue ; 
			      } 
			//	d=0;d=S[l][j];
			//	if (i==l) continue;
				
				if (d==S[l][j]) 
				{
			//	printf ("\n S[i][j] S[l][j] %d %d",S[i][j],S[l][j]);
			//	_getch();
		for(int k=j;k<Ry;k++)
		  {
				norm2=0;b=0;
				PQ=0;sum =0;
					if(New_R[i][k]==0) 
				{  
					continue ; 
			      }  
			
			b=0;
			// printf ("\n PQPQ %d %d %f",i,j,PQPQ);
		    //  _getch();
			  sumPQ=0;
			            PQ=0; 
				sum=0,norm2=0;
								
				norm1=0;nor2=0;
		      b=S[i][k];
			// printf("\n b d %d %d",b,d);
			// _getch();
			 for ( int e = 0 ; e < f_dec ; e++ )
				{
														
						//printf("\n %d",a) ;
				 sum = sum + P[l][e]*Q[e][b];
				 sumPQ = sumPQ + P[l][e]*Q[e][d];
		        // sum = sum + C[i]*Q[e][j];
		//			printf ("\n Q[%d][%d] %f",e,j,Q[e][j]);
				//			_getch();
             //   norm1=norm1+ P[i][e]*P[i][e];//;C[i]*C[i]
					 // printf("\norm1 sum %f %f",norm1,sum);
													//_getch();
			//	norm2=norm2+(Q[e][b]*Q[e][b]);
			//	nor2=nor2+(Q[e][d]*Q[e][d]);
										// printf("\n norm2 %f",norm2);
										//_getch();
								}
							//_getch();	
										//	printf("\n norm1 norm2[c] %f %f",norm1,norm2[c]);
											//		_getch();
												//	PQ=PQ+sum/(sqrtf((norm1*norm2))) ;		
				        PQ = sum;//(sqrtf((norm1*norm2))) ;
						pq= sumPQ;//(sqrtf((norm1*nor2))) ;
					//	printf("\n pq %d %d %f",i,j,pq);
					//	_getch();
						 PQPQ=PQPQ+PQ*PQ;
		}
		for ( int e = 0 ; e < f_dec ; e++ )
				{
				//	err_ij_temp2[e]=0;
				//C[e]=P[i][e]/PQPQ ;
				//D[e]=P[i][e]/pq;
			//err_ij_temp2[e]=((P[i][e]/PQPQ)-(P[i][e]/pq));
			//printf("\n err_ij_temp2[%d] %d %d %f",e,i,l,err_ij_temp2[e]) ;
			//_getch();
			err_ij_temp2[e]=err_ij_temp2[e]+((PQ*P[l][e]/PQPQ)-(2*P[l][e]/pq));
		//	err_ij_temp3[e]=err_ij_temp3[e]+(PQ*P[l][e]/PQPQ);
			//	Q[e][d]=Q[e][d]-0.001*(err_ij_temp2[e]);
		}}}
			/*	else {
			for ( int e = 0 ; e < f_dec ; e++ )
				{
				//	err_ij_temp2[e]=0;
				//C[e]=P[i][e]/PQPQ ;
				//D[e]=P[i][e]/pq;
			//err_ij_temp2[e]=((P[i][e]/PQPQ)-(P[i][e]/pq));
			printf("\n err_ij_temp2[%d] %d  %f",l,i,err_ij_temp2[e]) ;
		_getch();
			err_ij_temp2[e]=err_ij_temp2[e]+((P[i][e]/PQPQ)-(P[i][e]/pq));
			//	Q[e][d]=Q[e][d]-0.001*(err_ij_temp2[e]);
		}}*/
	///	}
			//}
		
	//for(int l= 0;l<Rx;l++){	
			//	d=0;d=S[i][j];
				if(New_R[i][j]==0) 
				{  
					continue ; 
			      } 
				d=0;d=S[i][j];

			//if (S[i][j]==S[l][j]) continue;
	for ( int e = 0 ; e < f_dec ; e++ )
				{
			//	printf("\n b d %d %d",b,d);
			//_getch();
	Q[e][d]=Q[e][d]-0.001*(err_ij_temp2[e]);//-0.01*Q[e][d]);
	//}
/*	for(int k=j+1;k<Ry;k++)
		  {
			  b=0;
			  if(New_R[i][k]==0) 
				{  
					continue ; 
			      }  
			  b=S[i][k];
			  Q[e][b]=Q[e][b]-0.01*(err_ij_temp3[e]);
				}*/
		        //P[i][e]=P[i][e]-0.0000001*(err_ij_temp1+0.01*P[i][e]);
				//printf("\nQ[%d][%d] p[%d][%d] %f %f",e,b,i,e,Q[e][b],P[i][e]);
	}
	      //  _getch();
//}
//}
	//b=S[i][j];

		//_getch();							
}//j
//}//i
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
		 b=0;
		for(int j=0;j<Ry;j++)
		{
			b=0;
			b=S[i][j];
			for(int k=0;k<f_dec;k++)

			{
				
					  temp_sum1 =   temp_sum1 +  P[i][k]*Q[k][b] ;//C[i]*Q[k][j] ;
					//	 printf("\n temp_sum1 %f %f %f %d %d",temp_sum1,P[i][k],Q[k][b],k,b);
					//	 _getch();
				        tempnorm1 =   tempnorm1 +  P[i][k]*P[i][k] ;//C[i]*C[i] ;
						tempnorm2 =   tempnorm2 +  Q[k][b]*Q[k][b] ;
			}
			 tempnorm1=sqrtf(tempnorm1);
			 tempnorm2=sqrtf(tempnorm2);
			// printf("\n temp_sum1 %f %f",temp_sum1,U[i][b]);
					//	 _getch();
			 U[i][b] = (temp_sum1)/(tempnorm1*tempnorm2) ; 
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
			b=0;
			b=S[i][j];
		if (V[i][b]==0) {continue;}
		if (New_R[i][j]!=0){continue;}
			
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << b; 
		fout1<< "\t ";
		fout1 << U[i][b];//+C[i]+D[j];
		//fout1<< "\t ";
		fout1 << "\n ";
			//fout00<<"\t";
		}
		//fout1 << "\n ";
		//fout00<<"\n";
 }
 
/*float temp_Uab , temp_COSab, temp_COSabRN , temp_SUM_COSabRN , temp_SUM_COSab,Cos_storage[Ry-1],Cos_RN_storage[Ry-1];
// iterating RN to find unrated element 
	float cosine[Ry-1];
	for(int i=0;i<Rx;i++){
	for(int j=0;j<Ry;j++){
		
		if(New_R[i][j] != 0) continue ; // skipping for already rated items
	int	Cos_storage_count=0 ;
		for(int a=0;a<(Ry-1);a++)
		{
	      Cos_storage[a] = 0 ;
	      Cos_RN_storage[a] = 0 ;
		  cosine[a] = 0;
        }
		    temp_COSab = 0 ;
			temp_COSabRN = 0 ;
			temp_SUM_COSabRN = 0 ;
			temp_SUM_COSab = 0 ;
			a=0 ;
		for(int k = 0 ; k <Ry ; k++) // finding rated rows for that unrated item 
		{
			if (k==j) continue ; // skipping the same row
			//
			//printf("\n New_R[i][k] %f",New_R[i][k]);
			//printf("\n U[i][k] %f",U[i][k]);
			//printf("\n U[i][j] %f",U[i][j]);
			//_getch();
			temp_COSab=U[i][j];
			//printf("\n Cos_storage[a] %f",Cos_storage[a]);
			//_getch();
			if(New_R[i][k] == 0) continue ;
			//printf("\n temp_COSab %f",temp_COSab);
			Cos_storage[a]=abs(temp_COSab-U[i][k]);
			cosine[a]=U[i][k];
			Cos_RN_storage[a] = New_R[i][k]*U[i][k];
			//printf("\n Cos_storage[a] %f",Cos_storage[a]);
			//printf("\n cosine[a] %f",cosine[a]);
			//printf("\n Cos_RN_storage[a] %f",Cos_RN_storage[a]);
			//_getch();
			a++ ;	
		} 
		//printf("a %d",a);
		//getch();
		
		/*  sorting begins ... 
		//printf("b4 sortn  logic");
  float sort_temp,sort_temp1,pred_sorted,sort_temp2;
    for (int si = 0; si < a; ++si)
    {
        for (int sj = si + 1; sj < a; ++sj)
        {
            if (Cos_storage[si] > Cos_storage[sj])
            {
                sort_temp = Cos_storage[si];
                Cos_storage[si] = Cos_storage[sj];
                Cos_storage[sj] = sort_temp;
				sort_temp1 = Cos_RN_storage[si];
                Cos_RN_storage[si] = Cos_RN_storage[sj];
                Cos_RN_storage[sj] = sort_temp1;
				 sort_temp2 = cosine[si];
                cosine[si] = cosine[sj];
                cosine[sj] = sort_temp2;
				 }			
        }
		//printf("\n Cos_storage[si]%f",Cos_storage[si]);
		//printf("\n cosine[si]%f",cosine[si]);
		//printf("\n Cos_RN_storage[si]%f",Cos_RN_storage[si]);
		//_getch();
    }
	//printf("after sortn  logic");
	// sorting ends 
	float temp_sig_sort_cos = 0 ;
	float temp_sig_sort_cosRN = 0 ;
	for(int si = 0 ; si <30 ; si++)
	{

		temp_sig_sort_cos = temp_sig_sort_cos + (cosine[si]) ;
		temp_sig_sort_cosRN = temp_sig_sort_cosRN + Cos_RN_storage[si] ;
	}
	
	    V[i][j]= (temp_sig_sort_cosRN /temp_sig_sort_cos);
	
//for(int i=0;i<Rx;i++){
//	for(int j=0;j<Ry;j++){
		
	//	if(New_R[i][j] != 0) continue ; // skipping for already rated items

		//printf ("\n for RN[%d}[%d] pred value is %f",i,j , pred_sorted) ;
		//_getch();
		fout1 << "\n ";
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << j ; 
		fout1 << "\t ";
		fout1 << (V[i][j]);//+C[i]+D[j])+3.52
	 }

}
*/


    return 0;
	


}

    

