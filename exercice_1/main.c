#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>

// #define MAX_TAILLE_DATA_KO 16384 // = 16 Mo
#ifndef MAX_TAILLE_DATA_KO
#define MAX_TAILLE_DATA_KO 4096 // Replace 1024 with your default value
#endif


#define CACHE_LINE_SIZE 64 // remplacez ici par la taille de votre ligne cache
int tab[(MAX_TAILLE_DATA_KO * 1024)/sizeof(int)]; // tableau des données accédées
int i; // un compteur de boucle simple
int j; // compteur pour repeter une expérience
int taille_data; // qui correspond à la taille totale des données accédées en Ko
int nbdonnee; // = (taille_data * 1024) / sizeof(int)
struct timeval t1, t2; // variables utilisées pour mesurer le temps d’exécution
int pas= CACHE_LINE_SIZE /sizeof(int); // nombre de données de type int dans une ligne cache
float temps_acces_moyen; //en microsecondes
int nbrepetition = 12;

int main() 
{
    int cls=CACHE_LINE_SIZE;
    int x;
    
    //printf("Temps_acces_moyen,Taille_donnees\n");

    for (taille_data=cls; taille_data <= MAX_TAILLE_DATA_KO * 1024; taille_data=taille_data+cls){
        nbdonnee= (taille_data) / sizeof(int);

        for (i=0; i < nbdonnee ; i=i+pas) { // boucle simple qui pré-charge les données dans le cache L1
            x=x+tab[i];
        } // end for i
        
        gettimeofday(&t1, NULL); // récupérer ici la valeur de l’horloge juste avant la boucle de répétition
        //for (j=0; j < nbrepetition; j++) // boucle de répétiton
        // boucle qui accède aux données pré-chargées dans le cache
            for (i=0; i < nbdonnee ; i=i+pas) x=x+tab[i];
            
        gettimeofday(&t2, NULL); // récupérer la valeur de l’horloge à la fin de la boucle de répétition
        // convertir le temps écoulé en microsecondes
        temps_acces_moyen= (float) ((t2.tv_sec - t1.tv_sec) *1000000 + t2.tv_usec - t1.tv_usec)/ ((nbdonnee /pas) * nbrepetition);
        printf("%f, %d\n", temps_acces_moyen, taille_data);
        //printf("Le temps d’accès moyen est de \%f microsecondes lorsque la taille totale des données accédées est de \%d KO\n", temps_acces_moyen, taille_data);
    } // endfor taille_data
    return 0;
} // end main