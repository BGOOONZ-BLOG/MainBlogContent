/*
 * Copyright (c) 2011 Adobe Systems Incorporated
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy of
 *  this software and associated documentation files (the "Software"), to deal in
 *  the Software without restriction, including without limitation the rights to
 *  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 *  the Software, and to permit persons to whom the Software is furnished to do so,
 *  subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 *  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 *  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 *  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 *  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

package com.adobe.epubcheck.overlay;

import com.adobe.epubcheck.api.EPUBLocation;
import com.adobe.epubcheck.api.Report;
import com.adobe.epubcheck.messages.MessageId;
import com.adobe.epubcheck.ocf.OCFPackage;
import com.adobe.epubcheck.opf.ContentChecker;
import com.adobe.epubcheck.opf.DocumentValidator;
import com.adobe.epubcheck.opf.ValidationContext;
import com.adobe.epubcheck.xml.XMLParser;
import com.adobe.epubcheck.xml.XMLValidators;
import com.google.common.base.Preconditions;

public class OverlayChecker implements ContentChecker, DocumentValidator
{

  private final ValidationContext context;
  private final Report report;
  private final String path;

  public OverlayChecker(ValidationContext context)
  {
    Preconditions.checkState("application/smil+xml".equals(context.mimeType));
    this.context = context;
    this.report = context.report;
    this.path = context.path;
  }

  public void runChecks()
  {
    OCFPackage ocf = context.ocf.get();
    if (!ocf.hasEntry(path))
    {
      report.message(MessageId.RSC_001, EPUBLocation.create(ocf.getName()), path);
    }
    else if (!ocf.canDecrypt(path))
    {
      report.message(MessageId.RSC_004, EPUBLocation.create(ocf.getName()), path);
    }
    else
    {
      validate();
    }
  }

  public boolean validate()
  {
    int fatalErrorsSoFar = report.getFatalErrorCount();
    int errorsSoFar = report.getErrorCount();
    int warningsSoFar = report.getWarningCount();
    OverlayHandler overlayHandler;
    XMLParser overlayParser = new XMLParser(context);
    overlayHandler = new OverlayHandler(context, overlayParser);
    overlayParser.addValidator(XMLValidators.MO_30_RNC.get());
    overlayParser.addValidator(XMLValidators.MO_30_SCH.get());
    overlayParser.addXMLHandler(overlayHandler);
    overlayParser.process();

    return fatalErrorsSoFar == report.getFatalErrorCount() && errorsSoFar == report.getErrorCount()
        && warningsSoFar == report.getWarningCount();
  }
}
