using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
public partial class ChangePassword : System.Web.UI.Page
{
    ArrayList val1 = new ArrayList();
    ArrayList val = new ArrayList();
    string ops, nps, rps, uid;
    string msg1 = "", home = "";
    DataSet ds = new DataSet();
    UserManagement ff = new UserManagement();
    protected void Page_Load(object sender, EventArgs e)
    {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        
    }

    protected void btnchange_Click(object sender, EventArgs e)
    {
        try
        {
            uid = Session["uid"].ToString();
            ops = opass.Text.Trim();
            nps = npass.Text.Trim();
            rps = rpass.Text.Trim();
            home = "ChangePassword.aspx";
            if (nps.Equals(rps))
            {

                DataSet ds = ff.FetchData("select * from users where userid='" + uid + "' and pswd='" + ops.Trim() + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {

                    if (ff.Execute("update users set pswd='" + nps + "' where userid='" + uid + "' and pswd='" + ops.Trim() + "'"))
                    {

                        String msg1 = "Password Changed successfully ...";
                        Response.Redirect("Success.aspx?msg=" + msg1 + "&home=" + home,false);

                    }
                    else
                    {
                        msg1 = "Operation Failed!!";
                        Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home,false);
                    }

                }
                else
                {
                    msg1 = "Identity Mismatched!!!";
                   
                    Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home,false);
                }
            }
            else
            {
                msg1 = "Passwords Mismatched!!!";               
                Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home,false);
            }
        }
        catch(Exception ex)
        {
            msg1 = "Operation Failed!!";
            home = "ChangePassword";
            Response.Redirect("Failure.aspx?err=" + msg1 + "&home=" + home, false);
        }
    }
}