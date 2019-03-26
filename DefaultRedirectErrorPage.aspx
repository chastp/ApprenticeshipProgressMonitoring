﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultRedirectErrorPage.aspx.cs" Inherits="DefaultRedirectErrorPage" %>

<!DOCTYPE html>

<script runat="server">
  protected HttpException ex = null;

  protected void Page_Load(object sender, EventArgs e)
  {
    // Log the exception and notify system operators
    ex = new HttpException("defaultRedirect");
    ExceptionUtility.LogException(ex, "Caught in DefaultRedirectErrorPage");
    ExceptionUtility.NotifySystemOps(ex);
  }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
  <title>DefaultRedirect Error Page</title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <h2>
      Apprenticeship Progress Monitoring Application Error Page</h2>
    Standard error message suitable for all unhandled errors. 
    <br />
    <br />
    Return to the <a href='Default.aspx'> Default Page</a>
  </div>
  </form>
</body>
</html>