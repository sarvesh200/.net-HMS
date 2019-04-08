using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class ForgotPassword : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    String msg1="", home="",uid,nps="",ps="";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Register(object sender, EventArgs e)
    {
        try {
            uid = txtuid.Text.Trim();
            DataSet dsu = ff.FetchData("select userid,emailid,usernm from users where userid='" + uid + "'  and sque='" + cmbsques.Text.Trim() + "' and sans='" + txtans.Text.Trim() + "'");
            if (dsu.Tables[0].Rows.Count > 0)
            {
                string[] str = dsu.Tables[0].Rows[0]["emailid"].ToString().Split('@');
                ps = string.Join("", str[0].ToString().Reverse());
                nps = "HT" + "@" + ps;
                if (ff.Execute("update users set pswd='" + nps + "' where userid='" + uid + "'"))
                {


                    if (ff.sendPswdResetMail(dsu.Tables[0].Rows[0]["emailid"].ToString().Trim(), uid, nps, dsu.Tables[0].Rows[0]["usernm"].ToString()))
                    {
                        msg1 = "Your new password is sent to you on your registered email id...";
                    }
                    else
                    {
                        msg1 = "Your new password is " + nps;
                    }
                    home = "Default.aspx";
                    Response.Redirect("Success.aspx?msg=" + msg1 + "&home=" + home, false);
                }
                else
                {
                    msg1 = "Operation Failed!!";
                    home = "Default.aspx";
                    Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home, false);
                }
            }
            else
            {
                msg1 = "Identity Mismatched!!!";
                home = "Default.aspx";
                Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home, false);
            }
        }
        catch(Exception ex) { }
    }
}