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
		<div class="reel-wrapper" data-show="0">
			<div class="reel">
				<xsl:for-each select="./Reel/*">
				<div class="frame" data-click="open-app">
					<xsl:attribute name="data-arg"><xsl:value-of select="@ns"/>:<xsl:value-of select="@id"/></xsl:attribute>
					<xsl:attribute name="style">background-image: url(/cdn/appstore/reel/<xsl:value-of select="@id"/>.webp);</xsl:attribute>
				</div>
				</xsl:for-each>
			</div>
		</div>
		<ul class="reel-nav" data-click="hero-go">
			<xsl:for-each select="./Reel/*">
			<li>
				<xsl:if test="position() = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
			</li>
			</xsl:for-each>
		</ul>
		
		<div class="block-2">
			<div class="category"></div>
			<div class="category"></div>
		</div>
		
		<div class="block">
			<div class="block-3">
				<xsl:for-each select="./Apps/*">
					<xsl:sort order="descending" data-type="number" select="@done"/>
					<xsl:sort order="ascending" data-type="string" select="@name"/>
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
					<i>
						<xsl:attribute name="style">background-image: url(/app/<xsl:value-of select="@ns"/>/icons/app-icon-<xsl:value-of select="@id"/>.png);</xsl:attribute>
					</i>
				</div>
				<div class="body">
					<h2><xsl:value-of select="@name"/></h2>
					<h3><xsl:value-of select="../../Categories/i[@id = current()/@type]/@name"/></h3>
					<span>Progress</span> 
					<div class="progress"><span>
						<xsl:attribute name="style">width: <xsl:value-of select="@done"/>%;</xsl:attribute>
					</span></div>
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


	<xsl:template name="themes-list">
		<div class="block">
			<div class="block-3">
				<xsl:for-each select="./*">
					<div class="theme">
						<h3><xsl:value-of select="@name"/></h3>
						<div class="preview">
							<xsl:attribute name="style">background-image: url(/cdn/ss-tiny/themes/<xsl:value-of select="@id"/>.webp</xsl:attribute>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>