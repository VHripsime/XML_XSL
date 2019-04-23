<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<html>
			<head>
				<title> Processor</title>
			</head>
			<body>

				<table border="1">
	<!-- 			<xsl:for-each select="" /> -->
					<tr bgcolor="#9acd32">
						<th> #</th>
						<th>Processor type</th>
						<th>Amount of computers</th>
					</tr>
					<tr>
					<td>1</td>
					<td>Pentium2</td>
					<td><xsl:value-of select="count(cpu[@type = 'Pentium2'])"/></td>
					
					</tr>
					<tr>
					<td>2</td>
					<td>Pentium3</td>
					<td><xsl:value-of select="count(cpu[@type = 'Pentium3'])"/></td>
					
					</tr>
					<!-- <xsl:apply-templates select="equipment/*/*/*" /> -->
				</table>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="equipment/*/*/*">
	<tr>
	<td><xsl:value-of select="position()"></xsl:value-of></td>
	<td>Pentium2</td>
  <td> <xsl:value-of select="count(cpu[@type = 'Pentium2'])"/></td>
	
	</tr>
	
		<!-- <xsl:for-each select="computers/*/*/cpu"> -->
			<!-- <tr> <td> <xsl:value-of select="position()" /> </td> <td> <xsl:value-of 
				select="@type" /> </td> <td> <xsl:value-of select="count(@type)" /> </td> 
				</tr> -->


<!-- 			<tr>
				<td>
					<xsl:value-of select="position()" />
				</td>
				<td>
				Pentium2
				</td>
				<td>
					<xsl:if test="@type ='Pentium2'">
						<xsl:value-of select="count(@type)" />
					</xsl:if>
				</td>
			</tr>
 -->




		<!-- </xsl:for-each> -->

	</xsl:template>

</xsl:stylesheet>