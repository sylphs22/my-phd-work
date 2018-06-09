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
	 const int f_dec = 5;
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
   
	  
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < 4; ++j) {
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
	
	for(int x=0 ; x<(opprows+1);x++) {
	oppArray[x] = new int[prod_max];
	New_R[x] = new float[prod_max];
	RN[x] = new float[prod_max];
	U[x] = new float[prod_max];
	V[x] = new float[prod_max];
	P[x] =  new float[f_dec];
	S[x] =  new float[f_dec];
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
	fout2.open("dump1.txt");
	// fout7.open("new_dump.txt");
	// fout16.open("new_dump.csv");
	// fout9f_dec.open("Q_data.txt");
	
	// initialiQqing R matrix with Rx rows and Ry colums
	
	 
//	float  oppArray[9][61]  ; org R array was defined here 
	// printf("\n +++ Printing R matrix +++ \n");
	// fout1 << "--- +++ Printing R matrix +++ ---\n" ;
	for(int i= 0;i<Rx;i++){
		for(int j =1;j<Ry;j++){
			// printf(" in R block oppArray > %f   ",New_R[i][j]) ;  
			// fout1 <<New_R[i][j]  ;
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
		//	RN[i][j]=New_R[i][j]/5 ;
			// printf("current R is > %f \t RN = %f \t",New_R[i][j],RN[i][j]) ;

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
			//P[i][j]= 0.01 ;
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
			Q[i][j]= (double)rand() / (double)RAND_MAX  ; 
			//Q[i][j] = 0.01;
			// printf("%f   ",Q[i][j]) ;
			// fout1 <<Q[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}

	for(int i= 0;i<Rx;i++){
		for(int j =0;j<f_dec;j++){
			S[i][j]= (double)rand() / (double)RAND_MAX  ;  
			//S[i][j] = 0.01 ;
			// printf("%f   ",S[i][j]) ;
			// fout1 <<S[i][j]  ;
			// fout1 << '\t' ;
		}
		// printf("\n\n\n\n");
		// fout1 << '\n' ;
	}
	//	_getch();
	float B[Ry];
	for(int j =0;j<Ry;j++){
		B[j]=(double)rand() / (double)RAND_MAX  ;
		//B[j]=0.001 ;
	}
	float C[Rx];
	for(int i =0;i<Rx;i++){
		C[i]=(double)rand() / (double)RAND_MAX  ;
		//C[i]=0.001  ;
	}
	float D[Ry];
	for(int i =0;i<Ry;i++){
		D[i]=(double)rand() / (double)RAND_MAX  ;
		//D[i]=0.1  ;
	}
		//  starting Error calculation 
		float err_ij_temp , err_mid, err_fin , err_prev ;
		err_fin = 0 ;
		err_prev = 0 ;

for(int TOP=0;TOP<199;TOP++)
{
	// fout1 << "--- +++ Inside TOP loop # +++ ---" ;
	// fout1 << TOP  ;
	// fout1 << '\n' ;
	// foutf_dec << '\n' ;
	err_prev = 0 ;
	   err_fin = 0 ;
		for(int i= 0;i<Rx;i++){
			// fout1 << "--- +++ Inside i loop # +++ ---" ;
        	// fout1 << i  ;
	     // fout1 << '\n' ;
		for(int j =0;j<Ry;j++){
			// fout1 << "--- +++ Inside jloop # +++ ---" ;
        	// fout1 << j  ;
	     // fout1 << '\n' ;
			if(New_R[i][j]==0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			}  
			                   float  PQ = 0 ,sum =0;
							//	 printf("\n == currently processing RN[%d][%d]  " , i,j);
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
													 
														sum = sum + P[c][e]*Q[e][j];
														
													 }
 
											//	 // printf("\n %f",PQ) ;
												   // fout1 << "\n outside  e loop    \n" ;
															
												 PQ= PQ+sum ;

												 // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
												 sum = 0;
												 }
										  
									 }
								

       // Multiplying S[i,f_dec].Q[f_dec,i]  A m*p   B p*q
		   


		    float  SQ= 0 ;
			 sum = 0;

							//	 // printf("\n == currently processing RN[%d][%d]  " , i,j);
							//	 // printf("\n === before SQ multiplication " ) ;
			                  	for ( int c = i ; c <=i ; c++ )
									{  
										// // printf("\n === inside first for" ) ;
										for (int d = i ; d <= i ; d++ )
											  {
											//	  // printf("\n === inside second for" ) ;
												  for ( int e = 0 ; e < f_dec ; e++ )
													{
	  // printf("\n == inside thrid for multiplying S[%d][%d]*Q[%d][%d]  " , c,e,e,j);
														sum = sum + S[c][e]*Q[e][j];
													 }
 
											//	 // printf("\n sq= %f",SQ) ;
												 SQ= SQ+sum ;
												 sum = 0;
												 }
									 }

			err_ij_temp = (New_R[i][j] - (PQ+D[j]+SQ+3.5+C[i]));//+SQ+C[i]+D[j]+C[i]

			               // fout1 << "\n err_ij_temp =" ;
								// fout1 << err_ij_temp ;
								// fout1 << "\n  " ;
			//printf("=== RN val %f   ",New_R[i][j]) ;
			//printf("=== B[j] %f   ",B[j]) ;
			//printf("=== \n org err_ij_temp =  %f   ",err_ij_temp ) ;
		//	_getch();
			for(int k=0;k<f_dec;k++)
			{
				
               float Pik_temp = P[i][k] ;
			   float Qkj_temp = Q[k][j] ;
			 
			   P[i][k] = P[i][k] + 0.003 * ( err_ij_temp * Qkj_temp - 0.02 * P[i][k]);
			}
			  //  B[i] = B[i] + 0.00008*(err_ij_temp*Q[k][j] - 0.00000001 * B[i]);
				//B[j] = B[j] + 0.0001*(err_ij_temp * P[i][k]- 0.0002 * B[j]);
			for(int k=0;k<f_dec;k++)
			{
               Q[k][j] = Q[k][j] + 0.003 * ( err_ij_temp * ( Pik_temp + S[i][k]) - 0.02 * Q[k][j]);
			}
			  //  Q[k][j] = Q[k][j] + 0.001 * (err_ij_temp * B[i] - 0.002 * Q[k][j]);			
			   // Q[k][j] = Q[k][j] + 0.001* grad_Qfin;//* (err_ij_temp * (Pik_temp ) - 0.002 * Q[k][j]);
			for(int k=0;k<f_dec;k++)
			{
			    S[i][k] = S[i][k] + 0.003 * (err_ij_temp * Q[k][j] - 0.02 * S[i][k]);
			}
			     D[j]   =  D[j] + 0.001* (err_ij_temp  - 0.02 * D[j]);
			    C[i]   =  C[i]+0.001 * (err_ij_temp  - 0.02 * C[i]);
			
}
}
// to find Error;

		for(int i= 0;i<Rx;i++){
			// fout1 << "--- +++ Inside i loop # +++ ---" ;
        	// fout1 << i  ;
	     // fout1 << '\n' ;
		for(int j =0;j<Ry;j++){
			// fout1 << "--- +++ Inside jloop # +++ ---" ;
        	// fout1 << j  ;
	     // fout1 << '\n' ;
			if(New_R[i][j]==0) 
				{  // fout9f_dec << "\n ---  skipping this Rn \n " ;
					continue ; 
			}  // bypassing when rating = 0
			// fout1 << "--- +++ currently processin RN i, j" ;
        	// fout1 << i  ; // fout1 << '\t' ;
			// fout1 << j ;
	     // fout1 << '\n' ;
			// Multiplying P[i,f_dec].Q[f_dec,i]  A m*p   B p*q
			                    float  PQ = 0 ,sum =0;
								// printf("\n == currently processing RN[%d][%d]  " , i,j);
							//	 // printf("\n === before PQ multiplication " ) ;
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
													
														sum = sum + P[c][e]*Q[e][j];
													
													 }
 
											//	 // printf("\n %f",PQ) ;
												   // fout1 << "\n outside  e loop    \n" ;
															
												 PQ= PQ+sum ;

												 // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
												 sum = 0;
												 }
										  // fout1 << "\n outside  d   loop    \n" ;
										   // fout1 << "PQ ="  ;
												 // fout1 << PQ  ;
												  // fout1 << "\n"  ;
									 }
		
		  float  SQ= 0 ;
			 sum = 0;

							//	 // printf("\n == currently processing RN[%d][%d]  " , i,j);
							//	 // printf("\n === before SQ multiplication " ) ;
			                  	for ( int c = i ; c <=i ; c++ )
									{  
										// // printf("\n === inside first for" ) ;
										for (int d = i ; d <= i ; d++ )
											  {
											//	  // printf("\n === inside second for" ) ;
												  for ( int e = 0 ; e < f_dec ; e++ )
													{
													 //   // printf("\n == inside thrid for multiplying S[%d][%d]*Q[%d][%d]  " , c,e,e,j);
														sum = sum + S[c][e]*Q[e][j];
														//sum = sum + P[c][e]*B[j];
													//	_getch();
													 }
 
											//	 // printf("\n sq= %f",SQ) ;
												 SQ= SQ+sum ;
												 sum = 0;
												 }
									 }
								// // printf("\n === after SQ multiplication " ) ;
       // printf("\n sq = %f",SQ) ;
                                // fout1 << "\n SQ =" ;
								// fout1 << SQ;
								// fout1 << "\n  " ;

     // multiplication SQ over 

		//  printf("\n B[j] = %f",B[j]) ;
//err_ij_temp = 0 ;
			//err_ij_temp = New_R[i][j] - (PQ+SQ+B[j]) ;
			err_fin = err_fin + fabs(New_R[i][j] -(PQ + SQ+D[j]+3.5+C[i]));//+SQ)) ;
			
}}

