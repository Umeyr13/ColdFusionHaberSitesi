
<!DOCTYPE html>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <cfprocessingdirective pageencoding="utf-8">



<cfquery name="top5" datasource="MsSqlDatabase">
    SELECT TOP 5 *
    FROM Haberler
   
</cfquery>

<cfquery name="haberler" datasource="MsSqlDatabase">
    SELECT *
    FROM Haberler
    WHERE IsDelete = 0;
   
</cfquery>

<cfquery name="konular" datasource="MsSqlDatabase">
    SELECT * FROM Konular
</cfquery>


<html>
    <head>
        <title>Haberler</title>
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

                navbar içeriği
            
        </div>
    </nav>
                <br> <br> 

        <div class="container"><!-- Haber Kategori ve slider -->
                <div class="row">
                    <h1 style="text-align: center">En Son Haberler </h1>


                    <div class="container col-md-2">
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="list-group">

                                        
                                            <a href="Anasayfa.cfm" class="list-group-item">
                                                <span class="glyphicon glyphicon-filter" style="vertical-align: middle;"> </span> 
                                                <span style="display: inline-block; vertical-align: middle;">Tümü </span>
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

                    <div class="container col-md-8">
                                    <div class="row">
                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                            <img src="https://picsum.photos/800/400" alt="First slide" style="width:100%;">
                                            </div>
                                            <div class="item">
                                            <img src="https://picsum.photos/800/400" alt="Second slide" style="width:100%;">
                                            </div>
                                            <div class="item">
                                            <img src="https://picsum.photos/800/400" alt="Third slide" style="width:100%;">
                                            </div>
                                        </div>
                                        <a class="left carousel-control" href="#carouselExampleControls" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#carouselExampleControls" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                    </div>

                                    <br> <br> <br> 
                                </div>



                    
                    </div>

            </div>

        <div class="container">   <!-- Haber Kartları -->
        <div class="row">
            <div class="col-md-3"> </div>
            <div class=" col-md-9 offset-md-3" >
        </div>
        </div>
            <div class="row">

            <cfparam name="url.konuId" default=""> <!-- değişkeninin varlığını kontrol etme-->

            <cfif url.konuId neq "">  <!--- Seçilen konuya göre haber kartlarını filtreleme --->
                <cfquery name="secilikonu" datasource="MsSqlDatabase">

                    SELECT * FROM Haberler WHERE KonuId = <cfqueryparam value= "#url.konuId#" cfsqltype="cf_sql_integer">
                    AND IsDelete = 0;
                </cfquery>
                </cfif>

                <cfif url.konuId eq "" >
                
                    <cfoutput query="haberler">
                        <div class="col-md-3" >
                            <div class="card" >
                                <img src="https://picsum.photos/id/#haberler.HaberId#/200/300" class="card-img-top" alt="Haber Resmi">
                                <div class="card-body">

                                    <h5 class="card-title">#haberler.Baslik#</h5>
                                    <p class="card-text">#left(haberler.Icerik, 20)# ... </p>
                                    <a href="HaberDetay.cfm?haberId=#haberler.HaberId#"  class=" btn btn-primary"> Detaylar </a>
                                    <br> <br>
                                </div>
                            </div>
                        </div>
                    </cfoutput>

                <cfelse>

                    <cfoutput query="secilikonu">
                        <div class="col-md-3" >
                            <div class="card" >
                                <img src="https://picsum.photos/id/#secilikonu.HaberId#/200/300" class="card-img-top" alt="Haber Resmi">
                                <div class="card-body">

                                    <h5 class="card-title">#secilikonu.Baslik#</h5>
                                    <p class="card-text">#secilikonu.Icerik# </p>
                                    <a href="asd " class=" btn btn-primary"> Detaylar </a>
                                    <br> <br>
                                </div>
                            </div>
                        </div>
                    </cfoutput>
                            





                
                </cfif> 

                <cfhttp url="https://dummyjson.com/posts" method="get" result="httpResponse"></cfhttp>
                    <cfset jsonData = deserializeJson(httpResponse.fileContent)>

                    <form action="Anasayfa.cfm" method="post">
                        <input type="submit" value="Veri Ekle" name="Veriekle">
                    </form>

                    <cfif structKeyExists(form, "Veriekle")>
                        <!--- Her bir post için fake haber oluştur --->
                        <cfloop array="#jsonData.posts#" index="post">
                            <cfquery name="insertHaber" datasource="MsSqlDatabase">
                                INSERT INTO Haberler (KonuId, Baslik, Icerik, IsDelete)
                                VALUES (
                                    <cfqueryparam value="#randRange(1, 3)#" cfsqltype="cf_sql_integer">,
                                    <cfqueryparam value="#post.title#" cfsqltype="cf_sql_varchar">,
                                    <cfqueryparam value="#post.body#" cfsqltype="cf_sql_varchar">,
                                    0
                                )
                            </cfquery>
                        </cfloop>
                    </cfif>

                

            </div>
        </div>

        </div>

    </body>

</html>
