package com.adobe.epubcheck.vocab;

public final class DataNavVocab
{
  public static final String URI = "http://www.idpf.org/epub/vocab/structure/#";
  public static final EnumVocab<EPUB_TYPES> VOCAB = new EnumVocab<EPUB_TYPES>(EPUB_TYPES.class,
      URI);

  public static enum EPUB_TYPES
  {
    REGION_BASED;
  }
  
  private DataNavVocab() {}
}
