/*
 * Changes by D. Starks-Browning:

 * Replaced "extern int TRUE" etc. with more conventional,
 * conditional #define.

 */

#include <string.h>
#include <stdlib.h>

#define BIG_NUMBER   1.0e100	        /*  a very big number */
#define MAX_CYCLE      100     		/*  the maximum number of cycles */

#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif

extern int verbose;                     /* verbose switch */

extern int *first_rotamer;    		/*  list of first sidechain per residue */
extern int *last_rotamer;     		/*  list of last  sidechain per residue */

extern int  *dead_end_global;      	/*  flags of dead end elements per sidechain */
extern int **dead_end_pair_global;      /*  flags of dead end pairs */

extern int  *dead_end_elimination;      /*  flags of dead end elements per sidechain */
extern int **dead_end_pair_elimination; /*  flags of dead end pairs */

extern double **Reduced_Energies;  	/*  the reduced interaction ebergies Ei[r]j[s]  */

extern int *alive_rotamer;
extern double **critical_energy;
extern double *weight;
extern int *critical_rotamer;	   
extern int **critical_point;
extern int *iposv;
extern int *izrov;

/****************************************************************************************
 *											*
 *	 Dead End Elimination algorithm       						*
 *											*
 *   Author: E. LACROIX	1997								*
 *											*
 *   Purpose:										*
 * 		eliminate sidechain rotamers    					*
 * 		that are not compatible with    					*
 *		the Global Minimum Energy Conformation					*
 *											*
 *   Input: 										*
 *  		. number of sidechains							*
 *		. number of residues                				        *
 *    		. array with 1st rotamer (all residues)   				*
 *        	. array with last rotamer (all residues)   				*
 *        	. matrix with reduced interaction energies  				*
 *											*
 *   Output:										*
 * 		. array with TRUE/FALSE flags               				*
 *          	  for Dead rotamers/Living rotamers         				*
 *											*
 *   References:									*
 * 		. Desmet J., De Maeyer M., Hazes B. &       				*
 *          	  Lasters I. (1992) Nature 356, 539-542     				*
 *        	. Goldstein R.F. (1994) Biophysical  					*
 *		  Journal 66, 1335-1340							*
 *		. Lasters I., De Maeyer M. & Desmet J.      				*
 *          	  (1995) Protein Engineering 8, 815-822     				*
 *											*
 *											*
 ****************************************************************************************/


/* A mini list implementation for rotamer lists */

/* LJW begin */

typedef struct rotamer_list_elem {
  int id;
  struct rotamer_list_elem* next;
} ELEM;
typedef ELEM* ELEM_PTR;

static ELEM_PTR list_storage = 0, list_storage_ptr = 0, list_storage_last = 0;

static init_list_storage(int size) {
#ifdef DEBUG
  printf("\ninit list with %d\n",size);
#endif
  list_storage_ptr = list_storage = (ELEM_PTR)calloc(size,sizeof(ELEM));
  list_storage_last = list_storage + size;
}

static free_list_storage() {
  free(list_storage);
}

static add_list(ELEM_PTR *list, int id) {
  list_storage_ptr->id = id;
  list_storage_ptr->next = *list;
  *list = list_storage_ptr;
  if (++list_storage_ptr > list_storage_last)
    printf("BUG: not enough list storage reserved\n");
}

static print_list(ELEM_PTR list) {
  ELEM_PTR p;
  for (p = list; p; p = p->next)
    printf("%d ",p->id);
}

/* LJW end */



void Dead_End(number_residue,dead_single,dead_pair,gap)

int number_residue; 			/*  number of residues                */
int *dead_single;
int **dead_pair;
double gap;

