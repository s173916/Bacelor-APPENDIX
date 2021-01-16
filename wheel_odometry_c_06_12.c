/**********************************************
 * Testprogram for Robot Hardware Daemon Client
 **********************************************/

/*********************** Version control information ***********************/
 #define VERSION "$Rev: 91 $:"
 #define DATE    "$Date: 2008-09-26 15:47:28 +0200 (Fri, 26 Sep 2008) $:"
/***************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>

#include <rhd.h>
//

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include <math.h>

#define WHEEL_BASE 0.2506

//printf("WHEEL_BASE %f \n", WHEEL_BASE);



#define M_PER_ENC_L 0.0001002260115
#define M_PER_ENC_R 0.00009956195016
//0.00010157
//0.00010245
//0.00010245
//0.0001033112
//0.0001026


// Globale
int counterwidth = 16;
// Global Variable for printing
int16_t printNum = 0;
int16_t printInt =1;


// Defining
symTableElement *symTable;

double oldTime , newTime;
double *timestamps;
//Loggin to file
FILE *logFile;
int samples, counter;

// Variables for resetting the encoders
int left_enc_1 = 0;
int right_enc_1 = 0;
int round1 = 0;


// Variable Stop_func
int16_t stop_func = 0;


//double dt = 0;   
double dt =0.01;



typedef struct{ //input signals
    int left_enc,right_enc; // encoderticks
    //output signals
    double right_pos,left_pos;
    double right_pos_old,left_pos_old;
    double dist_driven;
    // internal variables
    int left_enc_old, right_enc_old;
} odotype;

typedef struct{ //input signals
    double x;
    double x_old;
    double y;
    double y_old;
    double th;	// theta in global coordinates
    double th_old;
    double th_raw;
    double th_raw_old;
    double dth;
    double vx;
    double vth;
    double vx1; //Global Velocity in x direction 
    double vy1; //Global Velocity in y direction
} odometry;

odotype rawData;    //Define raw data  
odometry odomData;  //Define odometry data


void initRawData(odotype * raw) { 
	raw->left_enc = 0;
	raw->right_enc = 0;
	raw->right_pos = 0;
	raw->left_pos=0;
	raw->right_pos_old = 0;
	raw->left_pos_old=0;
	raw->dist_driven = 0;
	// internal variables
	raw->left_enc_old=0;
	raw->right_enc_old=0;
	
	
	//raw->left_enc_old = readValueNamed("encl", 0); 
	//raw->right_enc_old = readValueNamed("encr", 0);

	
}

void initOdomData(odometry * odom) {
	odom->x=0;
	odom->x_old=0;
	odom->y=0;
	odom->y_old=0;
	odom->th=0;	// theta in global coordinates  
	odom->th_old=0;
	odom->th_raw=0;
	odom->th_raw_old=0;
	odom->dth=0;
	odom->vx=0;
	odom->vth=0;
	odom->vx1=0; //Global Velocity in x direction 
	odom->vy1=0; //Global Velocity in y direction

}


void init() {

	////
	initRawData(&rawData);// Initialyse rawData
	initOdomData(&odomData ); //
	////

	//symTableElement *symTable;
	oldTime = 0; 
	newTime = 0;
	timestamps = NULL;

	//Loggin to file
	logFile = NULL;
	samples = 0;
	counter = 0;
	


	printf("initiliseret \n");
}

void readRawData(odotype * raw) {

	double countmax;
	double countsize;

	int delta_l;
	int delta_r;

// Saving the first value of the enc
	if(round1==0){
		printf("init start");
		left_enc_1 = readValueNamed("encl", 0); //////////////////////////////First value of enc//////////////////////
		right_enc_1 = readValueNamed("encr", 0);
		printf("init slut l = %d \n", left_enc_1);
		printf("init slut r = %d \n", right_enc_1);
	}
	round1++;


	//raw->left_enc = getinputref("encl",0);
	//raw->right_enc = getinputref("encr",0);
	
	raw->left_enc = readValueNamed("encl", 0) - left_enc_1;
	raw->right_enc = readValueNamed("encr", 0) - right_enc_1;
	
	
	//int readValueNamed("speedl", 0);
	printf(" \n\n\n");
	//printf("=====(%d) \n", readValueNamed("encl", 0));
	//printf("=====(%d) \n", readValueNamed("encr", 0));

      
	
	countmax = (1 << (counterwidth-1));
	countsize = (1 << counterwidth);
	
	//countmax = 0x8000;
	//countsize = 0x10000;
	

	delta_r = raw->right_enc - raw->right_enc_old;
	if (delta_r > countmax) delta_r -= countsize;
	else if (delta_r < -countmax) delta_r += countsize;
	raw->right_enc_old = raw->right_enc;
	raw->right_pos_old = raw->right_pos;
	raw->right_pos += delta_r * M_PER_ENC_R;
	printf("delta_r %d \n" , delta_r);
	printf("dist_r %f \n", raw->right_pos );
	
        
	delta_l = raw->left_enc - raw->left_enc_old;
	if (delta_l > countmax) delta_l -= countsize;
	else if (delta_l < -countmax) delta_l += countsize;
	raw->left_enc_old = raw->left_enc;
	raw->left_pos_old = raw->left_pos;
	raw->left_pos += delta_l * M_PER_ENC_L;

	raw->dist_driven = ((raw->right_pos - raw->right_pos_old) + (raw->left_pos - raw->left_pos_old))/2;


}

void calcOdometry(odometry * odom, odotype * raw, double dt){
    // Move previous values
    odom->x_old = odom->x;
    odom->y_old = odom->y;
    odom->th_old = odom->th;
    odom->th_raw_old = odom->th_raw;
   

   // Calculate theta
    odom->th_raw = ((raw->right_pos - raw->left_pos)/WHEEL_BASE);
    odom->dth = odom->th_raw - odom->th_raw_old;
    odom->th += odom->dth;
	
	while(odom->th > M_PI){
        odom->th -= 2*M_PI;
    }
    while(odom->th < -M_PI){
        odom->th += 2*M_PI;
    }
    //double avg_th = (odom->th + odom->th_old)/2; 
    //double avg_th = (odom->th);


    //Calculate x and y pos
    //odom->x += raw->dist_driven * cos(1.5708);
    //odom->y += raw->dist_driven * sin(1.5708);
    odom->x += raw->dist_driven * cos(odom->th + odom->dth*0.5);
    odom->y += raw->dist_driven * sin(odom->th + odom->dth*0.5);
    odom->vx = raw->dist_driven/dt;
    odom->vth = (odom->dth)/dt;
    odom->vx1 = (raw->dist_driven * cos(odom->th + odom->dth*0.5))/dt; // Calculate velocity in global x direction 
    odom->vy1 = (raw->dist_driven * sin(odom->th + odom->dth*0.5))/dt; // Calculete velocity in global y direction
    //odom->vx1 = (raw->dist_driven * cos(1.5708))/dt; // Calculate velocity in global x direction 
    //odom->vy1 = (raw->dist_driven * sin(1.5708))/dt; // Calculete velocity in global y direction


	//printf("=Velocity X (%f) \n", odom->vx1);
	//printf("=Velocity Y(Z) (%f) \n", odom->vy1);

	if ( printNum  == printInt){
		printf("==Pos X (%f) \n", odom->x);
		printf("==Pos Y(Z) (%f) \n", odom->y);
	    //printf("===avg_TH (%f) \n", avg_th);
	    printf("===TH (%f) \n", odom->th);
		printf("===TH (%f) \n", odom->dth);
		//printf("====Vx_hastighed (%f) \n\n\n", odom->vx);
		printNum = 0; 		
	}

	printNum++;

 /*   printf("====Dist_driven (%f) \n", raw->dist_driven);
    printf("====Vx_hastighed (%f) \n", odom->vx);   




    printf("!!!!!!!!!!!!!!!!!!!!!! sin (%f) \n", sin(90)); 
    printf("!!!!!!!!!!!!!!!!!!!!!! cos (%f) \n", cos(90)); 
    printf("!!!!!!!!!!!!!!!!!!!!!! sin (%f) \n", sin(1.5708)); 
    printf("!!!!!!!!!!!!!!!!!!!!!! cos (%f) \n", cos(1.5708)); 
*/


    
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      




