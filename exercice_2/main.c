#include <time.h>
#include <stdio.h>
#include <stdint.h>

// 8MB cache L3 donc 2M*sizeof(int)

#define L3_CACHE_SIZE 32768

#define CACHE_LINE_SIZE 64 // remplacez ici par la taille de votre ligne cache
int tab[(L3_CACHE_SIZE * 1024)/sizeof(int)]; // tableau des données accédées
int i; // un compteur de boucle simple
int j; // compteur pour repeter une expérience
int taille_data; // qui correspond à la taille totale des données accédées en Ko
int nbdonnee; // = (taille_data * 1024) / sizeof(int)

struct timespec t1, t2; // variables utilisées pour mesurer le temps d’exécution
int pas= ( CACHE_LINE_SIZE /sizeof(int) ) + 1; // nombre de données de type int dans une ligne cache

float temps_acces_moyen; //en microsecondes
int nbrepetition = 12;

int main()
{
    int cls=CACHE_LINE_SIZE;
    int x;
    int nbdonnee = (L3_CACHE_SIZE*1024)/sizeof(int);
    int iterations = nbdonnee/pas;
    //printf("Temps_acces_moyen,Taille_donnees\n");

    clock_gettime(CLOCK_MONOTONIC, &t1);
    for (i=0; i < nbdonnee; i=i+pas)
    {
        x=x+tab[i];
    }
    clock_gettime(CLOCK_MONOTONIC, &t2);

    long elapsed_ns = (t2.tv_nsec - t1.tv_nsec)/iterations;
    
    printf("Temps écoulé : %llu nanosecondes\n", elapsed_ns);    return 0;
} // end main
