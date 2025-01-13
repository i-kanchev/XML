<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ws="http://www.w3schools.com">
    <xsl:output method="html"/>
    <xsl:template match="ws:catalogue">
        <html>
            <head>
                <title>Entertainment Game Catalogue</title>
                <link rel="stylesheet" href="catalogue.css"/>
                <script src="catalogue.js"></script>
            </head>
            <body>
                <div class="header">
                    <h1 class="main_title">Каталог на видеоигри за развлечение</h1>
                    <div class="filters">
                        <div class="box">
                            <h5 class="tag">Жанр</h5>
                            <select class="genres" id="genre" onchange="filter()">
                                <option>-</option>
                                <xsl:for-each select="ws:genres/ws:genre">
                                    <option value="{@id}">
                                        <xsl:value-of select="current()"/>
                                    </option>
                                </xsl:for-each>
                            </select>
                        </div>
                        <div class="box">
                            <h5 class="tag">Платформи</h5>
                            <select class="platforms" id="platform" onchange="filter()">
                                <option>-</option>
                                <xsl:for-each select="ws:platforms/ws:platform">
                                    <option value="{@id}">
                                        <xsl:value-of select="current()"/>
                                    </option>
                                </xsl:for-each>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="catalogue">
                    <xsl:for-each select="ws:games/ws:game">
                        <div class="game">
                            <h3 class="title"><xsl:value-of select="ws:title"/></h3>

                            <img class="logo" src="{unparsed-entity-uri(ws:logo/@href)}"/>

                            <div class="info">
                                <div class="box">
                                    <h5 class="tag">Разработчик</h5>
                                    <xsl:variable name="devId" select="ws:game_developer/@ref_dev_id"/>
                                    <xsl:variable name="dev" select="/ws:catalogue/ws:developers/ws:developer[@id = $devId]"/>
                                    <div class="content"><xsl:value-of select="$dev"/></div>
                                </div>

                                <div class="box">
                                    <h5 class="tag">Дистрибутор</h5>
                                    <xsl:variable name="pubId" select="ws:game_publisher/@ref_pub_id"/>
                                    <xsl:variable name="pub" select="/ws:catalogue/ws:publishers/ws:publisher[@id = $pubId]"/>
                                    <div class="content"><xsl:value-of select="$pub"/></div>  
                                </div>

                                <div class="box">
                                    <h5 class="tag">Жарнове</h5>
                                    <xsl:for-each select="ws:game_genres/ws:game_genre">
                                        <xsl:variable name="genreId" select="@ref_genre_id"/>
                                        <xsl:variable name="genre" select="/ws:catalogue/ws:genres/ws:genre[@id = $genreId]"/>
                                        <div class="content genre" value="{@ref_genre_id}"><xsl:value-of select="$genre"/></div>
                                    </xsl:for-each>
                                </div> 

                                <div class="box">
                                    <h5 class="tag">Платформи</h5>
                                    <xsl:for-each select="ws:game_platforms/ws:game_platform">
                                        <xsl:variable name="platId" select="@ref_platf_id"/>
                                        <xsl:variable name="plat" select="/ws:catalogue/ws:platforms/ws:platform[@id = $platId]"/>
                                        <div class="content plat"  value="{@ref_platf_id}"><xsl:value-of select="$plat"/></div>
                                    </xsl:for-each>
                                </div> 

                                <div class="box">
                                    <h5 class="tag">Година на пускане</h5>
                                    <div class="content"><xsl:value-of select="ws:release_year"/></div>  
                                </div> 
                            
                                <div class="box">
                                    <h5 class="tag">Възрастова граница</h5>
                                    <div class="content"><xsl:value-of select="ws:PEGI_rating"/></div>  
                                </div>
                            </div>

                            <div class="description">
                                <h5 class="tag">Описание</h5>
                                <div class="description_content"><xsl:value-of select="ws:description"/></div>
                            </div>

                            <div class="gallery">
                                <h5 class="tag">Галерия</h5>
                                <xsl:for-each select="ws:gallery/ws:img">
                                    <img class="image" src="{unparsed-entity-uri(@href)}"/>
                                </xsl:for-each>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>