

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <cfquery name="konular" datasource="MsSqlDatabase">
    SELECT * FROM Konular
</cfquery>

<cfprocessingdirective pageencoding="utf-8">

<!DOCTYPE html>
<html>
    <head>
        <title>Haber Detay</title>
    </head>
   
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
         <div class="container">
   
    
     <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Anasayfa.cfm">Haberler</a>
        </div>

            
          
    </div>
        </nav>
            <br> <br> 
        <div class="container"><!-- Haber Kategori - detaylar -->
            <div class="row">
                <h1 style="text-align: center">En Son Haberler</h1>


                 <div class="container col-md-2">
                <div class="row">
                    <div class="col-md-12">

                        <div class="list-group">

                           
                            <a href="Anasayfa.cfm" class="list-group-item">
                                 <span class="glyphicon glyphicon-filter" style="vertical-align: middle;"> </span> 
                                 <span style="display: inline-block; vertical-align: middle;"> Tümü </span>
                            </a>

                            <cfoutput query="konular">
                                        <a href="Anasayfa.cfm?konuId=#konular.KonuId#" class="list-group-item">
                                         <span class="glyphicon glyphicon-filter" style=" vertical-align: middle;"> </span>
                                         <span style="display: inline-block; vertical-align: middle;">#konular.KonuAdi#   </span>
                                        </a>
                            </cfoutput>
                          </div>                   
                    </div>
                </div>
            </div>

                
                 <div class="container col-md-8 ">

                        <cfparam name="url.haberId" default="">

                        <cfquery name="haberDetay" datasource="MsSqlDatabase">
                                SELECT *
                                FROM Haberler
                                WHERE HaberId = <cfqueryparam value="#url.haberId#" cfsqltype="cf_sql_integer">
                                AND IsDelete = 0;
                        </cfquery>

                        <cfoutput query="haberDetay">
                        
                            <cfif haberDetay.RecordCount>
                            <h1>#haberDetay.Baslik#</h1>
                            <img src="/images/haber_resimleri/#haberDetay.HaberId#.jpg" alt="Haber Resmi">
                            <p>#haberDetay.Icerik#</p>
                            <a href="HaberGuncelle.cfm?haberId=#url.haberId#" class="btn btn-success">Güncelle</a>


                        <cfelse>
                             <h1>Haber Bulunamadı</h1>

                         </cfif>

                        
                        </cfoutput>

                        <a href="Anasayfa.cfm" class="btn btn-primary">Anasayfa</a>

                        

                        



                    



                </div>
              



   
              </div>
               
              
        
            


        </div>


      

    </body>

</html>



