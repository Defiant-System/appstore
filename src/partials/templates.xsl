<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="sidebar-categories">
		<ul class="categories">
			<li data-id="start">
				<i class="icon-discover"></i>
				<span>Discover</span>
			</li>
			<li data-id="audio" class="active">
				<i class="icon-audio"></i>
				<span>Audio</span>
			</li>
			<li data-id="social">
				<i class="icon-social"></i>
				<span>Social</span>
			</li>
			<li data-id="games">
				<i class="icon-games"></i>
				<span>Games</span>
			</li>
			<li data-id="work">
				<i class="icon-work"></i>
				<span>Work</span>
			</li>
			<li data-id="image">
				<i class="icon-paint"></i>
				<span>Image Processing</span>
			</li>
			<li data-id="system">
				<i class="icon-system"></i>
				<span>System</span>
			</li>
		</ul>
	</xsl:template>


	<xsl:template name="block-apps">
		<div class="block-3">
			<xsl:for-each select="./*">
			<div>
				<div class="app">
					<div class="left">
						<i class="icon-eniac">
							<xsl:attribute name="style">background-image: url(/app/<xsl:value-of select="@ns"/>/icons/app-icon-<xsl:value-of select="@id"/>.png);</xsl:attribute>
						</i>
					</div>
					<div class="body">
						<h2><xsl:value-of select="@name"/></h2>
						<h3><xsl:value-of select="@type"/></h3>
					</div>
					<div class="right">
						<div class="button" data-click="open-app">
							<xsl:attribute name="data-arg"><xsl:value-of select="@ns"/>:<xsl:value-of select="@id"/></xsl:attribute>
							Open
						</div>
					</div>
				</div>
			</div>
			</xsl:for-each>
		</div>
	</xsl:template>

</xsl:stylesheet>