/*
 *
 *  (c) COPYRIGHT INRIA and W3C, 1996-2008
 *  Please first read the full copyright statement in file COPYRIGHT.
 *
 */

#ifdef _WX
#include "wx/wx.h"
#include "wx/xrc/xmlres.h"              // XRC XML resouces
#include "wx/string.h"

#include "AmayaApp.h"
#include "ImageDlgWX.h"

#define THOT_EXPORT extern
#include "amaya.h"
#include "appdialogue_wx.h"
#include "message_wx.h"
#include "registry_wx.h"

static int      MyRef;
static int      Waiting = 0;
static bool     Wait_alt;
static wxFileDialog *p_dlg = NULL;

//-----------------------------------------------------------------------------
// Event table: connect the events to the handler functions to process them
//-----------------------------------------------------------------------------
BEGIN_EVENT_TABLE(ImageDlgWX, AmayaDialog)
  EVT_BUTTON( XRCID("wxID_OPENBUTTON"),   ImageDlgWX::OnOpenButton )
  EVT_BUTTON( XRCID("wxID_BROWSEBUTTON"), ImageDlgWX::OnBrowseButton )
  EVT_BUTTON( XRCID("wxID_CANCEL"),       ImageDlgWX::OnCancelButton )
  EVT_BUTTON( XRCID("wxID_CLEAR"),        ImageDlgWX::OnClearButton )
  EVT_TOOL( XRCID("wxID_INLINE"),         ImageDlgWX::OnPosition ) 
  EVT_TOOL( XRCID("wxID_LEFT"),           ImageDlgWX::OnPosition ) 
  EVT_TOOL( XRCID("wxID_RIGHT"),          ImageDlgWX::OnPosition ) 
  EVT_TOOL( XRCID("wxID_CENTER"),         ImageDlgWX::OnPosition ) 
  EVT_TEXT_ENTER( XRCID("wxID_URL"),      ImageDlgWX::OnOpenButton )
  EVT_TEXT_ENTER( XRCID("wxID_ALT"),      ImageDlgWX::OnOpenButton )
END_EVENT_TABLE()

/*----------------------------------------------------------------------
  ImageDlgWX create the dialog used to select a new image
  params:
    + parent : parent window
    + title : dialog title
    + urlToOpen : the proposed url
    + alt: the suggested alt
    + isSvg is TRUE when creating a SVG image
  returns:
  ----------------------------------------------------------------------*/
ImageDlgWX::ImageDlgWX( int ref, wxWindow* parent, const wxString & title,
                        const wxString & urlToOpen, const wxString & alt,
                        const wxString & filter, int * p_last_used_filter,
                        bool isSvg) :
  AmayaDialog( NULL, ref ),
  m_Filter(filter),
  m_pLastUsedFilter(p_last_used_filter)
{
  wxXmlResource::Get()->LoadDialog(this, parent, wxT("ImageDlgWX"));
  MyRef = ref;
  // waiting for a return
  Waiting = 1;

  // update dialog labels with given ones
  SetTitle( title );
  XRCCTRL(*this, "wxID_LABEL", wxStaticText)->SetLabel( TtaConvMessageToWX( TtaGetMessage(LIB, TMSG_BUTTON_IMG) ));
  XRCCTRL(*this, "wxID_MANDATORY", wxStaticText)->SetLabel( TtaConvMessageToWX( "" ));
  XRCCTRL(*this, "wxID_CLEAR", wxButton)->SetToolTip( TtaConvMessageToWX( TtaGetMessage(AMAYA,AM_CLEAR) ));
  XRCCTRL(*this, "wxID_OPENBUTTON", wxButton)->SetLabel( TtaConvMessageToWX( TtaGetMessage(LIB, TMSG_LIB_CONFIRM) ));
  XRCCTRL(*this, "wxID_BROWSEBUTTON", wxBitmapButton)->SetToolTip( TtaConvMessageToWX( TtaGetMessage(AMAYA, AM_BROWSE) ));
  XRCCTRL(*this, "wxID_CANCEL", wxButton)->SetLabel( TtaConvMessageToWX( TtaGetMessage(LIB, TMSG_CANCEL) ));

  XRCCTRL(*this, "wxID_ALT", wxTextCtrl)->SetValue( alt );
  XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetValue(urlToOpen  );
  // toolbar to select the html position
  wxToolBar* tb = XRCCTRL(*this, "wxID_TOOL", wxToolBar);
  if (isSvg)
    {
      XRCCTRL(*this, "wxID_ALT_LABEL", wxStaticText)->SetLabel( TtaConvMessageToWX( TtaGetMessage (AMAYA, AM_BM_DESCRIPTION) ));
      XRCCTRL(*this, "wxID_POSITION_LABEL", wxStaticText)->Hide();
      tb->Hide();
      Wait_alt = false;
    }
  else
    {
      XRCCTRL(*this, "wxID_ALT_LABEL", wxStaticText)->SetLabel( TtaConvMessageToWX( TtaGetMessage (AMAYA, AM_ALT) ));
      Wait_alt = true;
      XRCCTRL(*this, "wxID_POSITION_LABEL", wxStaticText)->SetLabel( TtaConvMessageToWX( TtaGetMessage (AMAYA, AM_POSITION) ));
      ImgPosition = 0;
      switch (ImgPosition)
        {
        case 1:
          tb->ToggleTool(XRCID("wxID_LEFT"), true);
          break;
        case 2:
          tb->ToggleTool(XRCID("wxID_CENTER"), true);
          break;
        case 3:
          tb->ToggleTool(XRCID("wxID_RIGHT"), true);
          break;
        default:
          tb->ToggleTool(XRCID("wxID_INLINE"), true);
          break;
        }
    }
  SetAutoLayout( TRUE );

  XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetFocus();
#ifdef _WINDOWS
  // select the string
  XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetSelection(0, -1);
#else /* _WINDOWS */
  // set te cursor to the end
  XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetInsertionPointEnd();
#endif /* _WINDOWS */
}

