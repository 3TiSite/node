> micromark > micromark
  micromark-extension-gfm-footnote > gfmFootnote gfmFootnoteHtml
  micromark-extension-gfm-table > gfmTable gfmTableHtml

< option =
  allowDangerousHtml:true
  allowDangerousProtocol:true
  extensions: [
    gfmFootnote()
    gfmTable()
  ]
  htmlExtensions: [
    gfmFootnoteHtml()
    gfmTableHtml()
  ]

< (md)=>
  micromark(
    md
    option
  )