printf("=== \n error final when top = %d ,  =  %f   ",TOP,err_fin ) ;

 printf("\ni am here inside error");
// tops ends after this 
}
  _getch();  
	 printf("\n i am here outside error");

// NEWCOMMENT	float U[Rx][Ry] ;

	float temp_sum1 = 0 ;
	for(int i=0;i<Rx;i++) 
	{
		for(int j=0;j<Ry;j++)
		{
			for(int k=0;k<f_dec;k++)
			{
						 temp_sum1 =   temp_sum1 +  P[i][k]*Q[k][j] ;
				        // temp_sum1 =   temp_sum1 +  P[i][k]*B[j] ;
						 printf("i am here p");
			}
			 U[i][j] = temp_sum1 ; 
			 temp_sum1 = 0 ;
		}
	}
	
	float temp_sum2 = 0 ;
	for(int i=0;i<Rx;i++) 
	{
		for(int j=0;j<Ry;j++)
		{
			for(int k=0;k<f_dec;k++)
			{
						  temp_sum2 =   temp_sum2 +  S[i][k]*Q[k][j] ;
						 // temp_sum2 =   temp_sum2 +  S[i][k]*B[j] ;
				  printf("i am here S");
			}
			 V[i][j] = temp_sum2; 
			 temp_sum2 = 0 ;
		}
		 
	}
	
	for(int i=0;i<Rx;i++) 
	{
		for(int j=0;j<Ry;j++)
		{	
			if (New_R[i][j]!=0) {continue;}
printf("i am here");
	   fout1 << "\n ";
		fout1 << i ; 
		fout1 << "\t ";
		fout1 << j ; 
		fout1 << "\t ";
		fout1 << (U[i][j]+V[i][j]+D[j]+3.5+C[i]);//+C[i]+D[j])+3.52
		//fout1<<"\t";
		}
		// fout1 << "\n ";
	 }
	 
	//fout00 << "\n **** Printing U Mx  *** \n" ;
	// printf("\n ===============   Printing U Mx      ==============\n") ;
