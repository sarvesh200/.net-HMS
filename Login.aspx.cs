using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class Login : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    DataSet ds;
    DataSet ds2;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string id, ps, unm, typ;
            ds = new DataSet();
            id = txtuserid.Text.Trim();
            ps = txtpswd.Text.Trim();
            ds = ff.UserAuth(id, ps);
            int n = ds.Tables[0].Rows.Count;
            if (n > 0)
            {
                id = ds.Tables[0].Rows[0][0].ToString();
                unm = ds.Tables[0].Rows[0][1].ToString();
                typ = ds.Tables[0].Rows[0][3].ToString();
                Session["unm"] = unm;
                Session["uid"] = id;
                Session["utyp"] = typ;
                
                switch (typ)
                {

                    case "Admin":
                        Response.Redirect("Admin.aspx", false);
                        break;
                    case "Cook":
                        Response.Redirect("CookingManager.aspx", false);
                        break;
                    case "Kitchen":
                        Response.Redirect("KitchenManager.aspx", false);
                        break;
                    case "Stock":
                        Response.Redirect("StockManager.aspx", false);
                        break;
                    default:
                        Response.Redirect("Failure.aspx?home=Default.aspx&err=Authentication Failed", false);
                        break;
                }

            }
            else
            {
                lblmsg.Text = "Authentication Failed, Try Again..!";
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Failure.aspx?home=Default.aspx&err=Something went wrong..Try Again", false);
        }
    }
}