{

  int   critical_number;
  int   critical_index;
  int    rotamer_index;

  int number_cycles;
  int number_rotamers;
  int survivors[MAX_CYCLE];
  
  int best_worst;               /*  index of the sidechain that does its best to interact with i[r] */

  int residue_i;          	/*  index of the first  residue of the interacting pair */
  int residue_j;          	/*  index of the second residue of the interacting pair */
  int residue_k;          	/*  index of the third  residue, competing with the pair */

  ELEM_PTR rotamer_r_p;          	/*  index of the sidechain under examination - residue_i */
  ELEM_PTR rotamer_t_p;          	/*  index of the competing sidechain	     - residue_i */
  ELEM_PTR rotamer_s_p;          	/*  index of the sidechain under examination - residue_j */
  ELEM_PTR rotamer_u_p;          	/*  index of the competing sidechain	     - residue_j */
  ELEM_PTR rotamer_v_p;          	/*  index of the competing sidechain         - residue_k */
  int rotamer_r_id;
  int rotamer_s_id;
  int rotamer_t_id;
  int rotamer_u_id;
  int rotamer_v_id;
  ELEM_PTR* rotamer_r_pp;
  int dead_single_r_flag;

  int do_elimination;     	/*  switch to look for dead end elements */

  int do_pair_I;     	        /*  switch to look for dead end elements till no more dead pairs */
  int do_pair_II;     	        /*  switch to look for dead end elements till no more dead pairs */

  int all_dep;

  double min;
  double max;
  double best_of_worst_energy;

  double x;            	/*  any value to compute */
  double y;
  double z;

  int loop;	    	/*  any loop counter */
  int koop;	    	/*  any loop counter */
  int moop;	    	/*  any loop counter */
  
  int icase;

  void simplx();

  double* energy_vec;

  int total_number_rotamers = 0;
  ELEM_PTR* rotamer_list = (ELEM_PTR*)calloc(number_residue+1,sizeof(ELEM_PTR));
  for (residue_i = 0; residue_i <= number_residue; ++residue_i)
    rotamer_list[residue_i] = 0;

  if (verbose) printf("\nminimizing with gap %lf", gap);

  /*  count all rotamers per residue */
  for(residue_i=1;residue_i<=number_residue;residue_i++){

    number_rotamers=0;

    for(rotamer_r_id=first_rotamer[residue_i];rotamer_r_id<=last_rotamer[residue_i];rotamer_r_id++){
      if(!dead_single[rotamer_r_id]) ++number_rotamers;
    }
    total_number_rotamers += number_rotamers;
    alive_rotamer[residue_i]=number_rotamers;
	  	 
#ifdef DEBUG
    printf("\nDEBUG Residue %3d [%3d-%3d]  with %5d",residue_i,first_rotamer[residue_i],last_rotamer[residue_i], alive_rotamer[residue_i]);
#endif

  }

  init_list_storage(total_number_rotamers);

  for(residue_i=1;residue_i<=number_residue;residue_i++){
    for(rotamer_r_id=last_rotamer[residue_i];rotamer_r_id>=first_rotamer[residue_i];rotamer_r_id--){
      if(!dead_single[rotamer_r_id]) {
        add_list(&(rotamer_list[residue_i]),rotamer_r_id);
      }
    }
  }

#ifdef DEBUG
  printf("\n");
  for(residue_i=1;residue_i<=number_residue;residue_i++){
    printf("res %d: ",residue_i);
    print_list(rotamer_list[residue_i]);
    printf("\n");
  }
#endif

  do_pair_II = TRUE;

  while(do_pair_II){ 	  	
    
    do_pair_II = FALSE;
    do_pair_I  = TRUE;
    
    while(do_pair_I){ 	  	
      
      do_pair_I = FALSE;
	
#ifdef DEBUG
      printf("\nDEBUG Entry to Dead_End Phase A");
      fflush(0);
#endif

  /*****************************************************************
   *							           *
   *           PHASE A - Simple rotamer examination    		   *
   *								   *
   *****************************************************************/

   /****************************************************************
    *						    	           *
    *	 Residue i - Rotamer r		      	    	           *
    *    loop thru all residues                                    *
    *    loop thru all sidechains                                  *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue i - Rotamer t			    	           *
    *    loop thru all sidechains                                  *
    *    only if the rotamer t is not rotamer r                    *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    ****************************************************************/


      do_elimination=TRUE;  		   	/*  to start the dead end elimination */
      number_cycles=0;

      while(do_elimination){ 	  		/*  loop till no more dead end elements are found */

#ifdef DEBUG
	printf("\nDEBUG Start Cycle");
	fflush(0);
#endif
	  
	do_elimination=FALSE;  		/*  assumes there is no more dead end elements */
	survivors[number_cycles]=0;
	  
	for(residue_i=1;residue_i<=number_residue;residue_i++){
	  
	  for(rotamer_r_pp=&rotamer_list[residue_i];(*rotamer_r_pp); ){
	    rotamer_r_id = (*rotamer_r_pp)->id;
            dead_single_r_flag = FALSE;
	      
	    ++survivors[number_cycles];

            for(rotamer_t_p=rotamer_list[residue_i];rotamer_t_p; rotamer_t_p= rotamer_t_p->next){
		if(rotamer_r_id!=rotamer_t_p->id){
		  
		  x=0.0; 
		  
		  /*  loop thru all other residues for summation */
		  /* increment with the minimum difference between interaction */
		  
		  for(residue_j=1;residue_j<=number_residue;residue_j++) {
		    if(residue_i!=residue_j) {
		      
		      min=BIG_NUMBER;  
		      
		      for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p; rotamer_s_p = rotamer_s_p->next) {
			if(!dead_pair[rotamer_r_id][rotamer_s_p->id]){
			  
			  y= ( Reduced_Energies[rotamer_r_id][rotamer_s_p->id]
                              - Reduced_Energies[rotamer_t_p->id][rotamer_s_p->id] );
			  if(y<min)  min=y;
			  
			}
		      }
		      
		      x += min; 
		    }
		  }
		  /* printf("\nrot %d x %lf ",rotamer_r_id,x); */
		  if(x>gap) { /* if(x>0.0) */
		    
		    /*  there were still some dead end elements */
		    /*  remembers that the sidechain - i[r] - will die */
		    
		    if(!do_elimination) do_elimination=TRUE;  
		    
		    dead_single_r_flag = TRUE;
		    --alive_rotamer[residue_i];
		  }
		  if(dead_single_r_flag)  break;
		}
	    }
            if (dead_single_r_flag)
              *rotamer_r_pp = (*rotamer_r_pp)->next;
            else
              rotamer_r_pp = &((*rotamer_r_pp)->next);
	      
#ifdef DEBUG
	      if(!dead_single_r_flag)  printf("\nDEBUG Rotamer %3d [%2d] alive..",rotamer_r_id,residue_i); 
	      else                         printf("\nDEBUG Rotamer %3d [%2d] killed..",rotamer_r_id,residue_i); 
	      fflush(0);
#endif
	  } /*  loop over all rotamers of residue_i */
	}   /*  loop over all residues (i) */
	
	++number_cycles;
	if(number_cycles==MAX_CYCLE) {
	  printf("\nFatal error (woops!)");
	  printf("\nBye");
	  exit(2);
	}
	
      } /*  quit loop if there is no more dead ending element */
	
      if(verbose) for(loop=0;loop<number_cycles;loop++) printf("\nCycle A1 %3d started with %5d sidechains",loop+1,survivors[loop],gap);
      fflush(0);
      
#ifdef DEBUG
  printf("\n");
  for(residue_i=1;residue_i<=number_residue;residue_i++){
    printf("res %d: ",residue_i);
    print_list(rotamer_list[residue_i]);
    printf("\n");
  }
#endif

#ifdef DEBUG
      printf("\nDEBUG There was no more rotamer to kill");
      printf("\nDEBUG Entry to Dead_End Phase C");
      fflush(0);
#endif




  /*****************************************************************
   *							           *
   *           PHASE C - Rotamer pairs examination   (SOFT)	   *
   *								   *
   *****************************************************************/

   /****************************************************************
    *						    	           *
    *	 Residue i - Rotamer r		      	    	           *
    *    loop thru all residues                                    *
    *    only if there is more than one living rotamer             *
    *    loop thru all sidechains                                  *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue j - Rotamer s			    	           *
    *    loop thru all remaining residues                          *
    *    only if there is more than one living rotamer             *
    *    loop thru all sidechains                                  *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue k - Rotamer t			    	           *
    *    loop thru all other sidechains                            *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    ****************************************************************/

      for(residue_i=1;residue_i<number_residue;residue_i++){  
	for(residue_j=residue_i+1;residue_j<=number_residue;residue_j++){
	  if(alive_rotamer[residue_j]>1||alive_rotamer[residue_i]>1) {
	    
#ifdef DEBUG
	    printf("\nDEBUG Pairs between residues %d [%d] %d [%d]",residue_i,alive_rotamer[residue_i],residue_j,alive_rotamer[residue_j]);
	    fflush(0);
#endif
	    
	    best_of_worst_energy=BIG_NUMBER;
	    
	    for(rotamer_r_p=rotamer_list[residue_i];rotamer_r_p;rotamer_r_p = rotamer_r_p->next){
              rotamer_r_id = rotamer_r_p->id;
		
  	        for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p;rotamer_s_p = rotamer_s_p->next){
                  rotamer_s_id = rotamer_s_p->id;
		  if(!dead_pair[rotamer_r_id][rotamer_s_id]){
		    
		    x = Reduced_Energies[rotamer_r_id][rotamer_s_id];
		    
		    /* loop thru all other residues for summation */
		    for(residue_k=1;residue_k<=number_residue;residue_k++) {
		      if(residue_i!=residue_k&&residue_j!=residue_k ) {
			
			max=-BIG_NUMBER;
			
  	                for(rotamer_t_p=rotamer_list[residue_k];rotamer_t_p; rotamer_t_p = rotamer_t_p->next){
			    
			    y  = Reduced_Energies[rotamer_r_id][rotamer_t_p->id]
                                  + Reduced_Energies[rotamer_s_id][rotamer_t_p->id];
			    
			    if(y>max)  max = y;
			}

			x += max;	    
		      }
		    }
		    if(x<best_of_worst_energy) best_of_worst_energy = x;
		  }
		}
	    }

	    for(rotamer_r_p=rotamer_list[residue_i];rotamer_r_p;rotamer_r_p = rotamer_r_p->next){
              rotamer_r_id = rotamer_r_p->id;
		
  	        for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p;rotamer_s_p = rotamer_s_p->next){
                  rotamer_s_id = rotamer_s_p->id;
		  if(!dead_pair[rotamer_r_id][rotamer_s_id]){
		    
		    x = Reduced_Energies[rotamer_r_id][rotamer_s_id];
		    
		    /* loop thru all other residues for summation */
		    for(residue_k=1;residue_k<=number_residue;residue_k++) {
		      if(residue_i!=residue_k&&residue_j!=residue_k ) {
			
			min=BIG_NUMBER;
			
  	                for(rotamer_t_p=rotamer_list[residue_k];rotamer_t_p; rotamer_t_p = rotamer_t_p->next){
			    
			    y  = Reduced_Energies[rotamer_r_id][rotamer_t_p->id]
                                 + Reduced_Energies[rotamer_s_id][rotamer_t_p->id];
			    
			    if(y<min)  min = y;
			}

			x += min;
                      }
                    }
                    if(x>best_of_worst_energy + gap){ /* if(x>best_of_worst_energy) */
			  dead_pair[rotamer_r_id][rotamer_s_id]=TRUE;
			  dead_pair[rotamer_s_id][rotamer_r_id]=TRUE;
			  
#ifdef DEBUG
			  printf("\nDEBUG Killed pair %d-%d [%f > %f]",rotamer_r_id,rotamer_s_id,x,best_of_worst_energy);
			  fflush(0);
#endif
			  if(!do_pair_I) do_pair_I=TRUE;  
                    }			
		      
		      /* if(dead_pair[rotamer_r_id][rotamer_s_id])
break; */
		    
		  }
		}
	    }
	  }
	}
      }
    
