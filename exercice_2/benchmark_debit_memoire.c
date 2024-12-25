#include <sys/time.h>
#include <stdio.h>
#include <stdint.h>

// taille du cache L3 en MB
#define CACHE_SIZE_MB 8
// taille de la ligne de cache en octets
#define CACHE_LINE_SIZE 64

// on fait un grand pas ( 64 / 4 ) * 8 = 16 * 8 = 128
// peut etre augmente a << 4 si besoin
int pas = ( CACHE_LINE_SIZE / sizeof(int) ) << 3;
int i,j,x;
// tableau de 2 fois la taille du cache
int tab[( 2 * CACHE_SIZE_MB * 1024 * 1024 )/sizeof(int)];
struct timeval t1, t2;
float temps_total, temps_moyen;
float debit_o_ns, debit_o_s, debit_mo_s;
int main()
{
    int nbdonnee = ( 2 * CACHE_SIZE_MB * 1024 * 1024 )/sizeof(int);
    for (i=0; i < nbdonnee ; i=i + pas) { // boucle qui accède à des données non consécutives
        // on place les mesures de temps au plus proche de l'acces memoire
        gettimeofday(&t1, NULL);
        x=x+tab[i];
        gettimeofday(&t2, NULL);
        temps_total+=(float)(t2.tv_usec - t1.tv_usec);
    }
    temps_moyen = (temps_total / ((float)nbdonnee/pas)) * 1000;
    printf("temps d'acces moyen : %f nanosecondes\n", temps_moyen);
    debit_o_ns = CACHE_LINE_SIZE/temps_moyen;
    printf("debit : %f o/ns\n", debit_o_ns);
    
    /*
        valeur de base, diviser par 1024 autant de fois que l'on change de grandeur
        ex : 
            Ko/s : debit_o_s / 1024
            Mo/s : debit_o_s / (1024*1024)
            ...
    */
    debit_o_s = debit_o_ns * 1e9; 
    
    debit_mo_s = debit_o_s/(1024*1024);
    printf("debit : %f Mo/s\n", debit_mo_s);
}
