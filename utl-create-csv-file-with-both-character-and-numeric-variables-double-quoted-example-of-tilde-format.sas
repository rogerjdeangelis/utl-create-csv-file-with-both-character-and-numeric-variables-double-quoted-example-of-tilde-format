%let pgm=utl-create-csv-file-with-both-character-and-numeric-variables-double-quoted-example-of-tilde-format;

Create a csv file with both character and numeric variables double quoted example of tilde format;

      1 single datastep
        Author: Søren Lassen, s.lassen@post.tele.dk  (utl_varlist)
      2 two datasteps and proc transpose
        https://tinyurl.com/4upntr8r

The put and input statement are very flexible.

github
https://tinyurl.com/3dud38sf
https://github.com/rogerjdeangelis/utl-create-csv-file-with-both-character-and-numeric-variables-double-quoted-example-of-tilde-format

tom
https://tinyurl.com/4upntr8r
https://communities.sas.com/t5/user/viewprofilepage/user-id/159

sas communities
https://tinyurl.com/emyd78su
https://communities.sas.com/t5/SAS-Programming/Macro-to-export-sas-datset-to-CSV-with-all-columns-both-numeric/m-p/957309#M373717


/**************************************************************************************************************/
/*                           |                                          |                                     */
/*     INPUT                 |         PROCESS                          |      OUTPUT                         */
/*     =====                 |         =======                          |      ======                         */
/*                           |                                          |                                     */
/*   SASHELP.CLASS(          | 1 single datastep tilde modifier         | d:/csv/qcsvrog.csv                  */
/*     obs=5                 |                                          |                                     */
/*     keep=name sex age)    | data _null_;                             | 'NAME'n,'SEX'n,'AGE'n               */
/*                           |                                          | "Alfred","M","14"                   */
/*   NAME      SEX    AGE    |   file "d:/csv/qcsvrog.csv"              | "Alice","F","13"                    */
/*                           |     dsd                                  | "Barbara","F","13"                  */
/*  Alfred      M     14     |     lrecl=1000000;                       | "Carol","F","14"                    */
/*  Alice       F     13     |                                          | "Henry","M","14"                    */
/*  Barbara     F     13     |    put "%utl_varlist(sashelp.class       |                                     */
/*  Carol       F     14     |    ,keep=name sex age                    |    * check csv'                     */
/*  Henry       M     14     |    ,qstyle=sas                           |                                     */
/*                           |    ,od=%str(,))";                        | proc import out=want                */
/*                           |                                          |     datafile="d:/csv/qcsvrog.csv"   */
/*                           |    do until(dne);                        |     dbms=csv                        */
/*                           |       set sashelp.class(                 |     replace;                        */
/*                           |          obs=5                           |     getnames=yes;                   */
/*                           |          keep=name sex age) end=dne;     | run;quit;                           */
/*                           |       put (_all_) (~);                   |                                     */
/*                           |    end;                                  |                                     */
/*                           |                                          | work.want                           */
/*                           |  stop;                                   |                                     */
/*                           |                                          |  NAME      SEX    AGE               */
/*                           |  run;quit;                               |                                     */
/*                           |                                          |  Alfred      M     14               */
/*                           |                                          |  Alice       F     13               */
/*                           |                                          |  Barbara     F     13               */
/*                           |                                          |  Carol       F     14               */
/*                           |                                          |  Henry       M     14               */
/*                           |                                          |                                     */
/*                           |--------------------------------------------------------------------------------*/
/*                           |                                          |                                     */
/*                           |   2 two datasteps and proc transpose     |                                     */
/*                           |   ===================================    | "NAME","SEX","AGE"                  */
/*                           |                                          | "Alfred","M","14"                   */
/*                           |   proc transpose                         | "Alice","F","13"                    */
/*                           |     data=sashelp.class(obs=0)            | "Barbara","F","13"                  */
/*                           |     out=names;                           | "Carol","F","14"                    */
/*                           |     var _all_ ;                          | "Henry","M","14"                    */
/*                           |   run;quit;                              |                                     */
/*                           |                                          |                                     */
/*                           |   data _null_;                           |                                     */
/*                           |     file "d:/csv/qcsvtom.csv"            |                                     */
/*                           |         dsd                              |                                     */
/*                           |         lrecl=1000000;                   |                                     */
/*                           |     set names;                           |                                     */
/*                           |     put _name_ ~ @;                      |                                     */
/*                           |   run;                                   |                                     */
/*                           |                                          |                                     */
/*                           |   data _null_;                           |                                     */
/*                           |     file "d:/csv/qcsvtom.csv"            |                                     */
/*                           |         dsd                              |                                     */
/*                           |         mod                              |                                     */
/*                           |         lrecl=1000000;                   |                                     */
/*                           |     set sashelp.class(                   |                                     */
/*                           |          obs=5                           |                                     */
/*                           |          keep=name sex age);             |                                     */
/*                           |     put (_all_) (~);                     |                                     */
/*                           |   run;quit;                              |                                     */
/*                           |                                          |                                     */
/**************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