/*	 
for(int i=0;i<f_dec;i++) 
	{
		for(int j=0;j<Ry;j++)
		{		 
	 //  fout2 <<Q[i][j]  ;
	 //  fout2 << '\t' ;
		}
		//fout2 << '\n' ; 
	}
	for(int i=0;i<Rx;i++){
	
	for(int j=0;j<Ry;j++){
		//V[i][j]=0;
		if(New_R[i][j]== 0){
			U[i][j]= U[i][j]+D[j]+3.5+C[i]+V[i][j];
		}
		else
		{ 
			U[i][j]=New_R[i][j];
		}

		}
	}
	 
	for(int i=0;i<Rx;i++) 
	{
		for(int j=0;j<f_dec;j++)
		{	
			//if(RN[i][j] != 0) continue ;
	 // fout1<<P[i][j]+S[i][j];
	  // _getch();
     // fout1 << '\t' ; 
	}
   // fout1 << '\n' ;
	}
	
ifstream fin3;//("similar1.txt",ios::binary);
      fin3.open("similarity.txt");
	  float** f1 ;
	   f1 = new float* [Rx]; 
   for (int i = 0; i < Rx; i++ ) 
   {
       f1[i] = new float[Rx] ;
   }
  // fin3.close();
 
for ( int i = 0; i < Rx; i++ )
  {
     for ( int j = 0; j < Rx; j++ )
   {
    fin3 >> f1[i][j];
	//printf("f[i][j] %f",f1[i][j]);
	//_getch();
 }
 }
for(int i=0;i<Rx;i++){

	B[i]=0;
}
float t1=0;
int co=0;
for(int i=0;i<Rx;i++){
	t1=0;
	co=0;
	for(int j=0;j<Ry;j++){
		
		t1=t1 + U[i][j];
		co++;					
	}
	B[i]=t1/co;
	//B[i]=B[i]/co ;
	//printf("\n B[i]%d %f %d",i,B[i],co);
		//getch();
}
float temp_Uab , temp_COSab, temp_COSabRN , temp_SUM_COSabRN , temp_SUM_COSab,Cos_storage[Rx-1],Cos_RN_storage[Rx-1];
// iterating RN to find unrated element 
for(int i=0;i<Rx;i++){
	for(int j=0;j<Ry;j++){
		
		if(New_R[i][j] != 0) continue ; // skipping for already rated items
	int	Cos_storage_count=0 ;
		for(int a=0;a<(Rx-1);a++)
		{
	      Cos_storage[a] = 0 ;
	      Cos_RN_storage[a] = 0 ;
        }
		    temp_COSab = 0 ;
			temp_COSabRN = 0 ;
			temp_SUM_COSabRN = 0 ;
			temp_SUM_COSab = 0 ;
			a=0 ;
		for(int k = 0 ; k <Rx ; k++) // finding rated rows for that unrated item 
		{
			if (k==i) continue ; // skipping the same row
			
			Cos_storage[a]=(f1[i][k]);
			
			Cos_RN_storage[a] = f1[i][k]*(U[k][j]-B[k]) ;
			a++ ;	
		} 
		
		/*  sorting begins ... 
		//printf("b4 sortn  logic");
  float sort_temp,sort_temp1,pred_sorted;
    for (int si = 0; si < a; ++si)
    {
        for (int sj = si + 1; sj < a; ++sj)
        {
            if (Cos_storage[si] < Cos_storage[sj])
            {
                sort_temp = Cos_storage[si];
                Cos_storage[si] = Cos_storage[sj];
                Cos_storage[sj] = sort_temp;
				sort_temp1 = Cos_RN_storage[si];
                Cos_RN_storage[si] = Cos_RN_storage[sj];
                Cos_RN_storage[sj] = sort_temp1;
				 
            }
        }
    }
	//printf("after sortn  logic");
	// sorting ends 
	float temp_sig_sort_cos = 0 ;
	float temp_sig_sort_cosRN = 0 ;
	for(int si = 0 ; si < 150 ; si++)
	{
		temp_sig_sort_cos = temp_sig_sort_cos + abs(Cos_storage[si]) ;
		temp_sig_sort_cosRN = temp_sig_sort_cosRN + Cos_RN_storage[si] ;
	}
	
	    RN[i][j]= B[i]+ (temp_sig_sort_cosRN / temp_sig_sort_cos);
	
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
		fout1 << (RN[i][j]);//+C[i]+D[j])+3.52
	 }

}
*/


    return 0;
	


}
