<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">

        <html>
            <head>
                <script type="text/javascript" src="tre_cartoline.js"></script>
                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <link rel= "stylesheet" href="stile.css"/>
            </head>
            <body>
                <header>
                    <div>
                        <h1 id="TITOLO">
                            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                        </h1>

                        <ul id="menu">
                            <li ><a href="tre_cartoline.html">Home</a></li>                             
                        </ul>
                            
                    </div>
                </header>
                <div id="sottotitolo">
                    <p> Scegli una delle cartoline ricevute da Oliva Tortona per visualizzarne ulteriori informazioni </p>
                </div>
                
                <div id="sottotitolo2">
                            <p> Passa il mouse sopra la cartolina per evidenziare l'elemento rispettivo nella tabella di fianco </p>
                        </div>
                <div id="contenitore_cartoline">
                    <xsl:for-each select="tei:teiCorpus/tei:TEI">
                        <div class="ant_cartolina" id="cartolina{position()}">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:facsimile">
                        <xsl:apply-templates select="tei:surface[2]"/>
                    </xsl:for-each>
                </div>
                
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#cartolina1 .secondari").css("display", "none");
                        $("#cartolina2 .secondari").css("display", "none");
                        $("#cartolina3 .secondari").css("display", "none");
                        $("#sottotitolo2").css("display", "none");
                        $("#cartolina1").click(function(){
                            $("#sottotitolo2").css("display", "block");
                            $("#menu").css("display", "block");
                            $("#TITOLO").css("font-size", "50px");
                            $("#TITOLO").css("text-align", "left");
                            $("#TITOLO").css("margin", "5%");
                            $("#sottotitolo").css("display", "none");
                            $(".titolino").addClass("titolo_modificato");
                            $("#fronte_009").addClass("fronte_modificato");
                            $("#retro_009").addClass("retro_modificato");
                            $(".ant_cartolina").css("width", "100%");
                            $("#cartolina1 .secondari").css("display", "block");
                            $("#cartolina2").css("display", "none");
                            $("#cartolina3").css("display", "none");
                            $("footer").css("margin-top", "-10%");
                        });
                        $("#cartolina2").click(function(){
                            $("#sottotitolo2").css("display", "block");
                            $("#menu").css("display", "block");
                            $("#TITOLO").css("font-size", "50px");
                            $("#TITOLO").css("text-align", "left");
                            $("#TITOLO").css("margin", "5%");
                            $("#sottotitolo").css("display", "none");
                            $(".titolino").addClass("titolo_modificato");
                            $("#fronte_039").addClass("fronte_modificato");
                            $("#retro_039").addClass("retro_modificato");
                            $(".ant_cartolina").css("width", "100%");
                            $("#cartolina2 .secondari").css("display", "block");
                            $("#cartolina1").css("display", "none");
                            $("#cartolina3").css("display", "none");
                            $("footer").css("margin-top", "-10%");
                        });
                        $("#cartolina3").click(function(){
                            $("#sottotitolo2").css("display", "block");
                            $("#menu").css("display", "block");
                            $("#TITOLO").css("font-size", "50px");
                            $("#TITOLO").css("text-align", "left");
                            $("#TITOLO").css("margin", "5%");
                            $("#sottotitolo").css("display", "none");
                            $(".titolino").addClass("titolo_modificato");
                            $("#fronte_063").addClass("fronte_modificato");
                            $("#retro_063").addClass("retro_modificato");
                            $(".ant_cartolina").css("width", "100%");
                            $("#cartolina3 .secondari").css("display", "block");
                            $("#cartolina1").css("display", "none");
                            $("#cartolina2").css("display", "none");
                            $("footer").css("margin-top", "-10%");
                        });
                        
                    });
                </script>
                <footer>
                    <div id="testo_footer"> 
                        <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc"/>
                    </div>
                </footer>

            </body>
        </html>
    </xsl:template>

    <!-- TEMPLATE PER PRENDERE INFORMAZIONI SULLE LETTERE -->
    
        <!-- template generico che richiama tutti i template -->
        <xsl:template match="tei:teiCorpus/tei:TEI">
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            <xsl:apply-templates select="tei:facsimile/tei:surface[1]/tei:graphic/@url"/>
            <xsl:apply-templates select="tei:facsimile/tei:surface[2]/tei:graphic/@url"/>
            <table class="secondari tab_generiche">
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='fronte']/tei:figure/tei:figDesc"/>
                <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author"/>
                <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher"/>
                <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/>
                <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='destination']/tei:p/tei:address/tei:addrLine/tei:g"/>
            </table>
            <table class="secondari tab_specifici" >
                <xsl:attribute name="id">
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title/@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='message']/tei:opener"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='message']/tei:closer"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='num_cartolina']/tei:p/tei:num"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='stamp']/tei:p"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='francobolli']/tei:p"/>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='destination']/tei:p/tei:address"/>
            </table>        
        </xsl:template>


        <!-- titolo cartolina -->
        <xsl:template match="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
            <p class="titolino">
                <xsl:value-of select="."/>
            </p>
        </xsl:template>
        <!-- immagine -->
        <xsl:template match="tei:facsimile/tei:surface/tei:graphic/@url">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="."/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    img_cartolina
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="../../@xml:id"/>
                </xsl:attribute>
                <xsl:attribute name="usemap">
                    <carattere>#mappa_</carattere><xsl:value-of select="../../@xml:id"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:template>
        <!-- casa editrice -->
        <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:publisher">
            <tr> <td class="titolini_tab"> Casa editrice </td> </tr>
            <tr> <td> <xsl:value-of select="."/>, <xsl:value-of select="../tei:pubPlace"/> </td> </tr>
        </xsl:template>
        <!-- mittente -->
        <xsl:template match="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName">
            <tr> <td class="titolini_tab"> Mittente </td> </tr>
            <tr> <td> <xsl:value-of select="."/> </td> </tr>
        </xsl:template>
        <!-- destinatario -->
        <xsl:template match="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName">
            <tr> <td class="titolini_tab"> Destinatario </td> </tr>
            <tr> <td> <xsl:value-of select="."/> </td> </tr>
        </xsl:template>
        <!-- autore -->
        <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author">
            <tr> <td class="titolini_tab"> Autore </td> </tr>
            <tr> <td> <xsl:value-of select="."/> </td> </tr>
        </xsl:template>
        <!-- descrizione immagine -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='fronte']/tei:figure/tei:figDesc">
            <tr> <td class="titolini_tab"> Descrizione </td> </tr>
            <tr> <td> <xsl:value-of select="."/> </td> </tr>
        </xsl:template>
        <!-- segni particolari -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='destination']/tei:p/tei:address/tei:addrLine/tei:g">
            <tr> <td class="titolini_tab"> Segni particolari </td> </tr>
            <tr> <td> <xsl:value-of select="../../../../../../../../../tei:teiHeader/tei:encodingDesc/tei:charDecl/tei:glyph/tei:charProp[1]/tei:value"/> </td> </tr>
        </xsl:template>
        <!-- luogo e data -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='message']/tei:opener">
            <tr> <td class="titolini_tab2"> Luogo e data </td> </tr> 
            <tr> 
                <td>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:placeName"/> <xsl:value-of select="tei:date"/>
                </td>
            </tr>
        </xsl:template>  
        <!-- messaggio -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='message']/tei:closer">
            <tr> <td class="titolini_tab2"> Messaggio </td> </tr> 
            <tr> 
                <td>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:w"/> <xsl:value-of select="tei:signed"/>
                </td>
            </tr>
        </xsl:template> 
        <!-- numero cartolina -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='num_cartolina']/tei:p/tei:num">
            <tr> <td class="titolini_tab2"> Numero cartolina </td> </tr> 
            <tr> 
                <td>
                    <xsl:attribute name="id">
                        <xsl:value-of select="../../@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </td>
            </tr>
        </xsl:template>
        <!-- stampe -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='stamp']/tei:p">
            <tr> <td class="titolini_tab2"> Stampe </td> </tr> 
            <xsl:for-each select="tei:stamp">
                <tr> 
                    <td>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:template>
        <!-- timbri e francobolli -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='francobolli']/tei:p">
            <tr> <td class="titolini_tab2"> Timbri e francobolli </td> </tr> 
            <xsl:for-each select="tei:stamp">
                <tr> 
                    <td>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:template>
        <!-- destinazione -->
        <xsl:template match="tei:text/tei:body/tei:div[@type='retro']/tei:div[@type='destination']/tei:p/tei:address">
            <tr> <td class="titolini_tab2"> Destinazione </td> </tr>
            <xsl:for-each select="tei:addrLine">
                <tr> 
                    <td>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:choose>  
                            <xsl:when test="tei:choice">
                                    <xsl:value-of select="tei:choice/tei:expan"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>  
                        
                        
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:template>
        


        <!-- GENERARE MAPPE -->
        <xsl:template match="tei:surface[2]">
            <map class="Map"> 
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('mappa_', @xml:id)"/>
                </xsl:attribute>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">   
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('retro_', @xml:id)"/>       
                        </xsl:attribute>
                        <xsl:attribute name="shape">
                            <xsl:text>rect</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
                        </xsl:attribute>
                        <xsl:attribute name="onmouseover">
                            <xsl:value-of select="concat('gestoreEvidenzia( &quot;', @xml:id, '&quot;)' )"/>
                        </xsl:attribute>
                        <xsl:attribute name="onmouseout">
                            <xsl:value-of select="concat('gestoreDisEvidenzia( &quot;', @xml:id, '&quot;)' )"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </map>
        </xsl:template>   
    
    
    <!-- TEMPLATE PER PRENDERE INFORMAZIONI GENERALI SITO (FOOTER) -->
    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <h2 id="titolo_info_pubblicazione">Informazioni sulla pubblicazione</h2>
        <div id="info_pubblicazione">
            <xsl:apply-templates select="tei:publicationStmt"/>
            <xsl:apply-templates select="tei:publicationStmt/tei:availability"/>
        </div>
        <h2 id="titolo_info_edizione">Informazioni sull'edizione</h2>
        <div id="info_edizione">
            <xsl:apply-templates select="tei:titleStmt/tei:respStmt[1]"/>
            <xsl:apply-templates select="tei:titleStmt/tei:respStmt[2]"/>
            <xsl:apply-templates select="tei:editionStmt/tei:edition"/>
            <xsl:for-each select="tei:editionStmt/tei:respStmt">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- Pubblicato da e presso -->
    <xsl:template match="tei:publicationStmt">
        <p> Pubblicato da: <xsl:value-of select="tei:publisher"/>, <xsl:value-of select="tei:pubPlace"/> </p> 
        <p> Presso: <xsl:value-of select="tei:distributor"/> - <xsl:value-of select="tei:address/tei:addrLine[1]"/>, <xsl:value-of select="tei:address/tei:addrLine[2]"/> </p> 
    </xsl:template>
    <!-- Licenza -->
    <xsl:template match="tei:publicationStmt/tei:availability">
        <p> Licenza: <xsl:value-of select="."/> </p> 
    </xsl:template>
    <!-- Trascritto da -->
    <xsl:template match="tei:titleStmt/tei:respStmt[1]">
        <p> <xsl:value-of select="tei:resp"/>: <xsl:value-of select="tei:name[1]"/>, <xsl:value-of select="tei:name[2]"/> </p> 
    </xsl:template>
    <!-- Ente di appartenenza-->
    <xsl:template match="tei:titleStmt/tei:respStmt[2]">
        <p> <xsl:value-of select="tei:resp"/>: <xsl:value-of select="tei:name"/> </p>
    </xsl:template>
    <!-- Studenti di ... -->
    <xsl:template match="tei:editionStmt/tei:edition">
        <p> <xsl:value-of select="."/> </p>
    </xsl:template>
    <!-- Compilatore, responsabile scientifico e funzionario responsabile --> 
    <xsl:template match="tei:editionStmt/tei:respStmt">
        <p> <xsl:value-of select="tei:resp"/>: <xsl:value-of select="tei:name"/></p>
    </xsl:template>

</xsl:stylesheet>