#ifdef DEBUG
      printf("\nDEBUG Done pairs I");
      printf("\nDEBUG Entry to Dead_End Phase D");
      fflush(0);
#endif
      
  /*****************************************************************
   *							           *
   *           PHASE D - Killing rotamers with all DEPs            *
   *								   *
   *****************************************************************/
    
      for(residue_i=1;residue_i<=number_residue;residue_i++) {  
	
	for(rotamer_r_pp=&rotamer_list[residue_i];(*rotamer_r_pp); ){
          rotamer_r_id = (*rotamer_r_pp)->id;
          dead_single_r_flag = FALSE;
	    
	    all_dep = FALSE;
	    
	    for(residue_j=1;residue_j<=number_residue;residue_j++) { 
	      if(residue_i!=residue_j){
		
		all_dep = TRUE;	   
		
  	        for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p;rotamer_s_p = rotamer_s_p->next){
		  if(!dead_pair[rotamer_r_id][rotamer_s_p->id]) {
		    all_dep = FALSE;
		    break;
		  }	 
		}
		if(all_dep){
                  dead_single_r_flag = TRUE;
		  --alive_rotamer[residue_i];
		  
#ifdef DEBUG
		  printf("\nDEBUG Killed rotamer %d [%d]",rotamer_r_id,residue_i);
		  fflush(0);
#endif
		  
		}
	      }
	      
	      if(all_dep) break;
	  }
          if (dead_single_r_flag)
            *rotamer_r_pp = (*rotamer_r_pp)->next;
          else
            rotamer_r_pp = &((*rotamer_r_pp)->next);

	}
      }
      
      /* Edge of dead pairs phase I */
      
