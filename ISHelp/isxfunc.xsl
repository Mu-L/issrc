<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output doctype-system="isetup.dtd" indent="yes" encoding="utf-8"/>

<xsl:template match="isxhelp">

<xsl:comment>
  Inno Setup
  Copyright (C) 1997-2020 Jordan Russell
  Portions Copyright (C) 2000-2024 Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  This file is automatically generated. Do not edit.
</xsl:comment>

<ishelp version="1">

<xsl:comment>Topics</xsl:comment>

<topic name="scriptfunctions" title="Pascal Scripting: Support Functions Reference">
<keyword value="Pascal Scripting: Support Functions Reference" />
<keyword value="Support Functions Reference" />
<body>

<p>The Pascal script can call several built-in support functions.</p>

<heading>Support functions</heading>

<p>Here's the list of support functions that can be called from within the Pascal script.</p>

<p>Parameter type <tt>AnyString</tt> means both <tt>String</tt> and <tt>AnsiString</tt> can be used.</p>

<p>Parameter type <tt>Array</tt> means any array type can be used.</p>

<xsl:for-each select="isxfunc//category">
<xsl:call-template name="category"/>
</xsl:for-each>

<heading>Constants</heading>

<p>Here's the list of constants used by these functions:</p>

<xsl:for-each select="isxenum/enum">
<xsl:call-template name="enum"/></xsl:for-each>

</body>
</topic>

<xsl:for-each select="isxfunc//function">
<xsl:call-template name="function2"/>
</xsl:for-each>

</ishelp>

</xsl:template>

<xsl:template name="category">
<p>
<b><xsl:value-of select="description"/> functions</b><br />
<xsl:for-each select="subcategory">
<xsl:call-template name="subcategory"/>
</xsl:for-each>
</p>
</xsl:template>

<xsl:template name="subcategory">
<br />
<xsl:for-each select="function">
<xsl:call-template name="function1"/>
</xsl:for-each>
</xsl:template>

<xsl:template name="function1">
<tt><xsl:value-of select="substring-before(prototype, name)"/><link topic="isxfunc_{name}"><xsl:value-of select="name"/></link><xsl:value-of select="substring-after(prototype, name)"/></tt><br />
</xsl:template>

<xsl:template name="enum">
<p>
<i><xsl:apply-templates select="description"/></i><br />
<xsl:apply-templates select="values"/>
</p>
</xsl:template>

<xsl:template name="function2">
<topic name="isxfunc_{name}" title="Pascal Scripting: {name}">
<keyword value="{name}" />
<body>

<p margin="no"><b>Prototype:</b></p>
<p><tt><xsl:value-of select="prototype"/></tt></p>

<p margin="no"><b>Description:</b></p>
<xsl:choose>
<xsl:when test="description">
<xsl:apply-templates select="description"/>
</xsl:when>
<xsl:otherwise>
<p><i>not yet available</i></p>
</xsl:otherwise>
</xsl:choose>

<xsl:choose>
<xsl:when test="remarks">
<p margin="no"><b>Remarks:</b></p>
<xsl:apply-templates select="remarks"/>
</xsl:when>
</xsl:choose>

<xsl:choose>
<xsl:when test="example">
<p margin="no"><b>Example:</b></p>
<xsl:apply-templates select="example"/>
</xsl:when>
</xsl:choose>

<xsl:choose>
<xsl:when test="seealso">
<p margin="no"><b>See also:</b></p>
<xsl:apply-templates select="seealso"/>
</xsl:when>
</xsl:choose>
</body>
</topic>
</xsl:template>

<xsl:template match="p">
<p><xsl:apply-templates/></p></xsl:template>

<xsl:template match="pre">
<pre><xsl:apply-templates/></pre></xsl:template>

<xsl:template match="i">
<i><xsl:apply-templates/></i></xsl:template>

<xsl:template match="b">
<b><xsl:apply-templates/></b></xsl:template>

<xsl:template match="tt">
<tt><xsl:apply-templates/></tt></xsl:template>

<xsl:template match="br">
<br />
</xsl:template>

<xsl:template match="link">
<xsl:choose>
<xsl:when test="@anchor">
  <link topic="{@topic}" anchor="{@anchor}"><xsl:apply-templates/></link>
</xsl:when>
<xsl:otherwise>
  <link topic="{@topic}"><xsl:apply-templates/></link>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="a">
  <extlink href="{@href}"><xsl:apply-templates/></extlink>
</xsl:template>

</xsl:stylesheet>