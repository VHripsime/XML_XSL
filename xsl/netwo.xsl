<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<HTML>
			<BODY>
				<h2>Network equipment</h2>

				<table border="1">
					<tr bgcolor="#DCDCDC">
						<th>#</th>
						<th>Name</th>
						<th>Type</th>
						<th>Port number</th>
						<th>IP address</th>
						<th>Location</th>
					</tr>

					<xsl:apply-templates select='network' />

				</table>
			</BODY>
		</HTML>
	</xsl:template>




	<xsl:template match="network">
		<TR>
			<td>
				<xsl:apply-templates select="hubs/type" />
			</td>

			<!-- <xsl:apply-templates select="hubs" /> -->

			<!-- <xsl:apply-templates select="hubs/port" /> -->
			<!-- <xsl:apply-templates select="ip" /> <xsl:apply-templates select="location"/> -->
		</TR>
	</xsl:template>

	<xsl:template match="hubs/type">
		<TD>
			<xsl:apply-templates />
		</TD>
	</xsl:template>

	<!-- <xsl:template match="hubs"> <TD> <xsl:apply-templates /> </TD> </xsl:template> 
		<xsl:template match="port"> <TD> <xsl:apply-templates /> </TD> </xsl:template> 
		<xsl:template match="ip"> <TD> <xsl:apply-templates /> </TD> </xsl:template> 
		<xsl:template match="location"> <TD> <xsl:apply-templates /> </TD> </xsl:template> -->


</xsl:stylesheet>