void update_wheel_odometry(){
	readRawData(&rawData); // red data from wheel
	calcOdometry(&odomData, &rawData, dt);
}


int velocity() {
	printf("Vx (%f) \n", odomData.vx);
	return odomData.vx*1000000;
}

int velocity_x() {
	printf("VX1 (%f) \n", odomData.vx1);
	return odomData.vx1*1000000;
}

int velocity_y() {
	printf("VY1 (%f) \n", odomData.vy1);
	return odomData.vy1*1000000;
}

int pos_rx() {
	return odomData.x*1000000;
}

int pos_ry() {
	return odomData.y*1000000;
}

int encl() {
	return rawData.left_enc;
}
int encr() {
	return rawData.right_enc;
}

int th_robot() {
	printf("Th_robot (%f) \n", odomData.th);
	return odomData.th*1000000;
	
}

/*int th_robot() {
	double ggg = 0.000;
	//return odomData.th;
	ggg=odomData.th + odomData.dth*0.5;
	printf("Th_pos (%f) \n", ggg);
	return ggg*1000000;
}*/




// The stop-value is returned from the python program
void stop(int Stopp1){
	
	stop_func = Stopp1;
	
	//return Stopp1;
}




int main(int argc, char * argv[]) {

	init(); // Initialiserer

///////////////////////////// connect funcktion ///////////////////////////////////
	//Find revision number from SVN Revision
	char *i,versionString[64] = VERSION, tempString[10];
	//int cnt = 0, cnt2 = 0;
	i = strrchr (versionString,'$');
	strncpy(tempString,versionString+1,(i-versionString-1));
	tempString[(i-versionString-1)] = 0;
	printf("**********    Robot Hardware Daemon Client Test %s   **********\n\n",tempString);

	//Hostname given as input
	if (argc >= 2) {
	  strncpy(versionString,argv[1],64);
	  printf("Hosename read from input : %s\n",versionString);
	} else {
	  strncpy(versionString,"127.0.0.1",64);
	  printf("No hostname in input. Connecting to localhost\n");
	}

	//Logging 
	if (argc >= 3) {
	  printf("Logging enabled\n");
	  samples = atoi(argv[2]);
	  printf("Logging %d samples then quitting\n",samples);
	  logFile = fopen("logfile.dat","w");
	  timestamps = realloc(timestamps,(samples+10) * sizeof(double));
	}

	 if(rhdConnect('r',versionString,0) > 0) {
		printf("Connect completed\n\n");
		symTable = getSymbolTable('r');

		while((rhdSync() > 0) && (counter <= samples)) {
			
			if (stop_func == 0){

				//Slow down a bit
				//usleep(100000);

				//////////////////////////// loop funcktion (the running program)////////////////////////////////
				symTable = getSymbolTable('r');
				newTime = (double)symTable[0].timestamp.tv_sec + (double)symTable[0].timestamp.tv_usec / 1000000;
			  

				//dt = newTime - oldTime; 

				if (!(logFile != NULL)) { 
					if (printNum == printInt){
						printf("Period time %6.4f %d %d\n",newTime - oldTime,counter,samples);
					}
				oldTime = newTime;
				}


				update_wheel_odometry();

				//velocity_x();

				//velocity_y();
			
				//velocity();


				//Log if samples are defined
				/* if ((logFile != NULL)) {
				fprintf(logFile,"%d %d %d\n",readValue(5,0),readValue(5,1),readValue(5,2));
				timestamps[counter] = newTime;
				if (samples > 0) counter++;
			  }*/
			} else{
				printf("stoooooooooooooooooop");
				sleep(4);
				//exit;
				break;
			}
		}
		/////////////////////////////// loop funcktion end ///////////////////////////////////
	  } else {
		printf("Connect failed\n");
	  }
	  
	if (logFile != NULL) {
		printf("Saving log to file...\n");
		for (counter = 0; counter < samples; counter++) 
		  fprintf(logFile,"%f\n",timestamps[counter]);
	  }

	  printf("Shutting client down\n");
	  rhdDisconnect();
	  fclose(logFile);
	  
	return 0;
/////////////////////////////connect funcktion end ///////////////////////////////////
}