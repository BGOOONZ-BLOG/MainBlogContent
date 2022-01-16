package com.adobe.epubcheck.ocf;

import java.io.InputStream;

public class IDPFFontManglingFilter implements EncryptionFilter
{
  private final String uniqueIdentifier;

  public IDPFFontManglingFilter(String Uid)
  {
    uniqueIdentifier = Uid;
  }

  public boolean canDecrypt()
  {
    // TODO we need to pass the concatenated publication IDs (encryption key)
    // and implement de-obfuscation.
    return false;
//		return uniqueIdentifier != null;
  }

  public InputStream decrypt(InputStream in)
  {
    // TODO implement this once we start to validate fonts
    return null;
  }
}
