using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class OrderProcessing : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    DataSet ds = new DataSet();
    int value = 0;
    public int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "Cook")
        {
            Response.Redirect("Invalid.aspx", false);
        }

        FillData();
    }
    protected void FillData()
    {
        try
        {
            ds = ff.FetchData("select * from Orders where sts = 'pending' order by mont asc");
              if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                count++;
            }
            else
                count = 0;
        }
        catch (Exception)
        {
            count = 0;
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            
            string oid = e.CommandArgument.ToString().Trim();
            if (ff.Execute("update orders set sts='paid' where orderid=" + oid.Trim() + " "))
            {
                value = 1;
            }
            else
                value = 0;
        }
        catch (Exception)
        {
            value = 0;
        }
        if (value == 1)
        {
            FillData();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true);
        }
        else if (value == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Operation Failed..!')", true);
        }
    }
}