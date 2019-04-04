﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "evajones"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC sp_ins_visitor @nameTextBox,@emailTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width"/>
<title>Eva Jones Design</title>
<meta name="description" content="Contact Eva Jones. Graphic and web designer living in the Denver area."/>
<meta name="keywords" content="graphic design, web designer, denver desinger, photoshop, dreamweaver, Colorado, contact Eva Jones"/>
<style type="text/css">
@import url("CSS/stylesheet.css");
body {
	background-image: url(images/bkgdContact.jpg);
}
</style>
<!-- Mobile -->
<link href="CSS/mobile.css" rel="stylesheet" type="text/css" media="only screen and (max-width:800px)"/>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css"/>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css"/>
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css"/>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
</head>

<body>
<div id="logo"><img src="images/logo.png" width="220" height="103" alt="Eva Jones Design"/></div>
<nav>
  <ul id="MenuBar1" class="MenuBarHorizontal">
    <li><a href="index.html">home</a>    </li>
    <li><a href="about.html">about</a></li>
    <li><a href="portfolio.html">portfolio</a>    </li>
    <li><a href="contact.html">contact</a></li>
  </ul>
</nav>
<header>
  <h1>contact <span class="fancy">Eva Jones</span></h1>
</header>
<section>
  <h2>Lets connect.</h2>
  <p>Let me help you make a brand, website, logo that will enable you to stand out from the pack. Contact me using the form below, come see me in San Francisco, or email me at <a href="mailto: evajonesdesign@gmail.com">evajonesdesign(at)gmail(dot)com</a>.</p>
  <p><a href="http://maps.google.com/maps?hl=en&cp=43&gs_id=5&xhr=t&bav=on.2,or.r_gc.r_pw.r_qf.&biw=1024&bih=548&q=601+Townsend+Street+San+Francisco,+CA+94103&um=1&ie=UTF-8&hq=&hnear=0x808f7e2cc85c805f:0x1d004618512451f1,601+Townsend+St,+San+Francisco,+CA+94103&gl=us&sa=X&ei=tqIZUKjdDqXmiwK3g4G4Dw&sqi=2&ved=0CAUQ8gEwAA" target="_blank">601 Townsend Street<br>
    San Francisco, CA 94103</a></p>
  <form name="form1" runat="server">
    <span id="nameTextField">
      <label for="name"></label>
      
      <%--<input type="text" name="name" id="name"/>--%>
      <asp:TextBox ID="name" runat="server" />

      <span class="textfieldRequiredMsg">A value is required.</span></span>
    <p><span id="emailTextField">
    <label for="email"></label>

     <%--<input type="text" name="email" id="email"/>--%>
       <asp:TextBox ID="email" runat="server" />

    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></p>
    <p><span id="messageTextArea">
    <label for="message"></label>
    
         <%--<textarea name="message" id="message" cols="45" rows="5"></textarea>--%>
        <asp:TextBox ID="message" runat="server" Height="100px" Width="200px" />

    <span id="countmessageTextArea">&nbsp;</span><span class="textareaRequiredMsg">A value is required.</span><span class="textareaMinCharsMsg">Minimum number of characters not met.</span><span class="textareaMaxCharsMsg">Exceeded maximum number of characters.</span></span></p>
    <p>
      <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
    <br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

    </p>
  </form>
  <p>&nbsp;</p>
</section>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h1>&nbsp;</h1>
<h2>&nbsp;</h2>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var sprytextfield1 = new Spry.Widget.ValidationTextField("nameTextField", "none", {hint:"Your Name", validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("emailTextField", "email", {hint:"Your Email", validateOn:["blur"]});
var sprytextarea1 = new Spry.Widget.ValidationTextarea("messageTextArea", {minChars:1, maxChars:500, counterType:"chars_remaining", counterId:"countmessageTextArea", validateOn:["blur"], hint:"Your Message"});
</script>
</body>
</html>
