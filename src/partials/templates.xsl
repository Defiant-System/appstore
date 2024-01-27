<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="sidebar-categories">
		<ul class="categories">
			<xsl:for-each select="./*">
				<li>
					<xsl:attribute name="data-id"><xsl:value-of select="@id"/></xsl:attribute>
					<xsl:if test="position() = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
					<i><xsl:attribute name="class">icon-<xsl:value-of select="@id"/></xsl:attribute></i>
					<span><xsl:value-of select="@name"/></span>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>


	<xsl:template name="start-page">
		<div class="reel-wrapper">
			<div class="reel">
				<div class="frame canabalt">
					<div class="layer-1"></div>
					<div class="layer-2"></div>
					<div class="layer-3"></div>
					<div class="layer-4"></div>
				</div>

				<div class="frame supermariobros">
					<div class="layer-1"></div>
					<div class="layer-2"></div>
					<div class="layer-3"></div>
					<div class="layer-4"></div>
				</div>
				
				<div class="frame canabalt">
					<div class="layer-1"></div>
					<div class="layer-2"></div>
					<div class="layer-3"></div>
					<div class="layer-4"></div>
				</div>
			</div>
			<ul class="reel-nav">
				<li class="active"></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		
		<div class="block-2">
			<div class="category"></div>
			<div class="category"></div>
		</div>
		
		<div class="block">
			<div class="block-3">
				<xsl:for-each select="./Apps/*">
					<xsl:call-template name="block-app" />
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>


	<xsl:template name="category-list">
		<div class="block">
			<div class="block-3">
				<xsl:for-each select="./*">
					<xsl:call-template name="block-app" />
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>


	<xsl:template name="block-app">
		<div>
			<div class="app">
				<div class="left">
					<i class="icon-eniac">
						<xsl:attribute name="style">background-image: url(/app/<xsl:value-of select="@ns"/>/icons/app-icon-<xsl:value-of select="@id"/>.png);</xsl:attribute>
					</i>
				</div>
				<div class="body">
					<h2><xsl:value-of select="@name"/></h2>
					<h3><xsl:value-of select="../../Categories/i[@id = current()/@type]/@name"/></h3>
				</div>
				<div class="right">
					<div class="button" data-click="open-app">
						<xsl:attribute name="data-arg"><xsl:value-of select="@ns"/>:<xsl:value-of select="@id"/></xsl:attribute>
						Open
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>