/*----------------------------------------------------------------------
  Destructor. (Empty, as I don't need anything special done when destructing).
  ----------------------------------------------------------------------*/
ImageDlgWX::~ImageDlgWX()
{
  if (Waiting)
  // no return done
    ThotCallback (MyRef, INTEGER_DATA, (char*) 0);
}

/*----------------------------------------------------------------------
  OnClearButton called when the user wants to clear each fields
  params:
  returns:
  ----------------------------------------------------------------------*/
void ImageDlgWX::OnClearButton( wxCommandEvent& event )
{
  XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetValue(_T(""));
}

/*----------------------------------------------------------------------
  -----------------------------------------------------------------------*/
void ImageDlgWX::OnPosition( wxCommandEvent& event )
{
  wxToolBar* tb = XRCCTRL(*this, "wxID_TOOL", wxToolBar);
  int id = event.GetId();
  if ( id == wxXmlResource::GetXRCID(_T("wxID_INLINE")) )
    {
      tb->ToggleTool(XRCID("wxID_INLINE"), true);
      tb->ToggleTool(XRCID("wxID_LEFT"), false);
      tb->ToggleTool(XRCID("wxID_CENTER"), false);
      tb->ToggleTool(XRCID("wxID_RIGHT"), false);
      ImgPosition = 0;
    }
  else if ( id == wxXmlResource::GetXRCID(_T("wxID_LEFT")) )
    {
      tb->ToggleTool(XRCID("wxID_INLINE"), false);
      tb->ToggleTool(XRCID("wxID_LEFT"), true);
      tb->ToggleTool(XRCID("wxID_CENTER"), false);
      tb->ToggleTool(XRCID("wxID_RIGHT"), false);
      ImgPosition = 1;
    }
  else if ( id == wxXmlResource::GetXRCID(_T("wxID_CENTER")) )
    {
      tb->ToggleTool(XRCID("wxID_INLINE"), false);
      tb->ToggleTool(XRCID("wxID_LEFT"), false);
      tb->ToggleTool(XRCID("wxID_CENTER"), true);
      tb->ToggleTool(XRCID("wxID_RIGHT"), false);
      ImgPosition = 2;
    }
  else if ( id == wxXmlResource::GetXRCID(_T("wxID_RIGHT")) )
    {
      tb->ToggleTool(XRCID("wxID_INLINE"), false);
      tb->ToggleTool(XRCID("wxID_LEFT"), false);
      tb->ToggleTool(XRCID("wxID_CENTER"), false);
      tb->ToggleTool(XRCID("wxID_RIGHT"), true);
      ImgPosition = 3;
    }
}