#ifdef DEBUG
      printf("\nDEBUG Done All-DEPs");
      fflush(0);
#endif
      
    }
      
#ifdef DEBUG
  printf("\n");
  for(residue_i=1;residue_i<=number_residue;residue_i++){
    printf("res %d: ",residue_i);
    print_list(rotamer_list[residue_i]);
    printf("\n");
  }
#endif

#ifdef DEBUG
    printf("\nDEBUG Entry to Dead_End Phase E");
    fflush(0);
#endif




  /*****************************************************************
   *							           *
   *           PHASE E - Rotamer pairs examination (HARD)   	   *
   *								   *
   *****************************************************************/

   /****************************************************************
    *						    	           *
    *	 Residue i - Rotamer r		      	    	           *
    *    loop thru all residues                                    *
    *    only if there is more than one living rotamer             *
    *    loop thru all sidechains                                  *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue j - Rotamer s			    	           *
    *    loop thru all remaining residues                          *
    *    only if there is more than one living rotamer             *
    *    loop thru all sidechains                                  *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue i - Rotamer t			    	           *
    *    loop thru all other sidechains                            *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    *	 Residue j - Rotamer u    		    	           *
    *    loop thru all other sidechains                            *
    *    only if the sidechain was not already eliminated          *
    *						    	           *
    ****************************************************************/

    for(residue_i=1;residue_i<number_residue;residue_i++){
    /* for(residue_i=number_residue-1;residue_i>=1;residue_i--){ */
      
      for(residue_j=residue_i+1;residue_j<=number_residue;residue_j++){
	if(alive_rotamer[residue_j]>1||alive_rotamer[residue_i]>1) {

	/* printf("proc 0 res %d %d\n",residue_i,residue_j); */
	  	  
#ifdef DEBUG
	  printf("\nDEBUG Pairs between %d [%d] %d [%d]",residue_i,alive_rotamer[residue_i],residue_j,alive_rotamer[residue_j]);
	  fflush(0);
#endif
	      
	  for(rotamer_r_p=rotamer_list[residue_i];rotamer_r_p;rotamer_r_p = rotamer_r_p->next){
	    rotamer_r_id = rotamer_r_p->id;

  	      for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p;rotamer_s_p = rotamer_s_p->next){
                rotamer_s_id = rotamer_s_p->id;
		if(!dead_pair[rotamer_r_p->id][rotamer_s_p->id]){

  	          for(rotamer_t_p=rotamer_list[residue_i];rotamer_t_p; rotamer_t_p = rotamer_t_p->next){
                    rotamer_t_id = rotamer_t_p->id;
		    for(rotamer_u_p=rotamer_list[residue_j];rotamer_u_p;rotamer_u_p = rotamer_u_p->next){
		      rotamer_u_p->id = rotamer_u_p->id;

		      if(rotamer_r_p->id!=rotamer_t_p->id||rotamer_s_p->id!=rotamer_u_p->id){
			if(!dead_pair[rotamer_t_p->id][rotamer_u_p->id]){
  
			  x  = Reduced_Energies[rotamer_r_p->id][rotamer_s_p->id] - Reduced_Energies[rotamer_t_p->id][rotamer_u_p->id]; 

			  /*  loop thru all other residues for summation */
			  for(residue_k=1;residue_k<=number_residue;residue_k++) {
			    if(residue_i!=residue_k&&residue_j!=residue_k ) {
			      
			      min=BIG_NUMBER;  	 	
		      
			      for(rotamer_v_p=rotamer_list[residue_k];rotamer_v_p;rotamer_v_p=rotamer_v_p->next) {
                                /* rotamer_v_id = rotamer_v_p->id; */
				if(!dead_pair[rotamer_s_p->id][rotamer_v_p->id]&!dead_pair[rotamer_r_p->id][rotamer_v_p->id]){

				  y  = Reduced_Energies[rotamer_r_p->id][rotamer_v_p->id] + Reduced_Energies[rotamer_s_p->id][rotamer_v_p->id]
				     - Reduced_Energies[rotamer_t_p->id][rotamer_v_p->id] - Reduced_Energies[rotamer_u_p->id][rotamer_v_p->id];
				  
			  
				  if(y<min)  min = y;
				}
			      }
			      x += min;	    
			    }
			  }
			  
			  if(x>gap) { /* if(x>0.0)  */
			    dead_pair[rotamer_r_p->id][rotamer_s_p->id]=TRUE;
			    dead_pair[rotamer_s_p->id][rotamer_r_p->id]=TRUE;

#ifdef DEBUG
    printf("\nDEBUG Killed pair %d-%d",rotamer_r_p->id,rotamer_s_p->id);
    fflush(0);
#endif
			    if(!do_pair_II) do_pair_II=TRUE;  
			  }
			}
		      }
		      if(dead_pair[rotamer_r_p->id][rotamer_s_p->id]) break;
		    }
		    if(dead_pair[rotamer_r_p->id][rotamer_s_p->id]) break;
		  }		    
		}
	      }
	  }
	}
      }
    }
    
