<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="block-apps">
		<div class="block-3">
			<xsl:for-each select="./*">
			<div>
				<div class="app">
					<div class="left">
						<i class="icon-eniac">
							<xsl:attribute name="style">background-image: url(/app/ant/icons/app-icon-<xsl:value-of select="@id"/>.png);</xsl:attribute>
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