/*----------------------------------------------------------------------
  OnOpenButton called when the user validate his selection
  params:
  returns:
  ----------------------------------------------------------------------*/
void ImageDlgWX::OnOpenButton( wxCommandEvent& event )
{
  char     buffer[MAX_LENGTH];

  if (p_dlg)
    {
      p_dlg->Hide();
      p_dlg->Destroy();
      p_dlg = NULL;
    }
  // get the current url
  wxString url = XRCCTRL(*this, "wxID_URL", wxTextCtrl)->GetValue( );
  if (url.Len() == 0)
    {
      Waiting = 0;
      ThotCallback (MyRef, INTEGER_DATA, (char*) 0);
      TtaRedirectFocus();
      return;
    }

  strncpy( buffer, (const char*)url.mb_str(wxConvUTF8), MAX_LENGTH - 1);
  buffer[MAX_LENGTH - 1] = EOS;
  // give the new url to amaya (to do url completion)
  ThotCallback (BaseImage + ImageURL,  STRING_DATA, (char *)buffer );

  // get the current alt
  wxString alt = XRCCTRL(*this, "wxID_ALT", wxTextCtrl)->GetValue( );
  if (alt.Len() == 0)
    {
      if (Waiting == 1 && Wait_alt)
        {
          // request an alternate
          XRCCTRL(*this, "wxID_MANDATORY", wxStaticText)->SetLabel( TtaConvMessageToWX( TtaGetMessage (AMAYA, AM_ALT_MISSING) ));
          Waiting = 2;
          XRCCTRL(*this, "wxID_ALT", wxTextCtrl)->SetFocus();
          return;
        }
      else
        ImgAlt[MAX_LENGTH - 1] = EOS;
    }
  else
    {
      strncpy (ImgAlt, (const char*)alt.mb_str(wxConvUTF8), MAX_LENGTH - 1);
      ImgAlt[MAX_LENGTH - 1] = EOS;
    }

  // load the image
  // return done
  Waiting = 0;
  ThotCallback (MyRef, INTEGER_DATA, (char*)1);
}

/*----------------------------------------------------------------------
  OnBrowseButton called when the user wants to search for a local file
  params:
  returns:
  ----------------------------------------------------------------------*/
void ImageDlgWX::OnBrowseButton( wxCommandEvent& event )
{
  // Create a generic filedialog
  if (p_dlg)
    {
      p_dlg->Raise();
      return;
    }
  p_dlg = new wxFileDialog
    (this,
     TtaConvMessageToWX( TtaGetMessage (AMAYA, AM_OPEN_URL) ),
     _T(""),
     _T(""), 
     m_Filter,
     wxOPEN | wxCHANGE_DIR /* remember the last directory used. */);

  // set an initial path
  wxString url = XRCCTRL(*this, "wxID_URL", wxTextCtrl)->GetValue( );
  if (url.StartsWith(_T("http")) ||
      url.StartsWith(TtaConvMessageToWX((TtaGetEnvString ("THOTDIR")))))
    p_dlg->SetDirectory(TtaConvMessageToWX(TtaGetDocumentsDir()));
  else
    p_dlg->SetPath(url);
  p_dlg->SetFilterIndex(*m_pLastUsedFilter);
  
  if (p_dlg->ShowModal() == wxID_OK)
    {
      *m_pLastUsedFilter = p_dlg->GetFilterIndex();
      XRCCTRL(*this, "wxID_URL", wxTextCtrl)->SetValue( p_dlg->GetPath() );
      // destroy the dlg before calling thotcallback because it's a child of this
      // dialog and thotcallback will delete the dialog...
      // so if I do not delete it manualy here it will be deleted twice
      if (p_dlg)
	p_dlg->Destroy();
      // simulate the open command
      //OnOpenButton( event );
    }
  else if (p_dlg)
    p_dlg->Destroy();
  p_dlg = NULL;
}

/*----------------------------------------------------------------------
  OnCancelButton called when the user click on cancel button
  params:
  returns:
  ----------------------------------------------------------------------*/
void ImageDlgWX::OnCancelButton( wxCommandEvent& event )
{
  if (p_dlg)
    {
      p_dlg->Hide();
      p_dlg->Destroy();
      p_dlg = NULL;
    }
  // return done
  Waiting = 0;
  ThotCallback (MyRef, INTEGER_DATA, (char*) 0);
  TtaRedirectFocus();
}

#endif /* _WX */