#ifdef DEBUG
    printf("\nDEBUG Done pairs II");
    printf("\nDEBUG Entry to Dead_End Phase F");
    fflush(0);
#endif
 
  /*****************************************************************
   *							           *
   *           PHASE F - Killing rotamers with all DEPs            *
   *								   *
   *****************************************************************/
    
    for(residue_i=1;residue_i<=number_residue;residue_i++) {  
      
      for(rotamer_r_pp=&rotamer_list[residue_i];(*rotamer_r_pp); ){
          rotamer_r_id = (*rotamer_r_pp)->id;
          dead_single_r_flag = FALSE;
	  
	  all_dep = FALSE;
	  
	  for(residue_j=1;residue_j<=number_residue;residue_j++) { 
	    if(residue_i!=residue_j){
	      
	      all_dep = TRUE;	   
	      
  	      for(rotamer_s_p=rotamer_list[residue_j];rotamer_s_p;rotamer_s_p = rotamer_s_p->next){
		if(!dead_pair[rotamer_r_id][rotamer_s_p->id]) {
		  all_dep = FALSE;
		  break;
		}	 
	      }
	      if(all_dep){
		dead_single_r_flag=TRUE;
		--alive_rotamer[residue_i];

#ifdef DEBUG
		printf("\nDEBUG Killed rotamer %d [%d]",rotamer_r_id,residue_i);
		fflush(0);
#endif

	      }
	    }
	    
	    if(all_dep) break;
	  }
          if (dead_single_r_flag)
            *rotamer_r_pp = (*rotamer_r_pp)->next;
          else
            rotamer_r_pp = &((*rotamer_r_pp)->next);
      }
    }

    /* Edge of dead pairs phase II */

#ifdef DEBUG
    printf("\nDEBUG Done All-DEPs");
    fflush(0);
#endif

#ifdef DEBUG
  printf("\n");
  for(residue_i=1;residue_i<=number_residue;residue_i++){
    printf("res %d: ",residue_i);
    print_list(rotamer_list[residue_i]);
    printf("\n");
  }
#endif


  }

#ifdef DEBUG
    printf("\nDEBUG Exit from DEE");
#endif
  
  fflush(0);

  for(residue_i=1;residue_i<=number_residue;residue_i++){
    for(rotamer_r_id=first_rotamer[residue_i];rotamer_r_id<=last_rotamer[residue_i];rotamer_r_id++){
      dead_single[rotamer_r_id] = TRUE;
    }
  }

  for(residue_i=1;residue_i<=number_residue;residue_i++){
    for(rotamer_r_p=rotamer_list[residue_i];rotamer_r_p;rotamer_r_p = rotamer_r_p->next){
      dead_single[rotamer_r_p->id] = FALSE;
    }
  }

  free(rotamer_list);
  free_list_storage();

  return;  
}
